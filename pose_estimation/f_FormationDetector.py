import numpy as np
import test_persons4
import generate_OspaceCombinations



persons = test_persons4.test_data()# input "print" into argument, if person data shall be written to terminal
#### test data 
num_persons = 4


# 1. Grab (x,y, orientation) of each person detected
# 2. Contruct the data as a list inside a list
# 3. Remove any person who is more than 3m away from anogther person
# 4. Define all posible O-space combinations, based on the num of persons detected
# 5. Construct these O-spaces (as polygons)
# 6. Check O-spaces
# 6.1. Remove O-space if a person is inside a O-space 
#################################################################################################################
#1. 

#2.

#3.
# Jonathan / Vinh code here

#4. input number of people detected
oSpace_combinations = generate_OspaceCombinations.oSpaceCombinations()

#5. 