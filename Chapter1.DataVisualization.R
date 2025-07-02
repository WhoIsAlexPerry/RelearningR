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

#Creating a ggplot

ggplot(data = penguins) #the data = penguins tells it what data to use. 

#next, we have to add aesthetics using the mapping argument, which is defined in the aes() function, and the x and y arguments specify the variables to match them at. 

ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

#at this point, the axis are defined, but we haven't specified how to exactly display the data or represent the observations. to do this, we use a "geom", the geometrical object that will represent a point.
#plots are referred to by the different geom that the plot uses.
#bar chart geom_bar() 
#line chart geom_line()
#boxplot uses geom_boxplot()
#scatterplot is geom_point()

ggplot(
  data = penguins,
  mapping = aes( x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point()


#1.2.4 Adding aesthetics and layers 

#scatterplots are useful for observing relationships between two numerical variables, but we need to see if any other variables explain or change this observed relationship. the book says
#that we should do this by representing the different species with different colored points. 

ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + geom_point()

#the process of scaling is when the ggplot program matches a unique value of the aesthetic (here it's a color, to a unique level of the variable) it'll also add a legend when needed. 

#the book says to add another layer. we're going to insert a smooth curve that displays the relationship between 
#body mass and flipper length. the new geom is called geom_smooth(). and we'll specify that we want a linear model
#using lm

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")

# so if you do it like this, the geom arguments that follow will apply to each thing that's specified in the mapping
# argument