//Select and save ROIs 

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

//Before running the macro create a new folder to save ROIs
//Remebr to number the ROIs (i.e. ROI1, ROI2 etc.) in the TitleWindow  before saving them 

//------------------------------------------------------------------------------------------------------//

//THE MACRO CODE:
//Select directory of images to open
input = getDirectory("Input directory where images are stored");

list = getFileList(input);

setBatchMode(false);
for (i=0; i<list.length; i++) {
   images = input+list[i];
   showProgress(i, list.length);
   open(images);
        
        {
         setTool("Oval");
         run("Select None");
         makeOval(460, 429, 38, 42)
         ;
         waitForUser("Move ROI to collagen and then press OK");
         run("Duplicate...", "");
         run("Clear Outside");
         saveAs("Tiff" + "overlay", "");
         close();

         waitForUser("Move ROI to collagen and then press OK");
         run("Duplicate...", "");
         run("Clear Outside");
         saveAs("2.Tiff" + "overlay", "");
         close();

         waitForUser("Move ROI to collagen and then press OK");
         run("Duplicate...", "");
         run("Clear Outside");
         saveAs("Tiff" + "overlay", "");
         close();

         waitForUser("Move ROI to collagen and then press OK");
         run("Duplicate...", "");
         run("Clear Outside");
         saveAs("Tiff" + "overlay", "");
         close();
         close();
         Add_region=getBoolean("Option","N/A", "Continue to next Image");
        }
}

