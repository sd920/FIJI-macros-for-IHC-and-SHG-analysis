//Batch GLCM TextureToo analysis

//Author: Samuele Di Carmine, sd920@ic.ac.uk
//Version 1.0
//July 13, 2021
//License: BSD3

// Copyright 2021 Samuele Di Carmine, Imperial College London

// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


//Feel free to distribute and modify this macro freely.
//------------------------------------------------------------------------------------------------------//

//THE MACRO CODE:
//Select directory of images to open
input = getDirectory("Input directory where images are stored");

//Select different location where images/results are to be stored
Output = getDirectory("Output ditrectory for results");
 
list = getFileList(input);
 
//Auto BatchMode for GLCM 0°
{setBatchMode(true);
 print("#,","Angular Second Moment,","Contrast,","Correlation,","Inverse Difference Moment,","Entropy,");
 for (i=0; i<list.length; i++) {
 	
    images = input+list[i];
    showProgress(i, list.length);
    open(images);  
    name = getTitle;      
       
        {	
         run("8-bit");
         run("GLCM TextureToo", "enter=1 select=0 angular contrast correlation inverse entropy");
         close();
         asm = getResult("Angular Second Moment",0); 
         contrast = getResult("Contrast",0);
         correlation = getResult("Correlation",0);
         idm = getResult("Inverse Difference Moment   ",0); 
         entropy = getResult("Entropy",0);
         print(list[i],",",asm,",",contrast,",",correlation,",",idm,",",entropy);
        }
    }

// Save the "GLCM 0" table in .xls format
    path = Output + "GLCM 0.xls";
    string = getInfo("log");
    File.saveString(string, path); 
    close("Log");
    close(""); 
    close("");    
 }


//Auto BatchMode for GLCM 45°
{setBatchMode(true);
 print("#,","Angular Second Moment,","Contrast,","Correlation,","Inverse Difference Moment,","Entropy,");
 for (i=0; i<list.length; i++) {
 	
    images = input+list[i];
    showProgress(i, list.length);
    open(images);  
    name = getTitle;      
        
        {	
         run("8-bit");
         run("GLCM TextureToo", "enter=1 select=45 angular contrast correlation inverse entropy");
         close();
         asm = getResult("Angular Second Moment",0); 
         contrast = getResult("Contrast",0);
         correlation = getResult("Correlation",0);
         idm = getResult("Inverse Difference Moment   ",0); 
         entropy = getResult("Entropy",0);
         print(list[i],",",asm,",",contrast,",",correlation,",",idm,",",entropy);
        }
    }

// Save the "GLCM 45" table in .xls format
    path = Output + "GLCM 45.xls";
    string = getInfo("log");
    File.saveString(string, path); 
    close("Log");
    close(""); 
    close("");   
 }


//Auto BatchMode for GLCM 90°
{setBatchMode(true);
print("#,","Angular Second Moment,","Contrast,","Correlation,","Inverse Difference Moment,","Entropy,");
for (i=0; i<list.length; i++) {
   
   images = input+list[i];
   showProgress(i, list.length);
   open(images);  
   name = getTitle;      
   
        {
         run("8-bit");
         run("GLCM TextureToo", "enter=1 select=90 angular contrast correlation inverse entropy");
         close();
         asm = getResult("Angular Second Moment",0); 
         contrast = getResult("Contrast",0);
         correlation = getResult("Correlation",0);
         idm = getResult("Inverse Difference Moment   ",0); 
         entropy = getResult("Entropy",0);
         print(list[i],",",asm,",",contrast,",",correlation,",",idm,",",entropy);
        }
    }

// Save the "GLCM 90" table in .xls format
    path = Output + "GLCM 90.xls";
    string = getInfo("log");
    File.saveString(string, path); 
    close("Log");
    close(""); 
    close("");   
 }


//Auto BatchMode for GLCM 135°
{setBatchMode(true);
print("#,","Angular Second Moment,","Contrast,","Correlation,","Inverse Difference Moment,","Entropy,");
for (i=0; i<list.length; i++) {
   
   images = input+list[i];
   showProgress(i, list.length);
   open(images);  
   name = getTitle; 
        
        {
         run("8-bit");
         run("GLCM TextureToo", "enter=1 select=135 angular contrast correlation inverse entropy");
         close();
         asm = getResult("Angular Second Moment",0); 
         contrast = getResult("Contrast",0);
         correlation = getResult("Correlation",0);
         idm = getResult("Inverse Difference Moment   ",0); 
         entropy = getResult("Entropy",0);
         print(list[i],",",asm,",",contrast,",",correlation,",",idm,",",entropy);
        }
    }

// Save the "GLCM 135" table in .xls format
    path = Output + "GLCM 135.xls";
    string = getInfo("log");
    File.saveString(string, path); 
    close("Log");
    close(""); 
    close("");   
 }

//------------------------------------------------------------------------------------------------------//
//!IMPORTANT! !IMPORTANT! !IMPORTANT! !IMPORTANT! !IMPORTANT! !IMPORTANT! 

//To divide text into a .xls table by transforming commas into columns:

        // Open excel file OrientationJResults.xls
        // Highlight the column that contains the list 
        // Go to -Data> Text To Columns-
        // Choose -Delimited- and Click -Next-
        // Choose -Comma- and Click -Next-
        // Choose -General- or -Text-
        // Leave -Destination- as it is or choose another column
        // Click -Finish-

//Data is now divided into columns 