//Batch OrientationJ analysis

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
 
//Auto BatchMode for OrientationJ
run("Table...", "name=Results width=400 height=200");
print("[Results]", "Sample, Orientation Degrees, Coherency %");
 {setBatchMode(true);
  for (i=0; i<list.length; i++) {
  	
        images = input+list[i];
 showProgress(i, list.length);
        open(images);  
        name = getTitle;  
            
        {
        	
         run("8-bit");
         run("OrientationJ Horizontal Alignment");
         run("OrientationJ Dominant Direction");

         Frame = getResult("Slice",0);
         Orientation = getResult("Orientation [Degrees]",0);
         Coherency = getResult("Coherency [%]",0);

         selectWindow("Log");
         print("\\Clear");
         print(list[i],",",Orientation, ",", Coherency);
         selectWindow("Log");
         theText = getInfo("log");
         String.resetBuffer;
         String.copy(theText)
         String.append(String.paste);
         print("[Results]", replace(String.buffer, "	", ", "));
         
        }

    }

}

//Save the "Results" table in .xls format
selectWindow("Results");
saveAs("Text", Output + "OrientationJResults.xls");

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
        


