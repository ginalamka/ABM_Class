# Butterfly dispersal and hilltopping
*An assessment in Agent-Based Models class at Auburn University, Fall 2021*

When individuals disperse they often use corridors, which we tend to think of as linear features on the landscape. However, corridors can also be present in patterns we don't expect. These so-called virtual corridors can appear when landscape features that appear unimportant to us influence individual behavior. In many butterfly species, individuals move uphill to congregate and find mates, a behavior called hill topping. We will use the hill topping model concept of Pe'er et al. (2005)* to explore this phenomenon in butterflies, using a simple agent based model we will write in R.

Model overview

Purpose: The model will be to explore questions about virtual corridors. Under what conditions do the interactions of butterfly hillgopping behavior and landscape topography lead to the emergence of virtual corridors? (We will define these as narrow paths along which many butterflies move.) 

Entities, state variables, and scales: The model has two entities: butterflies and square patches of land. The total landscape is comprised of 150x150 patches, and each patches has one state variable (elevation).  Butterflies are characterized by their location on the landscape. (We will describe butterflies by combinations of X and Y coordinates.) Simulations last for 500 time steps and each step is the time it takes for a butterfly to move through one patch.

Process overview: The basic principle addressed by this model is the concept of virtual corridors. This concept is addressed by seeing when corridors emerge from two parts of the mode: the adaptive movement behavior and the landscape they move through. This adaptive behavior is modeled via a simple empirical rule that reproduces the behavior observed in real life: moving uphill. Sensing is important in the model. We assume butterflies can identify which nearby patch has the highest elevation. Stochasticity is used to represent variability in movement that are too complex to represent mechanistically. 

Initialization: The topography of the landscape is initialized when the model starts. We will use an artificial topography. The butterflies are initialized by creating 500 of them and setting their initial location to a single patch.

Input Data: There are no input data.

Subroutine: The movement subroutine defines exactly how butterflies decide whether to move uphill or randomly. This function first says to move to a neighbor patch that has the heist election. If two or more are the same, the butterfly moves randomly. Neighbor patches are the eight patches that share an edge with the occupied patch. The decision to move uphill or randomly is controlled by a parameter that ranges from 0-1 and reflects the probability of moving uphill. If a random draw for a focal individual is greater than the variable set for the simulation, the individual moves uphill. Otherwise, it moves randomly.

*This idea is straight out of Railsback and Grimm, with a couple modifications implemented here.

Model steps

1. Define parameters needed to run your model. Each parameter should have a comment describing what that variable controls and (if needed) the range of values the parameter can take. It is also a good idea to note if some variables should be decimals, integers, etc.
2. Initialize the landscape. This should be done with a function that returns a landscape of variable size patches. Each patch should have an assigned elevation and there should be a single peak. The elevation should roughy decrease from the peak point, with some variance allowed.
3. Initialize and move individuals on the landscape. Each individual should be randomly assigned a starting location, defined by an X and Y coordinate.
4. Move individuals up to a specified number of steps. Movement at each step will be based on the probability of it moving to a higher elevation patch or moving randomly to an adjacent patch, and this should be controlled by a function. Once the individual reaches the peak area of the landscape, it does not leave the peak. Hint: for some coders, it may be simpler to iterate over individuals. This isn't the most efficient way to run the model but will help you learn how to code and run so is completely fine for this project.
5. Extract needed information from simulation. We want to know if cryptic corridors emerge from this simulation. Typically, we would address this statistically, but since this is meant to be an illustrative example it is ok to do this graphically.
6. Turn in a link to your GitHub repository for this project. The readme for your project repository should tell me how to run your code and explain if your code suggest a cryptic corridor emerges or not. You should also note where in your repository any needed figures are from your simulation that back up your assertion. 
