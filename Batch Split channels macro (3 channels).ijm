//@ File (label = "- Select folder with Z-Stacks -", style = "directory") input
//@ File (label = "- Select folder new to save channels -", style = "directory") output
//@ String (label = "- File format/suffix -", value = ".tif") suffix

print (input);
print (output) ;

input += File.separator;
output += File.separator;

print (input);
print (output) ;


processFolder(input);

//Function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
        list = getFileList(input);
        list = Array.sort(list);
        Array.print(list);
        
        for (i = 0; i < list.length; i++) {
	       if(File.isDirectory(input + File.separator + list[i]))
		   processFolder(input + File.separator + list[i]);
	       if(endsWith(list[i], suffix))
		   processFile(input, output, list[i]);
  }
}

function processFile(input, output, file) {

         open(input + file);
         run("Split Channels");
         title = getTitle();
         saveAs("Tiff", output + title); 
         close();
         title = getTitle();
         saveAs("Tiff", output + title); 
         close();
         title = getTitle();
         saveAs("Tiff", output + title); 
         close();
         print(title);
         print("Processing: " + input + File.separator + file);
         print("Saving to: " + output);
}

//------------------------------------------------------------//
//Batch split channels (3 channel stacks)

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
