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

# Deals with value indicator parameters that are lists     
def what_is_val_i_list(val_i_storage, last_position, val_iol, val_pvc, val_sol, val_eol):
    val_i_list_len = len(val_i_storage)  
    val_i_list_len = val_i_list_len - 1
    cdef int val_i_position
    val_i_position = last_position #to increase readability of code
    cdef int val_test
    if val_iol == True: # fixes problem with and statements and boolians
        val_test = 1
    else:
        val_test = 0
    
    if val_eol != None:
        if val_sol > val_eol:
            if val_i_position < val_eol and val_test == 1:
                val_i_position = val_sol
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc
                return val_i, val_i_position
            else: 
                if val_i_position < val_eol and val_test == 0:
                    val_i_position = val_i_position - val_pvc
                    val_i = val_i_storage[val_i_position]
                    val_i_position = val_i_position + val_pvc
                    return val_i, val_i_position
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc
                return val_i, val_i_position
                
            
            
    
    #checks for list iteration boundries
 
 #if pvc is positive and eol None, list will iterate from sol and actual end of list   
    if val_pvc > 0: 
        if val_eol == None:
            if val_i_position > val_i_list_len and val_test == 1:
                val_i_position = val_sol
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc
                #print("val_i_position > val_i_list_len & val_iol == True")
                return val_i, val_i_position
            
            else: #if the list does not iterate put the counter back tp prev position
                if val_i_position > val_i_list_len and val_test == 0:
                    val_i_position = val_i_position - val_pvc
                    val_i = val_i_storage[val_i_position]
                    #print("val_i_position > val_i_list_len & val_iol == False")
                    return val_i, val_i_position   
                
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc #change list pionter by pvc
                #print("val_i_position is NOT > val_i_list_len & val_iol == TRUE")
                return val_i, val_i_position   
                
            
 #if pvc is positive and eol is an integer list will iterate from sol and eol    
        elif val_i_position > val_eol and val_test == 1: 
                val_i_position = val_sol
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc
                #print("val_i_position > val_eol & val_iol == True")
                return val_i, val_i_position
        
        else:
                if val_i_position > val_eol and val_test == 0:
                    val_i_position = val_i_position - val_pvc
                    val_i = val_i_storage[val_i_position]
                    #print("val_i_position > val_eol & val_iol == False")
                    return val_i, val_i_position
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc #change listprint(output_list)
                #print("val_i_position is NOT > val_eol & val_iol == True")
                return val_i, val_i_position 
        
        
 
 #if pvc is negative and eol is an integer list will iterate from eol to sol  
    elif val_pvc < 0: 
        if val_eol == None:
            if val_i_position < 0 and val_test == 1:
                val_i_position = val_i_list_len
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc
                #print("val_i_position < 0 & val_iol == True")
                return val_i, val_i_position
        
            else: #if the list does not iterate put the counter back tp prev position
                if val_i_position < 0 and val_test == 0:
                    val_i_position = val_i_position - val_pvc
                    val_i = val_i_storage[val_i_position]
                    #print("val_i_position < 0 & val_iol == False")
                    return val_i, val_i_position   
                val_i = val_i_storage[val_i_position]
                val_i_position = val_i_position + val_pvc #change list pionter by pvc
                #print("val_i_position is NOT < 0 & val_iol == True")
                return val_i, val_i_position   
            
        elif val_i_position < val_sol and val_test == 1:
            val_i_position = val_eol
            val_i = val_i_storage[val_i_position]
            val_i_position = val_i_position + val_pvc
            #print("val_i_position < val_sol & val_iol == True")
            return val_i, val_i_position
        
        else:
            if val_i_position < val_sol and val_test == 0:
                val_i_position = val_i_position - val_pvc
                val_i = val_i_storage[val_i_position]
                #print("val_i_position < val_sol & val_iol == False")
                return val_i, val_i_position 
            val_i = val_i_storage[val_i_position]
            val_i_position = val_i_position + val_pvc #change list pionter by pvc
            #print("val_i_position is NOT < val_sol & val_iol == True")
            return val_i, val_i_position 
    
    else:#if val_pvc = 0
        val_i = val_i_storage[val_i_position]
        print("if val_pvc = 0")
        return val_i, val_i_position
        
        
    error = "Error: incorrect parameter value used"
    return error, val_i_position        
        
            
        
def what_val_i_dict_value(val_i_storage, key): #recieved dictionary and key and returns value
    value = val_i_storage.get(key)
    if value == None:
        value = 'None'
    return value  

def what_val_pvc_dict_value(val_pvc_type_storage, key):
    value = val_pvc_type_storage.get(key)
    if value == None:
        value = 1
    return value 

def val_pvc_return(val_pvc_type_storage, val_pvc_last_position):# deals with val_pvc that are lists
    val_pvc_list_len = len(val_pvc_type_storage)  
    val_pvc_list_len = val_pvc_list_len - 1
    if val_pvc_last_position > val_pvc_list_len:
       val_pvc_last_position = 0 
    val_pvc = val_pvc_type_storage[val_pvc_last_position]
    val_pvc_new_position = val_pvc_last_position + 1
    return val_pvc, val_pvc_new_position
    
    
def its(image, val_ord = "0", val_ord_xy = False, val_i = " ", val_type = "s", val_iol = True, 
         val_sol = 0, val_eol = None, val_pvc = 1, val_pvc_type = 'i', gsi = ", ", 
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
    cdef int ypos, xpos, arraypos, value, val_i_last_position, val_pvc_last_position, val_pvc_new_position
    cdef int val_i_position = val_sol
    cdef unicode char_value
    val_pvc_last_position = 0
    val_i_storage = val_i #if val_i is a list of dictionary it is stored here so val_i can be retasked
    val_pvc_type_storage = val_pvc #if val_pvc_type is a list of dictionary it is stored here so val_pvc_type can be retasked
    val_i = 'start'
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
                
                if val_pvc_type != 'i': #figures out position value change for pionter on value indicator list
                
                    if val_pvc_type == 'l':
                        val_pvc, val_pvc_new_position = val_pvc_return(val_pvc_type_storage, val_pvc_last_position)
                        val_pvc_last_position = val_pvc_new_position
                    
                    else: 
                        
                        print("Val_i = ",val_i)
                        print("val_i_storage = ",val_i_storage)
                        val_pvc = what_val_pvc_dict_value(val_pvc_type_storage, val_i)
                        print("val_pvc = ",val_pvc)
                if val_type != 's'and val_type == 'l': #figures out what the value indicator is
                    val_i_last_position = val_i_position
                
                    
                    print("val_pvc_type_storage = ",val_pvc_type_storage)
                    print("last_position = ",val_i_last_position)
                    print("Val_i = ",val_i)
                    print("Position = ",val_i_position)
                    
                    val_i, val_i_position = what_is_val_i_list(val_i_storage, val_i_last_position, val_iol, val_pvc, val_sol, val_eol) #if val_type is a list or dictionary
                    
                    output_list.append(val_i)
                    
                    
                elif val_type == 'd':
                    val_i = what_val_i_dict_value(val_i_storage, char_value)
                    output_list.append(val_i)
                    
                else:
                    output_list.append(val_i) # value indicator	
                print(output_list)
                input("press")
            output_list.append(gsi) #attaches group space indicator
           
        output_list.append(lsi) #attaches line space indicator
        
    
    output_string = ''.join(output_list) #converts list to string
    
      
       
    return output_string
