# Consolidate Oil_Gas data frame into two columns that summarise the data by year by summing the monthly gas production so that it can be combined with the Fortune 500 Data (This wrangle is indirectly used in the visualizations)

Production <- Oil_Gas[,c("YEAR","GAS_PRODUCED_MCF","WATER_PRODUCED_BBL")] %>% filter(GAS_PRODUCED_MCF != '(null)',GAS_PRODUCED_MCF != 'null')%>% group_by(YEAR) %>% summarise(gas_prod = sum(as.numeric(as.character( GAS_PRODUCED_MCF))))%>%mutate(Year = as.character(YEAR))%>% tbl_df



# Wrangle 1. Join the Oil_Gas summary with the Fortune 500 Data to show how two energy companies' (CheveronTexaco and Exxon Mobil) yearly profit is influenced by the amount of gas produced in a year

Fortune_Gas <- dplyr::inner_join(Production, Fortune500, by="YEAR") %>% select( COMPANY, PROFIT_IN_MILLIONS_,gas_prod, Year) %>% filter(COMPANY %in% c("Exxon Mobil", "ChevronTexaco", "ConocoPhillips"),as.numeric(as.character(Year))>1989)%>%tbl_df


# Get the average of the monthly openings of the Dow Jones to get the open data average per year
Dow <- Dow_Jones[,c("YEAR","Open_")] %>% group_by(YEAR) %>% summarise(opening = sum(as.numeric(as.character( Open_))))%>% tbl_df

#Combine the oil and gas data along with the country population data to see how oil production rises over time in comparison to varying populations
Dow_Country <- dplyr::left_join(Dow, Country, by="YEAR") %>% select(YEAR,opening,WORLD) %>% View


#Combine Fortune 500 and Country population data to create a revenue relative to population data set including year and ranks.
Fortune_Country <- dplyr::right_join(Fortune500, Country, by="YEAR") %>% select(YEAR, NORTH_AMERICA, REVENUE_IN_MILLIONS_, COMPANY, RANK) %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK <= 5) %>% View



