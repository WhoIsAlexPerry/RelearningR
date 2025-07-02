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

# so if you do it like this, the geom arguments that follow will apply to each 
# thing that's specified in the mapping
# argument. to fix it so the line is one continuous thing, we'll move the color 
#argument
# out down to the point so it's only applicable there. 

ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species)) + 
  geom_smooth(method = "lm")

# we're now going to make the species different shapes 

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

#the legend automatically updated!

#now, we're going to add labels using the labs() function. title adds a title,
# subtitle adds a subtitle. 

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(aes(color = species, shape = species)) + 
  geom_smooth(method = "lm") + 
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)", color = "Species", shape = "Species"
  ) + scale_color_colorblind()

# 1.2.5 Exercises 
#How many rows are in penguins?
penguins
# there are 344 rows. I just ran the dataset and read the tibble. 

#What does bill_depth_mm variable in the data frame describe?
#It describes the bill depth in millimeters. 

#Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
#That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm 
#on the x-axis. Describe the relationship between these two variables.

ggplot(data = penguins, 
       mapping = aes(x = bill_length_mm, y = bill_depth_mm)
       ) + geom_point() +
  labs(
    title = "Bill Length and Bill Depth",
    x = "Bill Length",
    y = "Bill Depth"
  )
#There doesn't seem to be a clear relationship between the two. 

#What happens if you make a scatterplot of species vs. bill_depth_mm?
#What might be a better choice of geom? I think boxplot.

ggplot(data = penguins,
       mapping = aes(x = species, y = bill_depth_mm)
       ) + geom_boxplot()

#why does this: 
#ggplot(data = penguins) + 
#geom_point()
#give an error?

#it doesn't have any mappings defining the axis of the graph. 

ggplot(data = penguins,
       mapping = aes(x = bill_length_mm, y = bill_depth_mm)
       )+ geom_point()

#What does the na.rm argument do in geom_point()?
#What is the default value of the argument? False
#Create a scatterplot where you successfully use this argument set to TRUE.

ggplot(data = penguins,
       mapping = aes(x = bill_length_mm, y = bill_depth_mm)
       ) + geom_point(na.rm = TRUE)
#Setting it to true tells it to ignore the empty dots.

#Add the following caption to the plot you made in the previous exercise
#: “Data come from the palmerpenguins package.” 
#Hint: Take a look at the documentation for labs().

ggplot(data = penguins,
       mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + geom_point(na.rm = TRUE) +
  labs(caption = "Data come from the palmerpenguins package.")

#Recreate the following visualization.
#What aesthetic should bill_depth_mm be mapped to? 
#And should it be mapped at the global level or at the geom level? They're the same. 

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = bill_depth_mm)
       ) + geom_point(na.rm = TRUE) + geom_smooth(method = "loess")

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
       ) + geom_point(mapping = aes(color = bill_depth_mm, na.rm = TRUE)) +
  geom_smooth(method = "loess")

#run this code in your head and check predictions

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# they will not look different, because the first is just a simplified version of the 
#second

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

#I was correct.