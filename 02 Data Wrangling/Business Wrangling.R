# Consolidate Oil_Gas data frame into three columns that summarise the data by year by summing the monthly gas production and water production so that it can be combined with the Fortune 500 Data
Production <- Oil_Gas[,c("YEAR","GAS_PRODUCED_MCF","WATER_PRODUCED_BBL")] %>% filter(GAS_PRODUCED_MCF != 'null')%>% group_by(YEAR) %>% summarise(gas_prod = sum(as.numeric(GAS_PRODUCED_MCF)))%>%tbl_df

#Join the Oil_Gas summary with the Fortune 500 Data to show how oil company profit 
Fortune_Gas <- dplyr::inner_join(Production, Fortune500, by="YEAR") %>% select(YEAR, COMPANY, PROFIT_IN_MILLIONS_,gas_prod) %>% filter(COMPANY %in% c("Exxon Mobil", "ChevronTexaco")) %>% View




dplyr::left_join(Fortune500, Country, by="YEAR") %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK < 10) %>% View

dplyr::inner_join(Dow_Jones, Fortune500, by="YEAR") %>% View



