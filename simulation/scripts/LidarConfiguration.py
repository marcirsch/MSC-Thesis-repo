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
    claster(0,90,13.5), # 90 deg up
    # First circle
    claster(0,60,13.5), 
    claster(72,60,13.5), # 60 deg up
    claster(144,60,13.5), # 60 deg up
    claster(-72,60,13.5), # 60 deg up
    claster(-144,60,13.5), # 60 deg up
    # Second circle
    claster(0,30,13.5), 
    claster(40,30,13.5), # 30 deg up
    claster(80,30,13.5), # 30 deg up
    claster(120,30,13.5), # 30 deg up
    claster(160,30,13.5), # 30 deg up
    claster(-40,30,13.5), # 30 deg up
    claster(-80,30,13.5), # 30 deg up
    claster(-120,30,13.5), # 30 deg up
    claster(-160,30,13.5), # 30 deg up
    # Third circle
    claster(0,0,13.5), 
    claster(1*27.69,0,13.5), # 0 deg up
    claster(2*27.69,0,13.5), # 0 deg up
    claster(3*27.69,0,13.5), # 0 deg up
    claster(4*27.69,0,13.5), # 0 deg up
    claster(5*27.69,0,13.5), # 0 deg up
    claster(6*27.69,0,13.5), # 0 deg up
    claster(7*27.69,0,13.5), # 0 deg up
    claster(8*27.69,0,13.5), # 0 deg up
    claster(9*27.69,0,13.5), # 0 deg up
    claster(10*27.69,0,13.5), # 0 deg up
    claster(11*27.69,0,13.5), # 0 deg up
    claster(12*27.69,0,13.5), # 0 deg up
    # Forth circle
    claster(0,-30,13), 
    claster(40,-30,13), # 30 deg down
    claster(80,-30,13), # 30 deg down
    claster(120,-30,13), # 30 deg down
    claster(160,-30,13), # 30 deg down
    claster(-40,-30,13), # 30 deg down
    claster(-80,-30,13), # 30 deg down
    claster(-120,-30,13), # 30 deg down
    claster(-160,-30,13), # 30 deg down

    # Fifth circle
    claster(0,-60,13), 
    claster(72,-60,13), # 60 deg up
    claster(144,-60,13), # 60 deg up
    claster(-72,-60,13), # 60 deg up
    claster(-144,-60,13), # 60 deg up

    # Bottom
    claster(0,-90,13), # 90 deg up
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

