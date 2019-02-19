---
title: "Rtutorial"
author: "Ian Vogel & Julie Berhane"
output: html_document
---
  knitr::opts_chunk$set(echo = TRUE)

# R Tutorial for Animal Behavior 296 and Neuroscience 253 at Bucknell University

# R BASICS
  
# Welcome to R for Research Methods in Animal Behavior (ANBE296)!
  
#  R is a program for data science. It is an extremely useful tool for
#  manipulating, visualizing, and investigating data. It will allow you to
#  explore data to formulate hypotheses and then employ statistical tests to
#  assess them.

# Before diving into the tutorial, we want to begin by mentioning that the
# internet can be a great resource for learning R and finding code from other
# people who have done similar analyses. You can master R to the point where you
# are able to freely code and create your own functions, but for the most part
# everything you want to do with R has been done before and this code can be
# easily accessed online. This tutorial will teach you the basics, but we
# encourage you to use the internet to supplement your learning if you want to
# do more complicated analyses or visualizations.

# Just to give you the lay of the land, the window you are reading this in is
# where you will write text and code to work with data. Below is the console
# where code is executed. In the upper right is a window that will show your
# environment and history of edits. Finally in the bottom right is where you
# will find something called your working directory (Files tab), any graphs you
# create (Plots tab), packages that you have installed and that are included in
# the system library (Packages tab), and where inquires made by typing ? before
# a function or package name will be answered (Help tab). You can ignore the
# Viewer tab for now.

# An R script file (such as this one you are working with) defaults to treat any
# text typed as code to be run. You can also write things in R that are meant to
# be comments by putting the pound symbol # before it. Everything in this
# tutorial that is meant to be read as guide will be commented out with a #.

# Before we can do any data visualizations or analyses we will first need a
# place to store all of our data sets as well as the code we write to work with
# them. This place is called your working directory and you will need to create
# one for this exercise.

# To create a working directory you should first create a folder in a location
# on this computer that you can readily access. We recommend creating the folder
# in Documents. You should already have a zip folder with all the files for this
# tutorial saved in either Documents or Downloads, so you don't really have to
# create a new folder. Next select the "Session" tab located above this window
# near where it says "File" and "Edit". Next click "Set Working Directory" and
# select "Choose Directory..." from the drop down menu. Within the file explorer
# that will appear, navigate to where you stored the new folder you just
# created. Select the folder and click "Ok" to set it as your working directory.

# You can use the code below to be accurate based on where your folder is and
# what you named it for future projects. You can skip this step for now because
# you already set the working directory. The code has been commented out.

# setwd("~/Documents/WorkingDirectoryFolderName")

# Next we want some data to play with! There are a ton of great sample data sets
# avalable online and even a few built in ones here in R that you can practice
# with, but for this tutorial we will be using the data from behavioral
# observations on the capuchins conducted by Prof. Gazes' lab. This data will be
# similar to those you will obtain when conducting behavioral observations (obs)
# this semester using the Animal Observer application on an iPad. The data in
# the file "CapuchinObs.csv" has been collected for years so although it will be
# larger than what you will use in class, the output will look similar. It
# includes information on how long the observation lasted for, which monkey was
# observed (focal animal), what behaviors they did, how long each behavior
# lasted, who they were interacting with, and several more pieces of
# information.

# This file is in the .csv format, an abbreviation for "comma separated values".
# You can create such a file from an excel document. After entering and
# organizing data in an excel spreadsheet you can "Save As" with the file
# extension .csv. You will need to save your data sets within the folder you
# have set as your working directory so that it will be accessible within R.

# To work with a data set you will want to read it into the R session as a data
# frame. A data frame is a table of information that can be of various types
# which is convenient when data are not of uniform classes. The read.csv
# function automatically takes the file name you provide in quotes and creates a
# data frame named whatever you provide to the left of the command containing
# the information from your data file. Below you can see the code in action. The
# View function allows you to look at data set in a new tab in this R window.

# You can run code by highlighting the line(s) of code you are interested in hit
# "Run" at the top of this window.

Obs <- read.csv("CapuchinObs.csv")
View(Obs)

# You now have a data set in R that is ready to be manipulated using the
# commands within this document.

# DATA EXPLORATION

# You can begin exploring your data set by looking at the head (first five rows)
# and tail (last five rows) of your dataset. You can also view the full dataset
# by typing the name of the file and running that line of code.

# Another issue you should determine from the start is if there are missing
# values in your dataset. If it is a dataset you have collected yourself this
# may be easy to determine if the dataset was small enough, but when using large
# data or data from another source you should make sure to check this. You can
# check for missing values (often represented as NA, but could potentially be
# -999 or something else) and then choose if you want to keep or omit them from
# the data set.

# Here is some generic code for exploring a data set in a file that is named
# DataFile. You can change DataFile to Obs in the code below to explore the data
# from the csv file.

# Display full dataset
DataFile
# Display first five rows only (useful for large datasets)
head(DataFile)
# Display last five rows only
tail(DataFile)
# Count missing values
sum(is.na(DataFile))
# Exclude observations with missing values and give the new data set without
# missing values a different name
NewDataFileName <- na.omit(DataFile)

# The layout of the data can also have consequences for how well your R code
# works. R treats the data as if each row is from a single observation. For
# example, let's consider you were determining if there is a difference test
# scores in two separate classes. The data could be set up such that Class A is
# the title of the first column and below it are the test scores of 10 different
# students, and Class B is the title of the second column with it's students
# test scores below it. R woudl treat the first row as one observation when it
# is actually two, one test score from Class A and one score from Class B.
# Stacked data will have the title of the first column be Grades or Values, and
# the title of the second column Class. So the rows would then be set up as a
# single observation for a single student, showing their test score and the
# Class (A or B) that they belong to.

# You can use the stack() function to stack all of your data or stack data with
# particular values. You will not need to use this function for this tutorial
# but it is still good to know if you encounter unstacked data in future data
# sets.

# The stacked function is commented out because it should not be used.

# DataFileStacked <- stack(DataFile)
# DataFileStacked <- stack(VariableA, select=c("Variable B Value 1", "Variable B Value 2"))

# Before further exploring the data set, one issue you may run into with the
# output from the iPad is that it may include information you should not
# analyze. This is because data collected during obs can be for training
# purposes or real data to be analyzed for research. You can also use the iPad
# to record reliability data which is when multiple people observe the same
# behaviors and the data will be compared to see how similar they are. Here, we
# will mainly be concerned with data for research. The "Use" column in the csv
# file will stipulate what the data was collected for. Prof Gazes primarily
# wants you to analyze data meant for Research and to ignore the rest. You can
# do this by creating a subset of the data and saving the Research data into a
# new data frame with a new name.

ResearchObs <- Obs[which(Obs$Use=='Research'),]
ResearchObs

# Once the data is set up how you want, you can look at some quick summary
# statistics. The mean and middle are different ways to look at the middle of
# the data set. You can also look at the dispersion of the data with the range,
# standard deviation, variance, standard error of the mean, and interquartile
# range. When trying to find the mean, median, etc. of a specific variable you
# must first specify the dataset you are looking at and then the variable you
# want to focus on. This is done in the format DataFile$Variable.

# You can also focus on a specific value of a variable with the format
# DataFile$Variable=='Value'.

# Change DataFile to be the name of your data set and Variable to be the
# variable you are interested in exploring. The variables you are able to
# explore are those that are included in that data set. Variable names can be
# found as the name of each column.

# I've included a file called NatalieGroom.csv in the folder for this tutorial.
# It is a subset of the full CapuchinObs data set that focuses on instances
# when the capuchin Natalie participated in grooming, either as the initiator 
# (Actor) or recipient (Subject). You will first have to read in the data using 
# the code below. Then try to explore the duration of Natalie's grooming bouts 
# by changing the code below. Duration is a variable included in this data set.

NatalieGroom <- read.csv("NatalieGroom.csv")

# mean
mean(DataFile$Variable)
# median
median(DataFile$Variable)
# range
range(DataFile$Variable)
# standard deviation
sd(DataFile$Variable)
# variance
var(DataFile$Variable)
# standard error of the mean. sqrt is the square root function. length returns
# the number of values in that variable
SEM = sd(DataFile$Variable)/sqrt(length(DataFile$Variable))
# interquartile range
IQR(DataFile$Variable)

# When working with quantitative data you should check to see if it is normally
# distributed. This is important when you eventually decide which statistical
# test to use as some of them assume that the data is normal.

# You can check to see if the data is normal using the simple.eda function in
# the UsingR package. The simple.eda function will show you a histogram,
# boxplot, and normal Q-Q plot of the data. You will first need to install the
# package, read the package into the R session using the library function, and
# then you can use that function.

# A histogram will give you an idea of the distrbution of your variable by
# showing the frequency of each observed value. The graph should follow a bell
# shaped curve if the data is normal.

# A boxplot shows the spread of the data and if there are any outliers. Normal
# data should only have 1 outlier for every 100 data points. So if you have a
# small data set but there are a lot of outliers (points that extend beyond the
# box and whiskers) in your boxplot it may not be normally disributed.

# Q-Q plots are used to determine if the distribution of the data matches a
# normally distributed data set. If the points do not closely lie on the
# regression the plot creates then it is most likely not normally distributed.

# Change the code below to explore Natalie's grooming bouts.

install.packages("UsingR")
library(UsingR)
simple.eda(DataFile$Variable) 

# The Shapiro Wilks test is a way to statistically test if data is normal. This
# can be done using the shapiro.test function. The null hypothesis for this test
# is that the data is normal, so a p value less than 0.05 will reject the null
# and assume that the data is not normal. Therefore, if the p value returned is
# greater than 0.05 then the data is normal. This function will return some
# output that you don't need to look at. To focus on the p value use
# shapiro.test(DataFile$Variable)$p.value.

# Check if Natalie's grooming bouts are normally distributed.

shapiro.test(DataFile$Variable)$p.value

# If the data is not normal, you may want to see if the data can be transformed
# and fit to be normal. This can be done by taking the log of the data. You can
# take the natural log and the log base 10 of the data and then run a Shapiro
# Wilks test to see if it is now normal.

# natural log
shapiro.test(log(DataFile$Variable))
# log base 10
shapiro.test(log10(DataFile$Variable))

# If the data still isn't normal after transforming, then you should consider it
# not normal and then use non-parametric tests during your statistical analysis.
# Parametric tests (such as the t test and ANOVA) are those that assume that
# data is normal. These are not suitable for analyzing non-normal data and you
# will have to determine which non-parametric test is appropriate when you begin
# to run statistical tests on your data.

# DATA VISUALIZATION

# Although statistical tests will determine if there is a statistically
# significant relationship between your variables, it can be easier to convey
# this information visually for the reader.

# There are many ways to visually represent data, but you should select one
# based on what is appropriate for the types of variables you are testing as
# well as how many variables. The variable you are testing will either be
# numeric or categorical (factor). You should also make decisions based on if
# your numeric variable is discrete or continuous.

# The zip folder downloaded for this tutorial includes a helpful guide
# (KylaJacksonPlotTypes.png) for determining which visualization is best given
# your variables of interest.

# Below is the code for for different graphs you can make in R.

# Bar graph/plot - for frequency of values of a categorical variable or discrete numeric variable
barplot(Variable, xlab = "My x-axis label", ylab = "My y-axis label", cex.lab = 1.5)
abline(h=0)
# OR bar graph focusing on a specific variable in a data set
NewDataFile <- DataFIle[DataFile$CategoricalVariable == "Specific Variable Value", ]
barplot(NewDataFile$NumerocVariable, main="Title of plot", 
        xlab="My x-axis label", ylab="My y-axis label")
# cex.lab used to maginfy text of x and y axis labels
# abline adds a line to a plot. h specifies a horizontal line for a particular y value

# Histogram - for frequency of continuous numeric variable
hist(Variable, cex.lab = 1.5, main ="Main Title", breaks = 34, ylim = c(0,10))
abline(v = mean(Variable), lwd = 5)
par(mfrow = c(1,1))
# cex.lab used to maginfy text of x and y axis labels
# breaks to roughly specify how many bars the histogram has
# ylim specifies the range of y axis (xlim will do this for x axis) 
# abline adds a line to a plot. v specifies a vertical line for a particular x
# value. In this case it is equal to the mean of a particular variable. lwd
# tells R what the line width should be
# the numbers used for each setting can be changed to whatever you want

# Scatterplot - visualize relationship between two numeric variables
plot(DataFile, xlim = c(0,10), ylim = c(0,10), xlab = "My x-axis label", 
     ylab = "My y-axis label", main = "Title of plot", pch = 16, cex, 1.2, cex.lab = 1.5)
# the numbers used for each setting can be changed to whatever you want
# cex used to specify how much text and symbols should be magnified compared to default
# pch is used to specify the type of point symbol to use. 16 is the value for a solid black circle
# This url http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
# shows what symbols the values 0-25 will lead to in R

# Mosaic plot - visualize relationship between two categorical variables
install.packages("ggplot2")
library(ggplot2)
ggplot(data = DataFile) +
  geom_mosaic(aes(x = product(Variable1, Variable2), fill=Variable1), na.rm=TRUE) + 
  # OR
  mosaicplot(~ NumericVariable + CategoricalVariable, data = DataFile, color = TRUE)

# Strip chart - to visualize relationship between one numeric and one
# categorical variable. Can also be grouped by an additional categorical
# variable where it says factor() below
library(cowplot)
ggplot(DataFile) +
  aes(x = as.numeric(CategoricalVariable), y = NumericVariable) +
  geom_jitter(aes(color = factor(otherCategoricalVariable)), na.rm=TRUE) +
  theme_cowplot() +
  theme(legend.position = "right") +
  labs(color="Title of Legend") + 
  xlab("My x-axis label for categorical variable") + 
  ylab("My y-axis label for numeric variable")
# legend position will tell R to put the legend on the right side of the plot

# Box plot - for one categorical and one numeric variable
boxplot(NumericVariable ~ CategoricalVariable, data = DataFile, 
        ylab = "My y-axis label", xlab = "My x-axis label", main = "Title of plot")

# As we mentioned before there are many sample data sets built into R. Iris is a
# data set that contains measurements for four features (sepal length, sepal
# width, petal length, and petal width) of three flower species (setosa,
# versicolor, and virginica). The four features are each a numeric variable
# while species is a factor (categorical) variable.

# If we would like to visualize the distribution of petal width values for three
# species then we can consult the KylaJacksonPlotTypes.png file to see
# which visualization is best for two variables where one is numeric and the
# other categorical. Our options are strip chart, box plot, multiple histogram,
# and cumulative frequency distributions. We will use box plot for this example.

# Here we put the numeric variable first followed by the categorical variable.
# Specify the data set these variables come from. Give the y-axis (ylab) and
# x-axis (xlab) a name as well as give the whole plot a title (main).

boxplot(Petal.Width ~ Species, data = iris, ylab = "Petal Width", xlab = "Flower Species", 
        main = "Variation in Petal Width Among Three Flower Species")

# In the space below, try to practice with other visualizations and variables within the Iris
# data set. Then, move on to the next section!





  
# HYPOTHESIS TESTING

# Now that we are familiar with the tools to explore our data let's put them
# into practice to formulate and test a hypothesis.

# For practice let's test the hypothesis that a juvenile will have longer play
# bouts than an adult. For this hypothesis we will focus on one juvenile (Nova)
# and one adult (Newton).

# To start, it would be helpful to group the data based on the variables you are
# most interested in. The variables of interest would be in the Behavior, Actor,
# Subject, and Duration columns.

# Below is some code to first create a dataframe for every obervation where Nova
# is either the Actor (initiates behavior) or Subject (receives behavior) during
# Social Play. The same code but for Newton is below.

Nova <- ResearchObs[ResearchObs$Actor=="Nv" | ResearchObs$Subject=="Nv",]
NovaPlay <- Nova[Nova$Behavior=="Social Play",]
View(NovaPlay)

Newton <- ResearchObs[ResearchObs$Actor=="Nw" | ResearchObs$Subject=="Nw",]
NewtonPlay <- Newton[Newton$Behavior=="Social Play",]
View(NewtonPlay)

# Now that we have two subsets for how much Nova played and how much Newton
# played, lets go ahead and visualize them to get an idea of their distributions
# visually. This can be done using the "simple.eda" function which will
# construct a few different graphs portraying the data in different ways.

simple.eda(NovaPlay$Duration)
simple.eda(NewtonPlay$Duration)

# In order to proceed with testing this data, we need to first assess if it is
# normally distributed. This will dictate which types of tests are applicable.
# The shapiro.test function allows you to test the hypothesis that the data is
# normally distributed. It assumes a null hypothesis that the data follows a
# normal distribution and by including "$p.value" following our function we can
# extract just the important p-value information.

shapiro.test(NovaPlay$Duration)$p.value
shapiro.test(NewtonPlay$Duration)$p.value

# Newton's play data has a p-value greater than .05 so we fail to reject the
# null hypothesis that the data is normally distributed. However, Nova's data
# rejected the null so we can attempt to log transform the data to see if it
# will make it normal. We will use the natural log and log base 10.

shapiro.test(log(NovaPlay$Duration))$p.value
shapiro.test(log10(NovaPlay$Duration))$p.value

# Neither of these transformations made Nova's data normal, so we will proceed
# with statistical tests designed to investigate data sets that are not normally
# distributed. These tests are called non-parametric.

# Had our sample been normally distributed we would have to select different
# statistical tests, called parametric which assumes the data is normal.

# Ultimately we will be testing the null hypothesis that there is no difference
# in the play duration of Nova and Newton, a juvenile and an adult. This can be
# written more concisely as:
  
#  H0: Nova play duration (juvenile) - Newton play duration (adult) = 0

# Our alternative hypothesis is that there is a difference in play duration:
  
#  HA: |Nova play duration (juvenile) - Newton play duration (adult)| > 0
# The HA utilizes absolute values to represent that the difference could be
# negative if Newton plays more than Nova, but if the absolute value is larger
# than 0 then it would still show that there is a difference.

# If both data sets were normal then we would have run a t-test for two
# independent samples, but because we need to use non-paramtric tests we will
# analyze the data using a Wilcoxon Mann Whitney test. The url below will direct
# you to a helpful guide online for picking the correct statistical test and
# provides the R code to run it.

# https://stats.idre.ucla.edu/other/mult-pkg/whatstat/
  
wilcox.test(NovaPlay$Duration, NewtonPlay$Duration)

# We see from the output of our test that the p-value is greater than .05 (p =
# 0.6671). This leads us to fail to reject our null hypothesis that there is no
# difference in the duration of social play for Nova and Newton from our
# capuchin group. Therfore we can state that the juvenile and adult we tested
# play for similar lengths of time.

# We can visualize the amount of play by Nova and Newton using a boxplot. This
# visualization works well when you have one categorical and one numeric
# variable. In this case, the individual monkey will be categorical and the
# amount of play is numeric.

# Now we can create a boxplot of these differences with the following code:
  
boxplot(NovaPlay$Duration, at = 1, xlim = c(0.5, 2.5), 
        ylim = range(c(NovaPlay$Duration, NewtonPlay$Duration)), xlab = "Capuchin", 
        ylab = "Social Play Duration", main = "Juvenile and Adult Social Play")
boxplot(NewtonPlay$Duration, at = 2, add = TRUE)
# This above code for a boxplot was used to force the Newton data to be
# displayed with Nova's. So Nova's boxplot is positioned at 1 and Newton's is
# positioned at 2. add = TRUE is to specify that Newton's data is added to
# Nova's plot

# RECAP

# The framework outlined here will allow you to proceed from selecting
# a hypotheses of interest, subsetting the data based on the variables you are
# most interested in, visualizing those subsets and further assessing their
# normality, selecting the correct statistical test, and finally interpretting
# the results of that test with regards to your initial hypotheses.

# Now try it out with a different hypothesis using a different behavior or
# subjects (maybe male vs. female this time) from the initial data set!
  
# ACKNOWLEDGEMENTS
# Ian Vogel completed the R Basics and Hypothesis Testing sections.
# Julie Berhane completed the Data Exploration and Visualization sections.
# Additional edits made by each author to tailor the tutorial to NEUR 253 (Ian
# Vogel) and ANBE 296 (Julie Berhane).
# Reflow comment idea from BIOL 205 group
