library(ggplot2)  # for plotting 

new.goals <- read.csv(file = "updated_goals.csv", header = TRUE)
new.goals$half = factor(new.goals$half,levels(new.goals$half)[c(2,3,1)])  # Reorder levels: first, second, extra



# All goals ----------------------------------------------------------------

all <- ggplot(new.goals, aes(x = time)) + 
  geom_histogram(breaks = seq(0, 125, 5), color = 'black', fill = 'steelblue3') + 
  labs(title = 'When World Cup Goals are Scored', x = 'Game Time', y = 'Count')

all



# All by World Cup ----------------------------------------------------------

by.cup <- ggplot(new.goals, aes(x = time)) + 
  geom_histogram(breaks = seq(0, 125, 5), color = 'black', fill = 'steelblue3') + 
  labs(title = 'When World Cup Goals are Scored by Year', x = 'Game Time', y = 'Count') + 
  facet_grid(year~.)

by.cup



# All by "half" with facet_grid ----------------------------------------------

by.half <- ggplot(new.goals, aes(x = time)) + 
  geom_histogram(binwidth = 5, color = 'black', fill = 'steelblue3') + 
  labs(title = 'When World Cup Goals are Scored by Half', x = 'Game Time', y = 'Count') + 
  facet_grid(.~half)

by.half



# Or each individual "half" ---------------------------------------------------

first.half <- subset(new.goals, half == 'First')

fh <- ggplot(first.half, aes(x = time)) + 
  geom_histogram(breaks = seq(0, 50, 5), color = 'black', fill = 'steelblue3') +
  labs(title = 'When First Half Goals are Scored', x = 'Game Time', y = 'Count')

fh



second.half <- subset(new.goals, half == 'Second')

sh <- ggplot(second.half, aes(x = time)) + 
  geom_histogram(breaks = seq(45, 95, 5), color = 'black', fill = 'steelblue3') +
  labs(title = 'When Second Half Goals are Scored', x = 'Game Time', y = 'Count')

sh


extra.time <- subset(new.goals, half == 'Extra')

et <- ggplot(extra.time, aes(x = time)) + 
  geom_histogram(breaks = seq(90, 125, 5), color = 'black', fill = 'steelblue3') +
  labs(title = 'When Extra Time Goals are Scored', x = 'Game Time', y = 'Count')


et
