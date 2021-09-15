#notes from class 9/14/2021
#check out gitbook.com for info about using github

#give more documentation

#use nested layout
  #level 1 - page for working directory, sources functions, manages replicates, and manages parameters
  #level 2 - RunModel.R; the backbone of the simulation, calls all other functions
  #level 3 - all subroutines/functions like Reproduction.R, Move.R, NewPop.R, etc.
#nested layouts help fix bugs and better source functions
#ALWAYS make sure to resource and rerun the functions after making changes. 

#source functions and libraries necessary in FunctionSourcer.R

#debugging
  #when getting error, check assumptions
  #traceback() #put this after errors so you can find where the error of the code is; tells location
  #or you can set p, r, i, whatever to 1 and go line by line
  #if a running problem, put in if/then statements and make a break happen if the problem occurs (best only if occurrence of problem is small)
