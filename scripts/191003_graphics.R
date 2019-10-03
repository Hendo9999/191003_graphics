library(tidyverse) #load tidyverse package

gapminder <- read_csv("data/gapminder_data.csv") #load gapminder data

#challenge 3_2
#Make a new project for this lesson and initialise a git repository.
#Add the gapminder data from this link (or from your previous R lesson directory) to a data folder in your new repository.
#Commit the data to the git repository.
#Open a new script and use read_csv to read in the gapminder data and assign it to a variable called gapminder. (Hint: read_csv can be accessed through the tidyverse package).
#Because our example figure uses only the data from 1977, create a new data frame called gapminder_1977 
#and assign it the data just from 1977 using the filter() function.
#Commit the script to the repository

gapminder_1977 <- gapminder %>% #assign variable for subset of gapminder data
  filter(year ==(1977)) #filter for subset of data for year 1977
