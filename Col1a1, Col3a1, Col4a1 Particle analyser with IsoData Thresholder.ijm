//Col1a1, Col3a1, Col4a1 Particle analyser with IsoData Thresholder

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
input = getDirectory("Input directory where images are stored");

//Select location where images/results are to be stored
Output = getDirectory("Output ditrectory for results");

//Gets list of files
list = getFileList(input);

setBatchMode(true);
for (i=0; i<list.length; i++) {
	
   showProgress(i+1, list.length);
   open(input+list[i]);
   run("16-bit");
   setAutoThreshold("IsoData dark no-reset");
   run("Analyze Particles...", "size=1-Infinity show=Nothing display summarize add");
   run("Clear Results");
   roiManager("reset");
}

//Save results file
out = Output + " measurements.xls";
saveAs("Results",out);
close();
