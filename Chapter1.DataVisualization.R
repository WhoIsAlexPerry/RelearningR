#1 Data Visualization

#1.1 Introduction

#The package ggplot2 implements the grammar of graphics, a system for describing and building graphics. 

#1.1.1 Prerequisites
#First, we need to load a core package.
library(tidyverse)
#And then the penguin dataset and the ggthemes package, which has colorblind-safe palettes. 
library(palmerpenguins)
library(ggthemes)


#1.2 First Steps 
#How do we create visualizations to answer questions about patterns within penguins?

#1.2.1 The penguins data frame 
#A data frame is a rectangular collection of variables (columns) and observations (the rows)
#penguins, the package, contains 344 observations

#variable = quantity, quality, property you can measure 
#value = state of a variable when you measure it. value may change. 
#observation = set of measurements made under similar conditions
#tabular data = set of values, each associated with a variable and an observation.
#tabular data is considered tidy if each value is placed in its own "cell" and each variable in its own column and each observations in its own row. 

p