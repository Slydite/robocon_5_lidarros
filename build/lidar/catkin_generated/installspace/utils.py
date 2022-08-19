import PIL
from PIL import Image,ImageDraw
import pathlib
import math
import matplotlib.pyplot as plt
from PIL import ImageFilter

# This stores the map created by lidar
map = PIL.Image.new(mode="1", size=(400,400))

def plot_reading_on_map(centerX, centerY, lidar_reading, map):
    '''This plots the collected lidar data on map'''
    for i, reading in enumerate(lidar_reading):

        try:
            '''As the angle given by lidar is integral,
            if we try to map all the points where lidar's light could pass,
            we see that the generated map doesnt show the points between two light rays.
            So here I have collected two consecutive points which lidar has detected,which are
            expected to be at a very close distance,and then collect all the points inside the
            triangle formed by these points-
            1.point where the sensor is
            2 and 3.The close consecutive points
            Credits-MATH calculus course :)
            '''
            i0 = reading[0]
            r0 = reading[1]

            i1 = lidar_reading[i+1][0]
            r1 = lidar_reading[i+1][1]

            x0 = int(r0*math.cos(i0*math.pi/180)+centerX)
            y0 = int((r0*math.sin(i0*math.pi/180)+centerY))

            x1 = int(r1*math.cos(i1*math.pi/180)+centerX)
            y1 = int((r1*math.sin(i1*math.pi/180)+centerY))

            draw = ImageDraw.Draw(map)
            draw.polygon([(centerX, centerY), (x0, y0),
                         (x1, y1)], fill=255, outline=255)

        except:
            # to avoid encountering error at the edges
            continue
    
