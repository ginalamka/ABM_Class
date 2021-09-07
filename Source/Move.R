#This is the MOVE function within the Butterflies project 
#for ABM class Fall 2021
#Gina Lamka
#9/7/2021

Mig = function(nindv, pop, move, nsteps, elevation){
  #make sure ot note x and y coordinates for max elevation
  #NOTE - for now, I am just printing the values, but there is def a better way
  #Janna suggests using list and unlist when returning land, xpeak, and ypeak
  x = pop[,1]
  y = pop[,2]
  
  for(x in 1:nindv){
    pop[,1] <- x + 1
    pop[,2] <- y + 1
  }
  return(pop)
}

#notes on how I would like this to run 
  #first, I would like to print xpeak and ypeak from LandscapeInit.R
    #this will allow me to know where the butterflies should move to
  #then, in Move.R, create a for loop for 1:nindv so that you iterate over each individual
  #add in an if/then statement so if they are not at elevation, they move up
    #if at ypeak, then simulation stops and goes to next individual
    #individuals would need to go from 0:nsteps, as they cant go over the number of steps
  #output ??