import math


class claster:
    def __init__(self,horizontal_angle, elevation_angle, alpha):
        self.horizontal_angle = horizontal_angle
        self.elevation_angle = elevation_angle
        self.alpha = alpha
        
        self.vector = [
            math.cos(math.radians(elevation_angle)) * math.cos(math.radians(horizontal_angle)),
            math.cos(math.radians(elevation_angle)) * math.sin(math.radians(horizontal_angle)),
            math.sin(math.radians(elevation_angle))
            ]
        

# Leave whole range in single claster
lidar_losless = [
    claster(0,0,180)
]

# Divide whole range into clasters evenly distributed
lidar_even_full = [
    # Top
    claster(0,90,15), # 90 deg up
    # First circle
    claster(0,60,15), 
    claster(72,60,15), # 60 deg up
    claster(144,60,15), # 60 deg up
    claster(-72,60,15), # 60 deg up
    claster(-144,60,15), # 60 deg up
    # Second circle
    claster(0,30,15), 
    claster(40,30,15), # 30 deg up
    claster(80,30,15), # 30 deg up
    claster(120,30,15), # 30 deg up
    claster(160,30,15), # 30 deg up
    claster(-40,30,15), # 30 deg up
    claster(-80,30,15), # 30 deg up
    claster(-120,30,15), # 30 deg up
    claster(-160,30,15), # 30 deg up

    # Third circle
    claster(0,0,15), 
    claster(30,0,15), # 0 deg up
    claster(60,0,15), # 0 deg up
    claster(90,0,15), # 0 deg up
    claster(120,0,15), # 0 deg up
    claster(150,0,15), # 0 deg up
    claster(180,0,15), # 0 deg up
    claster(210,0,15), # 0 deg up
    claster(240,0,15), # 0 deg up
    claster(270,0,15), # 0 deg up
    claster(300,0,15), # 0 deg up
    claster(330,0,15), # 0 deg up

    # Forth circle
    claster(0,-30,15), 
    claster(40,-30,15), # 30 deg down
    claster(80,-30,15), # 30 deg down
    claster(120,-30,15), # 30 deg down
    claster(160,-30,15), # 30 deg down
    claster(-40,-30,15), # 30 deg down
    claster(-80,-30,15), # 30 deg down
    claster(-120,-30,15), # 30 deg down
    claster(-160,-30,15), # 30 deg down

    # First circle
    claster(0,-60,15), 
    claster(72,-60,15), # 60 deg up
    claster(144,-60,15), # 60 deg up
    claster(-72,-60,15), # 60 deg up
    claster(-144,-60,15), # 60 deg up

    # Bottom
    claster(0,-90,15), # 90 deg up
]

def get_lidar_every_30_degrees():
    def calculateAlfa(vertical_angle):
        vertical_rads = math.radians(vertical_angle)
        res_rad = math.atan2(math.sin(math.radians(30)),2*math.cos(math.radians(30))*math.cos(vertical_rads))
        return math.degrees(res_rad)
    clasters = []

    clasters.append([-15, 15, -15, 15])
    middle = 30
    clasters.append([45-calculateAlfa(middle), 45+calculateAlfa(middle), 15, 45])
    middle = 60
    clasters.append([90-calculateAlfa(middle), 90+calculateAlfa(middle), 45, 75])
    return clasters

