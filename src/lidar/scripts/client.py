#!/usr/bin/env python

from copy import deepcopy
from numpy import append
from lidar.srv import lidar, lidarResponse
import sys
import rospy
import PIL
from PIL import Image, ImageDraw, ImageOps
import pathlib
import math
import numpy as np

map = PIL.Image.new("RGB", (400, 400), (0, 150, 255))
ImageOps.expand(map, border=1, fill=(0, 0, 0))

sensitivity = 20
currentPotScans, potScansRemove, potScans = [], [], []


def scanner_mark(scan, centerX, centerY):
    i = 0
    cart = [[0 for x in range(2)] for y in range(359)]
    while i < 359:
        cart[i][0] = int(scan[i][1] * math.cos(scan[i][0] * math.pi / 180) + centerX)
        cart[i][1] = int(scan[i][1] * math.sin(scan[i][0] * math.pi / 180) + centerY)
        i = i + 1

    img = ImageDraw.Draw(map)
    cart = tuple(tuple(i) for i in cart)
    i = 0
    img.polygon(cart, "#ffffff", "#000000")

    while i < 358:
        if i != 359 and abs(scan[i][1] - scan[i + 1][1]) > sensitivity:
            if map.getpixel(
                (
                    int((cart[i][0] + cart[i + 1][0]) / 2),
                    int((cart[i][1] + cart[i + 1][1]) / 2),
                )
            ) != (255, 255, 255):
                currentPotScans.append(
                    (
                        int((cart[i][0] + cart[i + 1][0]) / 2),
                        int((cart[i][1] + cart[i + 1][1]) / 2),
                    )
                )
                img.line(
                    [(cart[i][0], cart[i][1]), ((cart[i + 1][0], cart[i + 1][1]))],
                    fill="green",
                    width=1,
                )
        if i == 359 and abs(scan[i][1] - scan[0][1]) > sensitivity:

            if map.getpixel(
                (int((cart[i][0] + cart[0][0]) / 2), int((cart[i][1] + cart[0][1]) / 2))
            ) != (255, 255, 255):
                currentPotScans.append(
                    (
                        int((cart[i][0] + cart[0][0]) / 2),
                        int((cart[i][1] + cart[0][1]) / 2),
                    )
                )
                img.line(
                    [(cart[i][0], cart[i][1]), ((cart[0][0], cart[0][1]))],
                    fill="green",
                    width=1,
                )
        i = i + 1
    # print(currentPotScans)
    potScans.extend(currentPotScans)
    # print(potScans)
    x = len(potScans) - 1

    if x != -1:
        potScansRemove.extend(potScans)
        while x >= 0:
            if (
                map.getpixel(potScans[x]) == (255, 255, 255)
                or map.getpixel(potScans[x]) == (0, 0, 0)
                # or map.getpixel(potScans[x]) == (0, 128, 0)
            ):

                potScansRemove.remove(potScans[x])
                # print(potScans[x])
                # print("removed^")
            x = x - 1

    potScans.clear()
    potScans.extend(potScansRemove)
    potScansRemove.clear()
    print(potScans)
    currentPotScans.clear()
    img.rectangle([(centerX, centerY), (centerX + 2, centerY + 2)], "red", "red")


def lidar_get(x, y):
    rospy.wait_for_service("scan")
    try:
        service = rospy.ServiceProxy("scan", lidar)
        query = service(x, y)
        scan_array = []
        for i, s in enumerate(query.lidar_array):
            if i % 2:
                scan_array.append((query.lidar_array[i - 1], s))

        return scan_array
    except rospy.ServiceException as e:
        print(f"ERROR: {e}")


def line_remover():
    orig_color = (0, 128, 0)
    replacement_color = (255, 255, 255)
    img = map.convert("RGB")
    data = np.array(img)
    data[(data == orig_color).all(axis=-1)] = replacement_color
    img2 = Image.fromarray(data, mode="RGB")
    img2.save("/home/slydite/robocon/1_lidar/src/lidar/pp/map9.png")


def algo():
    print("here")
    iniX, iniY = 150, 125
    scanner_mark(lidar_get(iniX, iniY), iniX, iniY)
    map.save(f"/home/slydite/robocon/1_lidar/src/lidar/pp/map0.png")
    x = len(potScans) - 1
    lastScan = (iniX, iniY)
    i = 0
    while x > 0:
        y = len(potScans) - 1
        print(f"y in is {y}")
        dist = [0] * len(potScans)
        # dist.append(potScans)
        while y >= 0:
            x0 = potScans[y][0] - lastScan[0]
            y0 = potScans[y][1] - lastScan[1]
            dist[y] = pow(x0, 2) + pow(y0, 2)
            # print(
            #     f"{dist[y]} between {x0}+{y0} and ({potScans[y][0]} - {lastScan[0]})  + ({potScans[y][1]} - {lastScan[1]})"
            # )

            y = y - 1

        lastScan = potScans[dist.index(max(dist))]
        print(lastScan)
        scanner_mark(lidar_get(lastScan[0], lastScan[1]), lastScan[0], lastScan[1])
        map.save(f"/home/slydite/robocon/1_lidar/src/lidar/map{i+1}.png")
        i = i + 1
        # scanner_mark(lidar_get(399, 0), 399, 0)
        x = len(potScans) - 1
        # lastScan=
    # scanner_mark(lidar_get(200, 200), 200, 200)
    # scanner_mark(lidar_get(50, 50), 50, 50)
    # scanner_mark(lidar_get(300, 300), 300, 300)
    # scanner_mark(lidar_get(0, 399), 0, 399)
    print("there")


if __name__ == "__main__":
    if len(sys.argv) == 3:
        x = int(sys.argv[1])
        y = int(sys.argv[2])
    else:
        algo()
