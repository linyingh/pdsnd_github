
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

# The three most common start stations in New York City


ny = read.csv('new_york_city.csv')
names(ny)
dim(ny)
summary(ny$Start.Station,6)

library(ggplot2)

ggplot(data.frame(subset(ny, ny$Start.Station%in%c('Pershing Square North',
                                                   'W 21 St & 6 Ave',
                                                   'Broadway & E 22 St'))), aes(x=Start.Station)) +
  geom_bar()+
ggtitle('The 3 most common start stations in New York City')+
ylab('Count of Start Stations')


#The 3 most common start stations in New York City are
#Pershiong Square North(592 count),W 21 St & 6 Ave (385 count)
#and Broadway & E 22 St (383 count).

# How is bike trip duraiton different by gender in New York City?


ny = read.csv('new_york_city.csv')
names(ny)
summary(ny$Trip.Duration)
by(ny$Trip.Duration,ny$Gender,summary)

library(ggplot2)
qplot(x=Gender,y=Trip.Duration,data=subset(ny, ny$Gender%in%c('Male','Female')),geom='boxplot')+
coord_cartesian(ylim=c(0,1500))+
ggtitle('Tirp Duration Differences between Male and Female Users in New York City')



#After excluding the cells value that are blank in the Gender column and the outliers that have value beyond 1500
#for the Trip Duration column, we can see from the box plot that the median trip duration of female users are higher
#than the male users.

# Which birth year range do most of users in Chincago fall into?


chi = read.csv('chicago.csv')
names(chi)
summary(chi$Birth.Year)

library(ggplot2)
qplot(x=Birth.Year, data=chi,color=I('black'), fill=I('#099DD9'))+
scale_x_continuous(limits=c(1920,2010),breaks=seq(1920,2010,5))+
ggtitle("Birth Year of Users in Chicago")+
ylab('Count of Users')




#most of the users were born between 1985-1990 in Chicago

system('python -m nbconvert Explore_bikeshare_data.ipynb')
