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

#init landscape
land = LandscapeInit(elevation)
image(land)

#init individuals on landscape
pop = NewPop(nindv, landscape)
#pop = rbind(pop,NewPop(nindv,landscape)) #this will add the different NewPops together
points(pop[,1], pop[,2], pch=19, cex=0.5)
plot(-100,-100, xlim=c(0,150), ylim=c(0,150))
points(pop[,1], pop[,2], pch=19, cex=0.5)

#allow individuals to move within landscape

#extract needed output from simulation

 

