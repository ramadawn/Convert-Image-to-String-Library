#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 10 04:08:28 2017
@author: Douglas Oak
"""

def img_size(image):
    # figures out image size
    #assumes image is some sort of rectangle
    cdef int y = 0
    cdef int x = 0 
    
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
    x = x - 1
    y = y - 1 #size count is off by one
    return x , y 
        
def value_order(pixel, val_ord): #reorders pixel values
    num_values = len(val_ord)
    value_list = []
    cdef int val_ord_i, pixel_value, 
    for i in range(0,num_values,1):
        val_ord_i = int(val_ord[i])#uses val_ord to to decide which pixel to grab and return a list in the new order.
        pixel_value = pixel[val_ord_i]
        value_list.append(pixel_value)
    return value_list

#def value_order_xy(image, x, y):    #converts values for x,y to y,x NOT USED CURRENTLY
    #image_list = [] 
    #for xpos in range(0,xtotal,1):
        #xlist = []
        #for ypos in range(0,ytotal,1):
            #xlist.append(image[ypos,xpos])
        #image_list.append(xlist)
    #return image_list

def pixel_reverse(image, xpos, ypos):  #reverses pixels positions x,y for y,x
    pixel = image[xpos,ypos]
    return pixel
    
        

def its(image, val_ord = '0', val_ord_xy = False, val_i = " ", val_type = "s", val_iol = False, 
         val_sol = 0, val_pvc = 1, val_pvc_type = None, gsi = ", ", 
         gsd = None, mgs_input = None, gs_type = "s",
         gsiol = False, gs_sol = 0, gs_pvc = 1, gs_pvc_type = None, 
         lsi = "/n", ls_type = "s", ls_iol = False, ls_sol = 0, ls_pvc = 1, 
         ls_pvc_type = None):
    
    pixel = []
    output_list = [] #initialize output list
    output_string = "" #initialize output string
    cdef int array_size = 3
    cdef int y = 0
    cdef int x = 0
    cdef int ypos, xpos, arraypos, value
    cdef unicode char_value
    
    x, y = img_size(image) #gets x and y vales of image
    
    for ypos in range(0,y,1):
        for xpos in range (0,x,1):
            
            if val_ord == '0' and val_ord_xy == False:
                pixel = image[ypos,xpos]
            
            elif val_ord != '0' and val_ord_xy == True : 
                pixel = pixel_reverse(image, xpos, ypos)#reverses x and y positions
                pixel = value_order(pixel, val_ord)#get reorded pixels values
            
            elif val_ord_xy == True:
                pixel = pixel_reverse(image, xpos, ypos)
            
            elif val_ord != '0':
                pixel = value_order(pixel, val_ord)
            
            else:
                pixel = image[ypos,xpos]
                
            
                
                
            for arraypos in range(0,array_size,1):
                value = pixel[arraypos]              
                char_value = str(value)
                output_list.append(char_value) #attaches values
                output_list.append(val_i) # value indicator		        
            
            output_list.append(gsi) #attaches group space indicator
           
        output_list.append(lsi) #attaches line space indicator
        
    
    output_string = ''.join(output_list) #converts list to string
    
      
       
    return output_string
