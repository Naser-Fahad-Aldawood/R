First_vec <- c(2L,4L,1L)
First_vec

Sec_Vec <- c("Nasser","Anas","Mouath")
Sec_Vec

Third_vec <- c(TRUE,FALSE,TRUE)
Third_vec
#Check Type
typeof(Third_vec)
#Find length
length(Sec_Vec)
#Check If charcter
is.character(Sec_Vec)



#List
List_1 <- list("a",1L,1.5,TRUE)

#Find What type contain
str(List_1)

# List Can be named
List_2 <- list('Chicago' = 1,'New York' = 2, 'Los angeles' = 3)
List_2

# First You must install "Tidyverse" Package and Load "Lubridate" library 
# Date & Time
Today_date <- today()
Today_date

Now_time <- now()
Now_time # Show current time

mdy_1 <- mdy("January 20th, 2021") # Convert String (m= month , d= day, y=year)
mdy_1

ymd_2 <- ymd_hms("2021-01-20 20:11:59") # Convert String to time (y = year, m = month, d = day)
ymd_2

as.Date(Now_time) # Convert To date

# Create Data Frame function
data_Frame_1 <- data.frame(X = First_vec , Y = Sec_Vec)
data_Frame_1 # show frame


# Create Dictionary to hold your files
Dic_1 <- dir.create("My_Work_W_R")

# Create file
File_1 <- file.create("My_Views.csv")

#Copy File
file.copy(File_1)

#Delete Files
unlink(File_1)

# Operator =>  Logical / Arithmetic , Conditional Statement 

TRUE & TRUE # And Operator

TRUE || FALSE # Or operator

Quarter_sales_1 <- 20.5
Quarter_sales_2 <- 25.5
Midyear_Sales <- Quarter_sales_1 + Quarter_sales_2 
Midyear_Sales # Arithmetic Operation

Num_1 <- 4
if (Num_1 > 0){
  
  print("Pass")
  
} else if (Num_1 == 0) {
  
  print("Try again")
  
} else {
  
  print("Failed")
  
} # Condition  Statement 
  
# Activity 1  diamonds Dataset

#1-View Data
head(diamonds) # View The (head) of data diamonds library 

str(diamonds) # Summarise (Structure) The diamond dataset
glimpse(diamonds) # Summarise The diamond dataset

colnames(diamonds) # Return Columns Names

# 2- Cleaning data
rename(diamonds, carat_new = carat , cut_new = cut) # Rename The column Name

summarise(diamonds , mean_carat = mean(carat)) # Find the mean summray

# 3- Visualize Data
ggplot(data = diamonds, aes(x = carat , y = price)) + geom_point() # View The distribution Of data

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() # Change Color add legends

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + 
geom_point() + facet_wrap(~cut) # Seperate The Legends & Visuals (Create Different Plots)

# 4 - Documentation


# Pipes Training 
data("ToothGrowth") # Create Dataset
view(ToothGrowth) # Show The contents

Filterd_tg <- filter(ToothGrowth, dose == 0.5) # Filter Data That Dose = 0.5
view(Filterd_tg)

arrange(Filterd_tg, len) #  Arrange in ascending order by what you specify 

arrange(filter(ToothGrowth, dose == 0.5),len) # Nestaed Function Filter + Arrange

filterd_Toothgrow <- ToothGrowth %>%
  filter(dose == 0.5) %>% 
  group_by(supp)     %>% 
  arrange(len)   # Add Pipe Operator add Filter & Arrange With using Pip (CMD + Shift + M)
view(filterd_Toothgrow)



# Working With data Frame More
head(diamonds)

colnames(diamonds) # Return Column_names

mutate(diamonds, carat_2=carat*100) # Make Change In the data Frame as You can see We add more columns 
view(diamonds)

# Creating Tibble
as_tibble(diamonds)


# Activity 2 Create Your own data frame

#1- Create data frame
names <- c("", "", "", "") # First Vector
age <- c(0, 0, 0, 0 ) # Second Vector

people <- data.frame(names, age) # Create data Frame

#2- Inspect the data frame
head(people)

str(people)

glimpse(people)

colnames(people)

mutate(people, age_in_20 = age+20)

#3- Exercice by yourself 
Fruits <- c("pineapple", "Strawberry", "Orange", "Mango", "Banana")

Rank <- c(1, 3, 4, 2, 5) 

Fruit_Rank <- data.frame(Fruits,Rank)

arrange(Fruit_Rank, Rank)
# Completed


#Import Data 
Booking_df <- read_csv("hotel_bookings.csv")


#Data Cleaning
#first install Packages for data cleaning
install.packages("here") 
library("here") #load it

install.packages("skimr") # Makes Summarising Data Easy
library("skimr")

install.packages("janitor") # Has function for cleaning data
library("janitor")

# *Practice Part*
install.packages("palmerpenguins")
library("palmerpenguins")

skim_without_charts(penguins) # Gives Summray Of the datasets

glimpse(penguins) # Summray of data shorter

penguins %>% 
  select(species) # show only the specified  Row



penguins %>% 
  select(-species) # adding Minus To specific colum means Show all rest of columns except that

penguins %>% 
  rename(island_new = island) # rename the Column

rename_with(penguins, toupper) # To upper case

clean_names(penguins) # make sure the column Names are unique & consistent 

# Orgnize Data

penguins %>% 
  arrange(bill_length_mm) # Sort by bill ascending 

penguins %>% 
  arrange(- bill_length_mm) # by using (-) sign Sort in Decinding order

penguins2 <- penguins %>% arrange(- bill_length_mm) # save it in Var
view(penguins2)

penguins %>% group_by(island) %>%  drop_na() %>% summarize(mean_bill_length_mm =
mean(bill_length_mm)) # Group by island and drop The missing values also bring the Mean

penguins %>% group_by(island) %>%  drop_na() %>% summarize(Max_bill_length_mm =
max(bill_length_mm)) # Find the max

penguins %>% filter(species == "Adelie") # Use filter function 

Hotels_Bokings <- read.csv("hotel_bookings.csv")
str(Hotels_Bokings)

example_df <- Booking_df %>% summarize(number_cnaceled = sum(is_canceled)) # Find The total number of Canceled
head(example_df)


# Transform data
id <- c(1:10)

name <- c("John mendes", "Naser dawood", "Anas dawood", "Rashed haizan", "Mohammed dossary", "Ali mu", "Abdullah sh", 
          "Fahad dawood", "Hatem suliman", "Abdulmalik dawood")

Job_titles <- c("professionals", "Programmer", "Managment", "Clerical", "Developer", 
                "Programmer", "Managment", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, Job_titles)
print(employee)

for_unite <- separate(employee, name, into=c("First_name", "Last_name"), sep = " ") # seperate Column 

United_names <- unite(for_unite, 'name', First_name, Last_name, sep = " ") # Unite_Names

penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000)


#different types of statistics Summray & visualize
install.packages("Tmisc")
library(Tmisc)
data(quartet)
view(quartet)

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x),mean(y),sd(y), cor(x,y))

ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + 
  facet_wrap(~set)

install.packages('datasauRus')
library('datasauRus')

ggplot(datasaurus_dozen, aes(x=x, y=y,colour=dataset)) + geom_point() + 
  theme_void() + theme(legend.position = 'none') + facet_wrap(~dataset,ncol=3)

# Bias Function
install.packages('SimDesign')
library(SimDesign)

actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
Predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, Predicted_temp) # Find The bias result



# Activity 3 changnig Your data

# 1- getting To know your data

head(Hotels_Bokings)

skim_without_charts(Hotels_Bokings) # To show The Number Of columns

glimpse(Hotels_Bokings) # For showing The structure 

colnames(Hotels_Bokings) # Know The Column Names

# 2- Manipulating Your data

arrange(Hotels_Bokings, desc(lead_time))

max(Hotels_Bokings $ lead_time) # Find The maximum 

min(Hotels_Bokings $ lead_time) # Find The Minimum 

mean(Hotels_Bokings $ lead_time) # Find The mean(Average)


#Dive into The visualization with ggplot2

install.packages("tidyverse") # For ggplot2
library(tidyverse)
library(ggplot2)
library("palmerpenguins")

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g)) # display The visuals 

?geom_point # learn more About geoom


# Activity 4 Using ggplot

# 1- show data you will deal with
head(Hotels_Bokings) 

colnames(Hotels_Bokings)

glimpse(Hotels_Bokings)

# 2- Start playing with ggplot2

ggplot(data = Hotels_Bokings) + geom_point(mapping = aes(x = lead_time, y = children))

# 3- try it on your own

ggplot(data = Hotels_Bokings) + geom_point(mapping = aes(x = stays_in_weekend_nights, y = children))


# Explore Aesthetic in analysis

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) # Change Color
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species )) #change color & species
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species , size = species )) #change color & species & Size

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "Red") #change color with out legends

# Explore different types of geoms

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) # Geom Point

ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) # Geom Smoth (Line represent The data)

ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))  # Make each line represent at self

ggplot(data = penguins,aes(x = flipper_length_mm, y = body_mass_g)) + geom_smooth()  + geom_point() # Combained 2 geom

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut , fill = cut)) # geom bar Take only one value and count the frequency of it

# Facet function 

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, body_mass_g, color = species)) + facet_wrap(~species) # Create more than one plot with one Var

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, body_mass_g, color = species)) + facet_grid(sex~species) # with Two Var

# Acitvity 4 aesthetics and visualization 

# make bar chart 

ggplot(data = Hotels_Bokings) + geom_bar(mapping = aes(x = distribution_channel))

ggplot(data = Hotels_Bokings) + geom_bar(mapping = aes(x = distribution_channel, fill = market_segment)) # add fill to the plot 

ggplot(data = Hotels_Bokings) + geom_bar(mapping = aes(x = distribution_channel)) + facet_wrap(~deposit_type) # add Facet_wrap to segement the plot bassed on deposit_type

ggplot(data = Hotels_Bokings) + geom_bar(mapping = aes(x = distribution_channel)) + facet_wrap(~deposit_type) + 
  theme(axis.text = element_text(angle = 45)) # Modify The plot text by using theme and turn it to 45 degree

ggplot(data = Hotels_Bokings) + geom_bar(mapping = aes(x = distribution_channel)) + facet_wrap(~deposit_type~market_segment) + 
  theme(axis.text = element_text(angle = 45)) #complicated

# Use filters with ggplot

onlineta_City_hotels <- filter(Hotels_Bokings, (hotel == "City Hotel" & Hotels_Bokings$market_segment == "Online TA"))

view(onlineta_City_hotels)

ggplot(data = onlineta_City_hotels) + geom_point(mapping = aes(x = lead_time, y = children)) + ggtitle("New Title")
#---

# Time for Annotate *_

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, body_mass_g, color = species)) +
  labs(title = "Plamer penguins: Body Mass vs. Flipper length", subtitle = "Sample of penguins", 
       caption = "Data collected by Dr. Kristen Gorman") +               # add tittle & subtittle & caption using labs func
  annotate('text', x = 220, 3500, label = "The gentoos are the largest") # How the annotate function used

  
  p <-  ggplot(data = penguins) + 
    geom_point(mapping = aes(x = flipper_length_mm, body_mass_g, color = species)) +
    labs(title = "Plamer penguins: Body Mass vs. Flipper length", subtitle = "Sample of penguins", 
         caption = "Data collected by Dr. Kristen Gorman") # Save it to Var
  
  p + annotate('text', x = 220,  y = 3500, label = "The Gentoos are The largest", angle = 45 , size = 5) # combained the annotate func with p and Play with Size and angle
  
  
  # Save The plot
  ggsave("Three Penguins species.png") #Save the current plot
  
  
  # R markdown
  install.packages("rmarkdown")
  
  #Practice Part
  
