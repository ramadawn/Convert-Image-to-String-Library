# Convert-Image-to-String-Module
by Douglas Oak

The purpose of this Module is to allow users to convert image files to fully custom string outputs. 

# Convert Image to String Module

** Function name = its() (Image To String)

```python

def its(image, val_ord = "0", val_ord_xy = False, val_i = " ", val_type = "s", val_iol = True, 
         val_sol = 0,val_eol = None, val_pvc = 1, val_pvc_type = None, gsi = ", ", 
         gsd = len(image[x,y]), mgs_input = None, gs_type = "s",
         gsiol = False, gs_sol = 0, gs_pvc = 1, gs_pvc_type = None, 
         lsi = "/n", ls_type = "s", ls_iol = False, ls_sol = 0, ls_pvc = 1, 
         ls_pvc_type = None):
```

## Features:
Converts an image into a string with a fully customizable output string format .

## Purpose: 

The purpose of this library is to allow users to convert image files to strings with fully customizable outputs. In doing so, it will allow users to send image data to customized image interpretation software and also allow robotic visual data collecting systems to preform preprossing on the image data before it is outputted to the robot’s CPU. 

# Function Parameters: 

**Value Space Indicator Parameters:**

Indicators seperating each individual value. 
Example: For RGB, red, green and blue would each be seperated by value space indicators.

**1) val_ord (data ordering) (val_ord = "0") :**

(default = starts at position zero increases sequentially)  
Takes in a position value string "xyz" and compares it to the pixel values array [R,G,B] and outputs pixel list with values equal to the position value of the string. For Example if an RGB array was passed with values 201. Then the new RGB array would be B (at position 2) R (at position 0) and G (at position 1) for a final array of BRG.

The new list gets integrated into the string. So an RGB picture reordered to BGR would spit out a string with the pixels values of BRG,

Example an RGB image could be encoded as GBR or BGR etc.

activating this parameter will reduce performance speed by around 25 percent. for a 3 value array.

**this function is not limited to any particular number of values and can handle pixels with any amount of values**

value positions start from zero. So a 5 value pixel will be reordered from position 0-4.

**1a) val_ord_xy (flips x and y postions) (val_ord_xy = False) :**

If this parameter is marked as True, the value of position image x,y will be moved to postion y,x.
This task is done before val_ord so that if Val_ord and val_ord_xy are both active then the position will be moved 
and then the values will be reordered.

**2) val_i (Value Space Indicator)(val_i = “ “):**

default: whitespace

string = “string”
list = “0L”
dictionary = “0D”

The user may define any string, list or dictionary to serve as a seperator for the image array[x,y] values 

**3) val_type (Value Space Data Type)(val_type = ’s‘):**

default: ‘s’

This indicates the date type of value space being used. Indicated as a string.

‘s’  denotes string
‘l’  denotes list
‘d’ denotes dictionary

If data type is string it will embed this string between the values of the output string. 

If the data type is a list, it will embed the values of that list (in string format) as per the instructions provided by parameter 4 ,5, 6 and 7. The list can be accessed sequentially, it can be iterated over.  It can be started at any particular position and it can skip a variable number of postions. 

Dictionary: If the value space value is a dictionary. The fuction will look up the current value in the dictionary and embed the string associated with said value in the dictionary before it is attached to the value of the string.

Example if the current value is 10. The function will look up 10 in the dictionary and if that value is “orange” it will first concatinate “orange” to the end of the output string and then it will concatinate “10” to the end of the string.



**4) val_iol ( iterate over list True or False)(val_iol = True):**

default: ‘True’

Tells the fuction whether or not to iterate over the imput list

**5) val_sol (start in location on list)(val_sol = 0):**

default: 0

tells the fuction where on the list to start reading from

**5a) val_eol (end in location on list) (eol = None):**

default = None

if this parameter is assigned and integer the its fuction will stop reading along the value space indicator list at this postion. It will iterate if val_iol = True.

**6) val_pvc (position value change)(val_pvc = 1):**

default: 1

may be and interget or ‘l’ for list or ‘d’ for dictionary

will increase the position of the list cursor with each read by this amout. Number may be negative. In which case the cursor will bo backwards during each read. 

**7) val_pvc_type  (position value change list or dictionary)(val_pvc_type = None):**

default: None
‘l’ = list
‘d’ = dictionary

allows the user to input a list or dictionary for the postion value change parameter.

If parameter is a dictionary: The current entire x,y value will be used to determine the next position of the of the Value Space list to read from.

If paramter is a list: the fuction will go down the list. (iterating if nesseary) using that value as the position value change parameter.

**Parameters 8, 11 to 15  do the same as above but are used to format the value group indicators. Differences as follows:**


---------------------------------------------------------------------------------------------------------------------------

# Group Space Indicator Parameters:

Indicators seperating each group of values.
Example: For the three values that compose the RGB value. These three values are seperates by the group space.

**8) gsi (value group indicator)(gsi = “,”):**

default (“,”) same as parameter 2 except is used on the value group indicator

**9) gsd (value group distance)(gsd = len(image[x,y]):**

default (x,y array length)

this can be modified to change the size of the image array values.
Example: [r,g,b] with a value of 4 becomes [r,g,b,x]

**10) mgs_input (Modified Group Space Array Input)(mgs_input = None):**

default: None

If the array size has been modified and this value is None then the first value in the next array location will be used.

Example If an array is RGB , Value Group Distance is 4 and this parameter is None then the string will output ‘RGBR/nGBRG/nBRGB/n’ etc

It this value is a list it will iterate down the list (repeating if nessary)  adding the value of the list to the new X position. 

If there are mulitple x positions, the fuction will look for a tuple of values at the current list position and add those values to the x position is sequence  

Example: if an RGB is given a Value Group Distance of 4, (creating a data set called RGBX), then the value of X will be the value of the currrent position on the input list. If the Value Group Distance is 5; creating an array RGBXY, then the fuction will look for a tuple(a,b) at postion n on the list and create the string output RGBAB.

If this value is a Dictionary: Then the current position on the array will be used as the dictionary key and the dictionary value(s) will be used as the x value(s).


For example, for an RGB array beimng converted into a string. These stings would concatinate onto every third position after the value of B. 

**11) gs_type (Group Space Data Type)(gs_type = ’s‘):**

default = ‘s’  (see parameter 3) works as parameter 3 except is used on the value group indicator

**12) gs_iol ( Group Space Iterate Over List True or False)(gsiol = False):**

default = False (see parameter 4) works as parameter 4 except is used on the value group indicator

**13) gs_sol (Group Space Start in Location on List)(gs_sol = 0):**

default = 0 (see parameter 5) works as parameter 5 except used on the value group indicator

**14) gs_pvc (Group Space Position Value Change)(gs_pvc = 1):**

default: 1 (see parameter 6) works as parameter 6 except used on the value group indicator


**15) gs_pvc_type (Group Space Position Value Change List or Dictionary)(gs_pvc_type = None):**

default: None (see parameter 7) works as parameter 7 except used on the value group indicator




# Line Space Indicator Parameters:

Indicators seperating each line in an image.

**16) lsi (Line Space Indicator)(lsi = “/n”):**

default (“/n”) same as parameter 2 except is used on the line space indicator

**17) ls_type (Line Space Data Type)(ls_type = ’s‘):**

default = ‘s’  (see parameter 3) works as parameter 3 except is used on the line space indicator

**18) ls_iol ( Iterate Over List True or False)(ls_iol = False):**

default = False (see parameter 4) works as parameter 4 except is used on the value group indicator

**19) ls_sol (Start in Location on List)(ls_sol = 0):**

default = 0 (see parameter 5) works as parameter 5 except used on the value group indicator


**20) ls_pvc (Position Value Change)(ls_pvc = 1):**

default: 1 (see parameter 6) works as parameter 6 except used on the value group indicator

**21) ls_pvc_type (Position Value Change List or Dictionary)(ls_pvc_type = None):**

default: None (see parameter 7) works as parameter 7 except used on the value group indicator

`
