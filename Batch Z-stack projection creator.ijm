//Batch Z-stack projection creator 

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

//------------------------------------------------------------------------------------------------------//

//THE MACRO CODE:
//Select directory of images to open
macro 'convert LIF tiff' {
      run("Bio-Formats Macro Extensions");
      waitForUser("Select folder with lif file \n Press OK to start")
      dir1 = getDirectory("Choose folder with lif files ");
      list = getFileList(dir1);
      setBatchMode(true);
	  dir1parent = File.getParent(dir1);
	  dir1name = File.getName(dir1);
	  dir2 = dir1parent+File.separator+dir1name+"- MAX Z stack project";
	  if (File.exists(dir2)==false) {
	    
	    File.makeDirectory(dir2); 
		}
 
for (i=0; i<list.length; i++) {
	
   showProgress(i+1, list.length);
   print("processing ... "+i+1+"/"+list.length+"\n         "+list[i]);
	path=dir1+list[i];
	
   Ext.setId(path);
   Ext.getSeriesCount(seriesCount); 
	
for (j=1; j<=seriesCount; j++) {
		
   run("Bio-Formats", "open=path autoscale color_mode=Default view=Hyperstack stack_order=XYCZT series_"+j);
   name=File.nameWithoutExtension;

	
   text=getMetadata("Info");
   n1=indexOf(text,"Image name = ")+13;
   n2=indexOf(text,"Location = ");
   seriesname=substring(text, n1, n2-1);

if (nSlices>1) {
  
  run("Z Project...", "projection=[Max Intensity]");
  saveAs("TIFF", dir2+File.separator+name+"_"+seriesname+"_MAX");
		}

else saveAs("TIFF", dir2+File.separator+name+"_"+seriesname);
run("Close All");		
	}