#Our unique graphs are found at the bottom of this code with a description of it in the comments.


#Graph 1: This graph compares Exxon Mobil, Chevron Texaco, and Conoco Philips from 1990 to 2000 on their profit vs the amount of oil produced in MCF.

ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_wrap(~COMPANY) +
  labs(title="Gas Production vs Profit for Three Fortune 500 Energy Companies in the 90's") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="Barrels of Gas Produced in MCF", y=paste("Profit in Millions")) +
  layer(data=Fortune_Gas, 
        mapping=aes((x=as.numeric(as.character(gas_prod))), y=(as.numeric(as.character(PROFIT_IN_MILLIONS_))), color=(Year)), 
        stat="identity", 
        stat_params=list(), 
        geom="bar",
        geom_bar(width = .01,colour = "yellow",position = position_dodge(),stat = "identity"),
        geom_params=list(), 
       #position=position_identity()
       position=position_jitter(width=0.3, height=0)
   )



#Graph 2: This graph looks at the top 5 ranked fortune 500 companies in 1955 and how their rankings have changed from then to 2000

ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Top 5 Companies in 1955 Over Time') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="Year", y=paste("Fortune 500 Rank")) +
  layer(data=Top_5, 
        mapping=aes(x=as.character(YEAR), y=as.numeric(as.character(RANK)), color=COMPANY), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=.3, height=0)
  )



#Graph 3: This graph looks at the Fortune 500 companies in 1955 that had a revenue greater than $600 Million and highlights whether or not they are in the 90th percentile of the cumulative distribution function for profits.
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Expenditure Difference Between Fortune 500 Rank 1 and 10') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x="Year", y=paste("Expenditure (Millions)")) +
  layer(data=Summarized, 
        mapping=aes((x=as.character(YEAR)), y=(Expenses), color=as.character(RANK)), 
        stat="identity", 
        stat_params=list(), 
        geom="bar",
        geom_bar(colour = "black",position = "dodge",stat = "identity"),
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )    




