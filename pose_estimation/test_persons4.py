import math
import numpy as np

def test_data(arg):

    pi = math.pi

    person1 = [5,5.5, pi - pi/4]
    person2 = [4,5,pi/4]
    person3 = [6,4,pi + pi/4]
    person4 = [1,8,3*pi/2]

    array = [person1, person2, person3, person4]
    if arg == "print" :
        print(array)
    return array

