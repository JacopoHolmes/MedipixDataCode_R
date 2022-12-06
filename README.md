# Medipix data analysis using R

The following repository contains the code developed in R, during my Bachelor's thesis, to read the output data from a Meidpix detector.

Some information about the data processing and output files given by the detector software is in the /Notes folder, coming directly from my thesis work; as such all of its content is in Italian, just like all of the comments in the code.

Note that this code is nowhere near perfect, nor it's the most efficient, however it surely does its job; any suggestions or changes are accepted and indeed recomended.

## Organization 

- **/Notes** contains the notes on the detector output files, what they represent and what one can extract from them.

- **/ASCII** contains the code, input example and output example for the ASCII matrix analysis.

- **/CLOG** contains the code, input and output examples for the .CLOG files analysis.

## Usage

- The ASCII reader script is ready to use, just change the path and filename in line 4;
- for the .CLOG reader a pre-parsing is needed. The square brackets and commas need to be removed and substituted with whitespaces. Note that this process could be done in R as well, but at the time I didn't have the means to do so.