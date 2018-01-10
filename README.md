# Identicon Image Mask

## Overview:
This is a simple program that applies a user's binary identicon mask to any image they choose.

The script was written in matlab. It fetches the identicon from the page on github that generates them (see <a href=https://github.com/blog/1586-identicons" target="_blank">this link here</a>). The script then parses the identicon for the 5x5 binary mask. This mask is then overlayed on any image that the user desires. Please note the image that the user inputs should be square, if not, it will be resized accordingly. 

## To run the script:
1. Change the imname variable in gen_identicon.m to the path of the image (make sure your matlab path is in order, and make sure the image is square, the program will resize your image to 460x460)
2. Change the git_user to whichever username you want the identicon to be hashed to (preferably your own) in gen_identicon.m
3. Run gen_identicon.m in matlab
4. Currently the output is saved to outIm.png in the top level directory

An example image and user hash are included in the script


