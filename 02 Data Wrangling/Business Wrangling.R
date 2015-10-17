# Consolidate Oil_Gas data frame into two columns that summarise the data by year by summing the monthly gas production so that it can be combined with the Fortune 500 Data (This wrangle is indirectly used in the visualizations)

Production <- Oil_Gas[,c("YEAR","GAS_PRODUCED_MCF","WATER_PRODUCED_BBL")] %>% filter(GAS_PRODUCED_MCF != '(null)',GAS_PRODUCED_MCF != 'null')%>% group_by(YEAR) %>% summarise(gas_prod = sum(as.numeric(as.character( GAS_PRODUCED_MCF))))%>%mutate(Year = as.character(YEAR))%>% tbl_df



# Wrangle 1. Join the Oil_Gas summary with the Fortune 500 Data to show how two energy companies' (CheveronTexaco and Exxon Mobil) yearly profit is influenced by the amount of gas produced in a year

Fortune_Gas <- dplyr::inner_join(Production, Fortune500, by="YEAR") %>% select( COMPANY, PROFIT_IN_MILLIONS_,gas_prod, Year) %>% filter(COMPANY %in% c("Exxon Mobil", "ChevronTexaco", "ConocoPhillips"))%>%tbl_df


# Get the average of the monthly highs of stock prices from the Dow Jones to get the high data average per year
Dow <- Dow_Jones[,c("YEAR","High","Low")] %>% group_by(YEAR) %>% summarise(high = mean(as.numeric(as.character( High))))%>% tbl_df

#Wrangle 2. Combine world population data with the Dow Jones industrial average data
Dow_Country <- dplyr::left_join(Country,Dow, by="YEAR") %>% select(YEAR,high,low,WORLD) %>% filter(YEAR < 2006)%>% tbl_df


#Wrangle 3. Combine Fortune 500 and Country population data to create a revenue relative to population data set including year and ranks.
Fortune_Country <- dplyr::right_join(Fortune500, Country, by="YEAR") %>% select(YEAR, NORTH_AMERICA, REVENUE_IN_MILLIONS_, COMPANY, RANK) %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK <= 5) %>% tbl_df


tbl_df(Fortune_Gas)
tbl_df(Dow_Country)
tbl_df(Fortune_Country)
