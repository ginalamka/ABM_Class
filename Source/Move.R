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


