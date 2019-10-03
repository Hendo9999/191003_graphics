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



#learning how to plot stuff
ggplot(data = gapminder_1977) #variables not mapped to aesthetics or geometries

ggplot(data = gapminder_1977, #variables mapped to various aesthetics
       mapping = aes(x=gdpPercap,
                     y= lifeExp,
                     colour = continent,
                     size = pop)) + 
  geom_point() + #applied to geometry
  scale_x_log10() #transform scale to log10

?geom_point()   
head(gapminder_1977)
?ggplot() 


#Challenge 3_4
#There are six variables in the gapminder_1977 data frame, country, year, pop, continent, lifeExp, and gdpPercap. 
#Although as year contains just the value 1977 it is not that informative.
#Using the template:
#ggplot(gapminder_1977, aes(x = <VAR1>, y = <VAR2>, colour = <VAR3>)) + geom_point()
#experiment with substituting different combinations of the data variables into the three positions.
#How do the default parameters treat the different variables?

#test1
ggplot(data = gapminder_1977, #variables mapped to various aesthetics
       mapping = aes(x=gdpPercap,
                     y= pop,
                     colour = pop)) + 
  geom_point() + #applied to geometry
  scale_x_log10() #transform scale to log10

#test2
ggplot(data = gapminder_1977, #variables mapped to various aesthetics
       mapping = aes(x=pop,
                     y=gdpPercap,
                     colour = lifeExp)) + 
  geom_point() + #applied to geometry
  scale_x_log10() #transform scale to log10

#test3
ggplot(data = gapminder_1977, #variables mapped to various aesthetics
       mapping = aes(x=lifeExp,
                     y=pop,
                     size = gdpPercap,
                     colour = continent)) + 
  geom_point() + #applied to geometry
  scale_y_log10() #transform scale to log10

#test4
ggplot(data = gapminder_1977, #variables mapped to various aesthetics
       mapping = aes(x=country,
                     y=pop,
                     size = gdpPercap,
                     colour = continent)) + 
  geom_point() + #applied to geometry
  scale_y_log10() #transform scale to log10


#run aesthetics in geometry function
ggplot(data = gapminder_1977) +
  geom_point( mapping = aes(x = gdpPercap, y= lifeExp, colour = continent, alpha = pop)) +
  scale_x_log10()

?geom_point()

head(gapminder_1977)


Challenge 6

Using the code from our example gapminder plot:
  
  ggplot(
    data = gapminder_1977, 
    mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
  ) +
  geom_point() +
  scale_x_log10()

#challenge 3_6
#Using the code from our example gapminder plot:
#ggplot(data = gapminder_1977,mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
#  geom_point() +
#  scale_x_log10()

#try setting some aesthetics in the geom_point() function 
#(See solution to Challenge 5 for a list of possible aesthetics). 
#What happens if you set an aesthetic that has already been mapped to a data variable?

ggplot(data = gapminder_1977,mapping = aes(x = gdpPercap, y = pop, colour = continent, size = pop)) +
    geom_point() +
    scale_x_log10()
  