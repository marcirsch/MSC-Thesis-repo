import math


class claster:
    def __init__(self, horizontal_angle, elevation_angle, alpha):
        self.horizontal_angle = horizontal_angle
        self.elevation_angle = elevation_angle
        self.alpha = alpha
        self.vector = []

        self.vector = [
            math.cos(math.radians(elevation_angle)) * math.cos(math.radians(horizontal_angle)),
            math.cos(math.radians(elevation_angle)) * math.sin(math.radians(horizontal_angle)),
            math.sin(math.radians(elevation_angle))
            ]

def get_divided_clasters(horizontal_angle, elevation_angle, alpha, division):
    div_alpha = alpha / division
    clasters = []
    
    if elevation_angle == 90 :
        clasters.append(claster(0, 80, div_alpha))
        clasters.append(claster(0, 85, div_alpha))
        clasters.append(claster(5, 80, div_alpha))
        clasters.append(claster(-5, 85, div_alpha))

        clasters.append(claster(90, 80, div_alpha))
        clasters.append(claster(90, 85, div_alpha))
        clasters.append(claster(95, 80, div_alpha))
        clasters.append(claster(85, 85, div_alpha))

        clasters.append(claster(180, 80, div_alpha))
        clasters.append(claster(180, 85, div_alpha))
        clasters.append(claster(185, 80, div_alpha))
        clasters.append(claster(175, 85, div_alpha))

        clasters.append(claster(270, 80, div_alpha))
        clasters.append(claster(270, 85, div_alpha))
        clasters.append(claster(275, 80, div_alpha))
        clasters.append(claster(265, 85, div_alpha))
    elif elevation_angle == -90:
        clasters.append(claster(0, -80, div_alpha))
        clasters.append(claster(0, -85, div_alpha))
        clasters.append(claster(5, -80, div_alpha))
        clasters.append(claster(-5, -85, div_alpha))

        clasters.append(claster(90, -80, div_alpha))
        clasters.append(claster(90, -85, div_alpha))
        clasters.append(claster(95, -80, div_alpha))
        clasters.append(claster(85, -85, div_alpha))

        clasters.append(claster(180, -80, div_alpha))
        clasters.append(claster(180, -85, div_alpha))
        clasters.append(claster(185, -80, div_alpha))
        clasters.append(claster(175, -85, div_alpha))

        clasters.append(claster(270, -80, div_alpha))
        clasters.append(claster(270, -85, div_alpha))
        clasters.append(claster(275, -80, div_alpha))
        clasters.append(claster(265, -85, div_alpha))
    else:
        e_first = elevation_angle - alpha + div_alpha
        h_first = horizontal_angle - alpha + div_alpha
        for elevation in range(division):
            e_ang = e_first + elevation*2*div_alpha
            for horizontal in range(division):
                h_ang = h_first + horizontal*2*div_alpha
                clasters.append(claster(h_ang, e_ang, div_alpha))

    return clasters



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
    claster(0,-30,13.5), 
    claster(40,-30,13.5), # 30 deg down
    claster(80,-30,13.5), # 30 deg down
    claster(120,-30,13.5), # 30 deg down
    claster(160,-30,13.5), # 30 deg down
    claster(-40,-30,13.5), # 30 deg down
    claster(-80,-30,13.5), # 30 deg down
    claster(-120,-30,13.5), # 30 deg down
    claster(-160,-30,13.5), # 30 deg down

    # Fifth circle
    claster(0,-60,13.5), 
    claster(72,-60,13.5), # 60 deg up
    claster(144,-60,13.5), # 60 deg up
    claster(-72,-60,13.5), # 60 deg up
    claster(-144,-60,13.5), # 60 deg up

    # Bottom
    claster(0,-90,13.5), # 90 deg up
]

def get_lidar_even_3d_4x4(elevation_angles, nums, offsets , division):
    clasters = []
    for j in range(len(nums)):
        num = nums[j]
        spaciing_angle = 360/num
        elevation = elevation_angles[j]
        offset = offsets[j]
        for i in range(num):
            clasters.extend(get_divided_clasters(offset + i*spaciing_angle, elevation, 13.5, division))

    return clasters

def get_lidar_even_2d(num, division):
    clasters = []
    spaciing_angle = 360/num
    for i in range(num):
        clasters.extend(get_divided_clasters(i*spaciing_angle, 0, 13.5, division))
    return clasters

def get_lidar_even_4x4_2d():
    division = 4
    clasters = []

    for i in range(13):
        clasters.extend(get_divided_clasters(i*27.69, 0, 13.5, division))

    return clasters

def get_lidar_even_3x3_2d():
    division = 3
    clasters = []

    for i in range(13):
        clasters.extend(get_divided_clasters(i*27.69, 5, 13.5, division))
    

    return clasters


def get_lidar_even_2x2_2d():
    division = 2
    clasters = []

    for i in range(13):
        clasters.extend(get_divided_clasters(i*27.69, 0, 13.5, division))

    
    return clasters


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

