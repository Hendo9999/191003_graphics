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

#challenge 3_7
#Create a scatterplot using gapminder that shows how life expectancy has changed over time:
#Hint: the gapminder dataset has a column called year, which should appear on the x-axis.
  
gapminder %>% 
  ggplot(mapping = aes(x=year, y= lifeExp)) +
  geom_point()

#with line geometry
gapminder %>% 
  ggplot(mapping = aes(x=year, y= lifeExp)) +
  geom_line()

#transformation and statistics
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.3)+ # alpha adds transparency
  scale_x_log10()+
  geom_smooth(aes(size = 2, colour = "red"), method = "lm") #add linear regresssion line and change size

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(colour = continent)) + # alpha adds transparency
  scale_x_log10() +
  scale_colour_manual(values = c("red", "green", "orange", "brown", "purple"))

#Challenge 3_9
#Modify the color and size of the points on the point layer in the previous example.
#Hint: do not use the aes function.


#previous code
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

#modified code for challenge 3_9
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size=5, colour = "purple") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

#challenge 3_10
#Modify your solution to Challenge 9 so that the points are now 
#a different shape and are colored by continent with new trendlines. 
#Hint: The color argument can be used inside the aesthetic.

#modified code for challenge 3_9
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(shape = "square") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)
?geom_smooth()
?group_by()
  
#Challenge 3_11
#Try modifying the plot above by changing some colours in the scale 
#to see if you can find a pleasing combination. 
#Run the colours() function if you want to see a list of colour names 
#R can use.
#There is also a scale_colour_brewer() scale that takes an 
#argument palette that is the name of a ColorBrewer palette.
#Select an appropriate colour palette for the continents from 
#ColorBrewer and apply it to your plot instead.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(size=25, shape = "square") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 15)+
scale_colour_manual(values = c("tomato1", "wheat3", "steelblue", "violetred4", "thistle2"))


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(size=2, shape = "square") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 2)+
  scale_color_brewer(palette = "BrBG") #palette code from colour brewer website
scale_color_brewer()

a_countries <- gapminder %>% 
  filter(str_starts(country, "A"))

  ggplot(mapping = aes(x = year, y = lifeExp, colour = continent, group = country))+
  geom_line()+
  facet_wrap(~country)
a_countries

gapminder_1977 <- filter(gapminder, year == 1997)

ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y = lifeExp, colour = continent, size = pop)) +
  geom_point()+
  scale_x_log10()


#challenge 3_12
#When discussing the gapminder video, we decided to ignore the 
#animation component. Facets provide an option for achieving a 
#similar effect in a static image. Take our original plot:
#ggplot(data = gapminder_1977, 
#mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
#  geom_point() +
#  scale_x_log10()
#and modify it by
#using the full gapminder dataset
#adding a facet_wrap to demonstrate the change through time


ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
         geom_point() +
         scale_x_log10()+
  facet_wrap(~continent)

#spontaneous challenge
gapminder_1977 <- filter(gapminder, year == 1997)

gapminder_rich <- filter(gapminder_1977, gdpPercap > 30000)

ggplot(data = gapminder_1977, mapping = aes(x=gdpPercap, y = lifeExp, colour = continent, 
                                            size = pop, label = country)) +
  geom_point()+
  scale_x_log10()+
  geom_text(data = gapminder_rich)

rough_plot <- ggplot(data = a_countries,
  mapping = aes(x=year, y = lifeExp,
                colour = continent, group = country)
)+
  geom_line()+
  facet_wrap(~country)

rough_plot + scale_color_brewer(palette = "Dark2")

rough_plot_1 <- rough_plot +
  labs(title = "life expectancy over time for 'A' countries",
       caption = "Data from Gapminder",
       x = "year",
       y = "life expectancy",
       colour = "continent")+
  theme(
    panel.grid.major = element_blank(),
    plot.title=element_text(size=24),
    axis.line = element_line(colour = "blue", size = 2)
  ) 
ggsave("Figures/my_firsta_plot.png", plot = rough_plot_1, width = 12, height = 10, units = "cm")

rough_plot_1

#added comment
