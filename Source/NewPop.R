#NewPop to get individuals put on the landscape
NewPop = function(nindv, landscape){
  variance = 125 #cells 
  #x = sample(0:variance,1)
  #y = sample(0:variance,1)
  
  pop = matrix(nrow=nindv, ncol=2)    #makes 2 columns with each indv in one row
  XX = sample(1:(landscape-variance), 1)
  YY = sample(1:(landscape-variance), 1) #this gives the x and y coordinates of each indv in space
  
  pop[,1] = XX + runif(nindv, 0, variance)
  pop[,2] = YY + runif(nindv, 0, variance)
  
  return(pop)
}
XX

x
y
pop[,1]
