#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 10 04:08:28 2017

@author: Douglas Oak
"""
#import matplotlib.image as mping
#import matplotlib.pyplot as plt
 


def img_size(image):
    # figures out image size
    #assumes image is some sort of rectangle
    y = 0
    x = 0 
    
    while True: #figures out size of x
        try:
            position_test = image[0,x]
            x = x + 1
    
        except:
            break
    
    while True: #figures out size of y
        try: 
            position_test = image[y,0]
            y = y + 1
        
        except:
            break
    
    return x , y 
        
    

def its(image, val_ord = 0, val_i = " ", val_type = "s", val_iol = False, 
         val_sol = 0, val_pvc = 1, val_pvc_type = None, gsi = ", ", 
         gsd = None, mgs_input = None, gs_type = "s",
         gsiol = False, gs_sol = 0, gs_pvc = 1, gs_pvc_type = None, 
         lsi = "/n", ls_type = "s", ls_iol = False, ls_sol = 0, ls_pvc = 1, 
         ls_pvc_type = None):
    
    output_string = ""
    array_size = 3
    
    x, y = img_size(image) #gets x and y vales of image
    
    x = x - 1
    y = y - 1
    
    for ypos in range(0,y,1):
        for xpos in range (0,x,1):
            for arraypos in range(0,array_size,1):
                output_string = output_string + str(image[y,x][arraypos]) + val_i #attaches vales with vs indicator
                
            output_string = output_string + gsi #attaches group space indicator
        output_string = output_string + lsi #attaches line space indicator
        #print(output_string)
        #print(ypos, xpos)
        #print(len(output_string))
        #input("press")
    return output_string


#image = mping.imread('test.jpg')
#plt.imshow(image)
#output = its(image)
#print(output)