#Our unique graphs are found at the bottom of this code with a description of it in the comments.


#Graph 1: This graph compares Exxon Mobil, Chevron Texaco, and Conoco Philips from 1990 to 2000 on their profit vs the amount of oil produced in MCF.

ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_wrap(~COMPANY) +
  labs(title="Gas Production vs Profit for Three Fortune 500 Energy Companies") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="Barrels of Gas Produced in MCF", y=paste("Profit in Millions")) +
  layer(data=Fortune_Gas, 
        mapping=aes((x=as.numeric(as.character(gas_prod))), y=(as.numeric(as.character(PROFIT_IN_MILLIONS_))), color=(as.numeric(as.character(Year)))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        #geom_bar(width = 2,colour = "yellow",position = position_dodge(),stat = "identity"),
        geom_params=list(size = 3), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )+
  scale_colour_gradient("Year",low= 'orange', high='midnightblue')


#Graph 2: This graph analyzes the trend of population increase as it pertains to the average industrial stock prices


ggplot(Dow_Country) + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title='Dow Jones Industrial Avg vs World Population from 1980 to 2005') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="World Population in Millions", y=paste("Industrial Stock Average")) +
  layer(data=Dow_Country, 
        mapping=aes(x= WORLD, y=as.numeric(as.character(high)), color=YEAR), 
        
        stat="identity", 
        stat_params=list(), 
        geom="line",
        geom_params=list(size = 2.5),
        #position=position_identity()
        position=position_jitter(width=.3, height=0)
  ) +
  scale_colour_gradient("Year",low= 'red', high='blue')


#Graph 3: Compares the top 5 Fortune 500 Companies and their revenues relative to the year and the North American population.

ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_grid(~RANK, labeller = label_both) +
  labs(title='Top Fortune 500 Companies Revenue vs Population') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="North American Population in Millions", y=paste("Revenue in Millions")) +
  layer(data=Fortune_Country, 
        mapping=aes(x=NORTH_AMERICA, y=as.numeric(as.character(REVENUE_IN_MILLIONS_)), color=as.character(YEAR)), 
        stat="identity", 
        stat_params=list(), 
        geom="bar",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=.3, height=0)
  )

