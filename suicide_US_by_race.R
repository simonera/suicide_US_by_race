library(readr)
mytotal <- read_csv("https://raw.githubusercontent.com/simonera/suicide_US_by_race/main/suicide%20by%20race%2C%201999-2020%20-%20total.csv")
head(mytotal)

# plot
library(ggplot2)
library(scales)

plot_total <- ggplot(data=mytotal, aes(y = Race, x = Deaths)) +
  geom_col() +
  labs(title = "Suicides in the United States by race, 1999-2020", 
       caption = "Sources: CDC",
       subtitle = "838,850 people died of suicide in the United States between 1999 and 2020. Most of them were white.") +
  scale_x_continuous(labels = comma)

plot_total

plot_rate <- ggplot(data=mytotal, aes(y = Race, x = `Age Adjusted Rate`)) +
  geom_col() +
  labs(title = "Suicide rate in the United States by race, 1999-2020", 
       caption = "Sources: CDC",
       subtitle = "Suicide rate (deaths per 100,000 people) is particularly high also among Native Americans.") +
  scale_x_continuous(labels = comma)

plot_rate

mytrend <- read_csv("https://raw.githubusercontent.com/simonera/suicide_US_by_race/main/suicide%20by%20race%2C%201999-2020%20-%20by%20year.csv")
head(mytrend)

plot_trend <- ggplot(data = mytrend, aes(x = Year, y = `Age Adjusted Rate`)) +
  geom_line(aes(linetype = Race, color = Race)) +
  labs(title = "Trend in suicide rate in the United States by race, 1999-2020", 
     caption = "Suicide increased remarkably between 1999 and 2018. Then, the overall rate declined.
     This decline is concentrated among white Americans. There was a significant increase among Native Americans and Black Americans.")
  
plot_trend


