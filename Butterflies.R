#in ABM class 8.24.2021
#the premise is that there are butterflies that go up in elevation

setwd("C:/Users/HP/Box/New Computer/Auburn/Data/ABM_Class")
directory = getwd()
outdir = paste(directory, "/output/", sep = "")
source(paste(directory, "/source/FunctionSourcer.R", sep = ''))

#parameters
elevation = c(0,400)      #peak elevation min and max
landscape = 150           #number of patches on each side, total patch number = landscape*landscape

nindv     = 50            #number of individuals to simulate
nsteps    = 500           #number of steps an individual can take
move      = 0.8           #decimal likelihood of individual moving to highest neighbor patch (R&G call this q)

#pdf(file = "/Output/butterflies2.pdf", width = 5, height = 5, onefile = T)
#init landscape
land = LandscapeInit(elevation)
image(land)

#init individuals on landscape
pop = NewPop(nindv, landscape)
points(pop[,1]/150, pop[,2]/150, pch=19, cex=0.5)
dev.copy(png, "../Output/indvlocation.png")
dev.off()

#pop = rbind(pop,NewPop(nindv,landscape)) #this will add the different NewPops together
#plot(-100,-100, xlim=c(0,150), ylim=c(0,150))  #this puts the points on its own figure (note 0-150 axes)
#points(pop[,1], pop[,2], pch=19, cex=0.5) #puts points on own fig

#allow individuals to move within landscape
paths = NULL
for(i in 1:nindv){
  indv = pop[i,,drop = FALSE]
  
  #chart movement
  movepath = Move(nindv, land, move, nsteps, elevation)
  
  #plot movement
  lines(movepath[seq(1,length(movepath), 2)]/150, movepath[seq(2,length(movepath), 2)]/150, lwd = 2)
  
  #record path in single object for all indv
  paths = rbind(paths, movepath)
}

rownames(paths) = seq(1, nindv, 1)

#extract needed output from simulation
#for this project, we will not be doing any stats, but export something (like a figure) to see how the model worked
dev.copy(png, "../Output/butterflypaths.png")
dev.off()

#to write a table with the x, y coordinates use the code below
#write.table(pop, paste(directory, "/output/testpop2.txt", sep=""), sep="/t", col.names=F, row.names=F)

