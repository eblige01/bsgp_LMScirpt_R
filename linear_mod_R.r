library(ggplot2)
args = commandArgs()



data = read.csv(args[6])
print(data)
ggplot(data , aes(x = x , y = y )) + geom_point() + xlab('X') + ylab('Y')

model = lm(formula = y ~ x, data = data)
sum_stats = summary(model)
sum_stats$r.squared
coef(model)[1]
coef(model)[2]

ggplot() +
  geom_point(aes(x = data$x, y = data$y),
             colour = 'red') + xlab('X') + ylab('Y') +
  geom_line(aes(x = data$x, y = predict(model, newdata = data)),
            colour = 'blue') 



