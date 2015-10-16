# Consolidate Oil_Gas data frame into two columns that summarise the data by year by summing the monthly gas production so that it can be combined with the Fortune 500 Data
Production <- Oil_Gas[,c("YEAR","GAS_PRODUCED_MCF","WATER_PRODUCED_BBL")] %>% filter(GAS_PRODUCED_MCF != '(null)',GAS_PRODUCED_MCF != 'null')%>% group_by(YEAR) %>% summarise(gas_prod = sum(as.numeric(as.character( GAS_PRODUCED_MCF))))%>%tbl_df

# Join the Oil_Gas summary with the Fortune 500 Data to show how two energy companies' (CheveronTexaco and Exxon Mobil) yearly profit is influenced by the amount of gas produced in a year
Fortune_Gas <- dplyr::inner_join(Production, Fortune500, by="YEAR") %>% select(YEAR, COMPANY, PROFIT_IN_MILLIONS_,gas_prod) %>% filter(COMPANY %in% c("Exxon Mobil", "ChevronTexaco"), YEAR >= 1990) %>% tbl_df

#Combine the oil and gas data along with the country population data to see how oil production rises over time in comparison to varying populations
Oil_Country <- dplyr::left_join(Production, Country, by="YEAR") %>% select(YEAR, gas_prod) %>% View

#Join the Fortune 500 data with the Dow Jones data and then compared the top 10 companies by rank over a three decade span that associates the opening and closing of the Dow Jones during that time frame.                                                                   
Fortune_Dow <- dplyr::right_join(Dow_Jones, Fortune500, by="YEAR") %>% select(YEAR, COMPANY, RANK, Open_, Close_) %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK <= 10) %>% tbl_df

#All else fails commenting out Fortune with Country combo
Fortune_Country <- dplyr::right_join(Fortune500, Country, by="YEAR") %>% select(YEAR, North America, PROFIT_IN_MILLIONS_, COMPANY, RANK) %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK <= 10) %>% View



