Author: Mathias Schindler
Date: 25.1.2015

This files describes how the R script „run_analysis.R“ works. This script was
tested on the following platform:

platform       x86_64-apple-darwin13.4.0   
arch           x86_64                      
os             darwin13.4.0                
system         x86_64, darwin13.4.0        
status                                     
major          3                           
minor          1.2                         
year           2014                        
month          10                          
day            31                          
svn rev        66913                       
language       R                           
version.string R version 3.1.2 (2014-10-31)
nickname       Pumpkin Helmet 

Requierements: 

- R library dplyr, data.table installed
- The data set „UCI HAR Dataset“ downloaded to the current R working directory
- the script run_analysis.R located in the current R working directory

After sourcing the script (call source("run_analysis.R“ @ R prompt) the function can
be called be entering run_analysis() at the R prompt. The script reads a data set described in the CodeBook.md file (same folder as you found this file) and produces a 
file called „tidyDataSchindler.txt“ which contains a tidy data set based on the input.

Information on the data sets and the operations being performed can be found in CodeBook.md
The script is described by the annotations found in its source code.


