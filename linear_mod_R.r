# Load libraries
library(ggplot2)
#Sets up input from terminal
args = commandArgs()


#Reading in the data file
data = read.csv(args[6])
#Making scatter plot
ggplot(data , aes(x = x , y = y )) + geom_point() + xlab('X') + ylab('Y')
ggsave("r_orig.png")

#Running the linear model
model = lm(formula = y ~ x, data = data)
sum_stats = summary(model)

# Making LM plot
ggplot() +
  geom_point(aes(x = data$x, y = data$y),
             colour = 'red') + xlab('X') + ylab('Y') +
  geom_line(aes(x = data$x, y = predict(model, newdata = data)),
            colour = 'blue') 
ggsave("r_lm.png")


