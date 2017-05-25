## README

This repo collects various data analyses about political protests, immigration, environmental issues, police brutality and crime, and the arts.

## Week 19

Using data from the National Family Health Survey 3, conducted in 2005-2006, is there a natural way to cluster Indian households, based on data about the nature of these households -- do they have electricity, a TV, a computer, a cow, an ox-drawn cart, etc?  I use topological data analysis to find the number of clusters.

See folder for codebook and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week19/NFHS-DHS-V.html

TAGS: topological data analysis, clustering

## Week 18

After a few weeks off to deal with end-of-semester grading, I look at some simple descriptive statistics about US college degrees awarded in math and statistics, in computer science, in environment-related areas, and in outdoor recreation-related areas.  The data comes from the US Dept of Education's College Scorecard.

See folder for data files and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week18/CollegeStats.html

TAGS: descriptive statistics

## Week 15

Looking at recent state-level data on India's male alcohol consumption and women's empowerment, I find a positive correlation.

See folder for data files and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week15/IndiaAlcoholWomenEmpowerment.html

TAGS: ggplot, plotly

## Week 14

Using the Pew Research Center data on religion in the US, as in last week, I construct a logistic regression model that predicts with 89% accuracy whether or not you are Christian.  This was mostly for fun, to see how accurate I could get it.  I also made a Shiny app so you can answer the survey questions and see what the algorithm predicts for you.

See folder for data files and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week14/PredictReligion.html

Shiny app available at:

https://lukewolcott.shinyapps.io/InTheResistance_Week14/

TAGS: logistic regression, multinomial logistic regression, random forests, Shiny

## Week 13

I look at Pew Research Center data on religion in the US.  After binning respondents into six categories -- Christian, Muslim, Jewish, Buddhist, Other, and None -- I look at their views on homosexuality, spiritual experience, and the role of religion in society.

See folder for data files and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week13/ReligiousViews.html

TAGS: ggplot


## Week 12

In a third week with mangrove forest data, we use multiple linear regression to find which environmental health indicators correlate with a country's mangrove deforestation.

See folder for data files and R Markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week12/MangroveLossEnvirHealth.html

TAGS: multiple linear regression

## Week 11

Continuing the analysis from Week 10, we look for a correlation between a country's mangrove deforestation and its Environmental Performance Index.

See folder for data files and R Markdown report with all code, or read the report at:

<https://lukewolcott.github.io/InTheResistance/Week11/MangroveLossEPI.html>

TAGS: ggplot, plotly, linear regression

## Week 10

Data visualizations of how mangrove forests around the world changed in 2000-2012.

See folder for data files and R markdown report with all code, or read the report at:

https://lukewolcott.github.io/InTheResistance/Week10/MangroveLoss.html

TAGS: ggplot, plotly

## Week 9

Clusters Chicago's 77 "Community Areas" using city data on 21 health factors, and then compares these clusters using economic data on per capita income, unemployment, etc.  Includes a bit of topological data analysis for finding the right number of clusters.

See folder for data file and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week9/ClusteringChicago.html

TAGS: machine learning, ggplot, plotly, topological data analysis

## Week 8

Looks at art grants given through the Organizational Grant Program of the Los Angeles County Arts Commission, over the three application years of 2014-15, 2015-16, and 2016-17: what types of art are funded, and how much?

See folder for data file and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week8/ArtGrants.html

TAGS: plotly

## Week 7

This week is whimsical: using a dataset off the 500 largest Indian cities, I build machine learning algorithms that predict with 84% accuracy that the average large Indian city is in the Central region of the country.

See folder for data files and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week7/predict_region.html

TAGS: machine learning

## Week 6

A Shiny App that allows the user to compare Department of Homelands Security data on the removal (deportation) of "aliens" from 2006 to 2015, among countries and regions of the world.

See folder for data and Shiny files.  The app is available at:

https://lukewolcott.shinyapps.io/InTheResistance_Week06/

TAGS: ggplot, Shiny

## Week 5

Looks at immigration enforcement -- apprehensions, removals, and forced returns -- by US immigration offices from 1925-2015.

See folder for data files and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week5/ImmigrationEnforcementOverTime.html

TAGS: ggplot

## Week 4

Compares the offered wages and prevailing wages listed on application for H1-B visas, coming from "H1-B Dependent" employers and "H1-B Non-Dependent" employers.

See folder for data files and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week4/H1BVisaEmployersComparison.html

TAGS: hypothesis testing

## Week 3

Calculates the percentage of H1-B visa applications affected by the proposed law HR-670, which would raise the wage exemption level for "H1-B Dependent" employers from $60,000 to $130,000.

See folder for data files and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week3/H1BVisaCutoffIncrease.html

TAGS: descriptive statistics

## Week 2

Compares the size of 1/21/2017 protests to the number of non-Trump voters, in each state, using Nov 2016 election data.

See folder for data files and R markdown report with all code used, or read at:

https://lukewolcott.github.io/InTheResistance/Week2/WomensMarchByState.html

TAGS: plotly, linear regression, heatmap

## Week 1

Looks at relative sizes of US Women's March protests on Jan 21, 2017.  Uses a Python script to scrape a Wikipedia site and extract population data.

See folder for data files and R markdown report, or read at:

https://lukewolcott.github.io/InTheResistance/Week1/WomensMarchCrowds.html

TAGS: Python, webscrape, leaflet