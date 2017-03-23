# AFRL/AFMC <img src="https://www.r-project.org/logo/Rlogo.svg" width="5%"> Training<br/>Presented by the AFIT Data Science Lab
Maj Jason K. Freels, PhD & Brad C. Boehmke, PhD   
28 & 29 March 2017  

## Welcome!

First off, thanks for coming.  Brad and I are working to make sure that this training is worthwhile for everyone.  The intent of this training is to help R users of all experience levels become more proficient at using the software to analyze and visualize their data.  

We plan to cover as much content as we (and you) can handle in two days.  In previous R training courses, I’ve found that most R users don’t have a sufficient grasp of how R works on a basic level and how important this understanding is to using – and developing – R. This is particularly true for understanding the relationship between generic functions and object classes, and how this relationship is a significant part of what make R so powerful.  Therefore, we'll start by covering "the basics" and move on from there.

I've had a few people let me know that they had issues getting JAGS installed correctly and assumed that they would be unable to attend the training.  We've decided to pull Bayesian methods from the list of topics that will be covered during this training.  This decision is due partly becuase of the installation issues, but also because we can cover rmarkdown, shiny, and htmlwidgets in the same amount of time.  If learning how to use R & JAGS for Bayesian computations is an important requirement for you, let us know at the training and we can share some of our resources. 
 
## What do I need to bring?

Attendees will need to bring a laptop on which R (>=3.2.5) and RStudio (>=0.98) are already installed.  Likewise, please ensure that the following packages have been installed:

- `tidyverse`
- `rmarkdown`
- `shiny`
- `data.table`
- `DT`
- `devtools`

These packages, and their dependencies, can be installed using the script below


```r
install.packages(c('tidyverse','rmarkdown','shiny','data.table','DT','devtools'))
```

Lastly, this GitHub repository contains code and data sets that will be used during the 2-Day R Training Course.  If you will be attending this training, locate and click the green `Clone or download` button above and then select `Download ZIP`.  This will download the contents of this repository as a local .zip archive on your machine.  Once downloaded, extract the files from the zip archive to a convenient location on your machine.  We have yet to encounter a NIPR-networked machine that blocked zip archive downloads from Github.  If your machine is the first please [__send me an email__](mailto:jason.freels@afit.edu) letting me know what error you are experiencing (no, you won't win a prize).

## Where am I going and when do I need to be there?

The training will begin promptly at 0900 and will be held in building 646, room 102.  Building 646 is on the southwest side of the AFIT campus, directly across Hobson Way from the AFRL Materials and Manufacturing Directorate (AFRL/RX) - it's also the building closest to the Icarus statue.  The easiest way to get to room 102 is to park at AFRL/RX, walk across Hobson Way, and enter through the doors closest to the Icarus statue. Room 102 will be first room on your right - it's a large class room with auditorium-style seating.

## Anything else I need to know?

Yes, power up your laptops prior to the training.  While the room in which the training will be held is a teaching auditorium, it has insufficient access to power outlets.  The plan is to have everyone plug in and recharge over the lunch - so this should not present an issue if you start with a full battery.
