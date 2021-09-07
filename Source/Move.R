#This is the MOVE function within the Butterflies project 
#for ABM class Fall 2021
#Gina Lamka
#9/7/2021

#indv = pop[i,,drop = FALSE] #this is here now for writing the function, but this will be within Butterflies.R

Move = function(nindv, land, move, nsteps, elevation){
  mvmt = indv[1,1:2] #x is at first, y is at 2
  
  for(s in 1:nsteps){
    #take out individual i via subsetting
    curr.x = mvmt[(length(mvmt)-1)] #this outputs the x coord for indv i
    curr.y = mvmt[(length(mvmt))]   #this outputs the y coord for indv i
    
    #this randomly selects if individual will move randomly or towards higher elevation
    movehigh = sample(x=c(0,1), size =1, prob=c((1-move),move)) 
    #0 is random, 1 is higher elevation
    
    #then move individual i (function) with either random movement (0) or increase in elevation (1)
    if(movehigh==0){
      xpos = sample(c(-1,0,1), 1) + curr.x #this randomly moves the x position to the left or right 1, or stays at same location once
      ypos = sample(c(-1,0,1), 1) + curr.y
    }
    
    if(movehigh==1){
      highpt = which(land[(curr.x-1):(curr.x+1), (curr.y-1):(curr.y+1)] == #output WHICH LOCATION in 3x3 array has highest elevation
                       max(land[(curr.x-1):(curr.x+1), (curr.y-1):(curr.y+1)]), arr.ind = TRUE) #find max elevation in a 3x3 cell space around indv i
    
      #use the location from highpt to calculate new position for indv i with x and y values
      #note, for this simple model, the following is OK, but for farther steps at one time, another code would be better
      if(highpt[1]==1){xpos = curr.x - 1} #if on left of array, x-1
      if(highpt[1]==2){xpos = curr.x}     #if center, stay in x location
      if(highpt[1]==3){xpos = curr.x + 1} #if on right of array, x+1
      if(highpt[2]==1){ypos = curr.y - 1} #if on top of array, y-1
      if(highpt[2]==2){ypos = curr.y}     #if center, stay in y location
      if(highpt[2]==3){ypos = curr.y + 1} #if on bottom, y+1
      #note top/bottom and left/right are opposite from the landscape, which is why we need lines 31-36
      }
      
      #record new positions and add to data object
      mvmt = c(mvmt, xpos, ypos)  #this adds on the new location to the old location so you have a path
    
      #check to make sure indv is at peak; if yes it should stop at same position
      if(land[xpos,ypos]>=elevation[2]){ #use second column in elevation to designate y coordinate (peak = 400)
        mvmt = c(mvmt, rep(c(xpos, ypos), (nsteps-((length(mvmt)/2)-1))))
        break #exit loop
      }
      
      #check to make sure indv isnt at edge of landscape, if yes, indv at same position
      if(xpos>=(landscape-1) | ypos>= (landscape-1) | xpos<=1 | ypos <=1) {
        mvmt=c(mvmt, rep(c(xpos, ypos), (nsteps-((length(mvmt)/2)-1))))
        break #exit loop
      }
  }
  #return path
  return(mvmt)
}

