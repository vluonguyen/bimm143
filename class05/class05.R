#' ---
#' title: "Class05"
#' author: "Vina Nguyen A16151678"
#' date: "April 22nd, 2023"
#' ---

# Week 4 data visualization lab

# Install the package ggplot2
#install.packages("ggplot2")


# Any time I want to use this package I need to load it
library(ggplot2)

# View(cars)

# A quick base R plot - this is not a ggplot
plot(cars)

# Our first ggplot
# We need data + aes + geoms
ggplot(data=cars) + 
  aes(x=speed, y=dist) +
  geom_point()

p <- ggplot(data=cars) + 
  aes(x=speed, y=dist) +
  geom_point()

# Add a line geom with geom_line()
p + geom_line()

# Add a trend line close to the data
p + geom_smooth()

p + geom_smooth(method=lm)

# Add label annotations with labs()
p + labs(title = "Speed and Stopping Distances of Cars",
         x="Speed (MPH)", 
         y="Stopping Distance (ft)",
         subtitle="Informative subtitle text",
         caption="Dataset: 'cars'") +
  geom_smooth(method="lm") +
  geom_point() +
  theme_bw()

#-----------------#

# Read in our drug expression data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q.How many genes are in this dataset
nrow(genes)

# Q. How many columns are there
ncol(genes)
colnames(genes)

# Q.How many "up" regulated genes
table(genes$State)

# Q. What fraction of total genes is upregulated
round(table(genes$State)/nrow(genes) * 100, 2)


# First plot attempt
g <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, color=State) +
  geom_point()

# Add colors
g + scale_colour_manual( values=c("blue", "gray", "red")) +
  labs(title="Gene Expression Changes Upon Drug Treatment", 
       x="Control (no drug)", 
       y="Drug Treatment") + 
  theme_bw()

