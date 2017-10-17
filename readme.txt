To get started copy all files into a folder on your computer and run Ogawa.exe.

This software requires MCR2015b to run (similar to a .docx file needing Microsoft Word to open). You should get prompted to install it, otherwise you can locate it here https://au.mathworks.com/products/compiler/mcr.html and install it first.

Ogawa can be used to sort high density grids very quickly. 
The app uses the ROI of sort-bucket 1. This means that you 
need to have selected a ROI to sort and have placed it in the 
left most population to sort in the sort layout window in Sortware. 
The app moves the deflected stream in increments subtracting the voltage, 
i.e. the stream will move in increments to the left once started, 
followed by down in the Y direction, and subsequently in the X direction 
if chosen.
'(1) Have Sortware connected, and acquiring data.'; 
'(2) Ensure you have selected the population that you want sorted as the left most population to be sorted in the sort layout.';
'(3) Adjust the stream deflection voltage to be where you want the first drop to go. The next drop will go left of this.';
'(4) Configure sort grid as desired in the Ogawa window.';
'(5)*Only necesary if instrument has not sorted anything since power on. Only done once!* Click Sort to begin the sort and then stop the sort. This initialises the sort bucket and enables the stream.',;,'Click start to begin!.';
'(6) The app will start sorting the x direction by changing stream deflection voltages, followed by moving in the Y direction, followed by moving in the x direction by the number in the step size box.';
'(7) Once completed it will stop sorting.

MIT License

Copyright (c) 2017 Suat Dervish

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
