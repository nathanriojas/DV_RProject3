<<<<<<< HEAD
Solo_1995 <- df %>% select(COMPANY, YEAR,PROFIT_IN_MILLIONS_, REVENUE_IN_MILLIONS_)  %>% filter(YEAR == 1955) %>% mutate(Rev = as.numeric(as.character(REVENUE_IN_MILLIONS_)), prof_percent = cume_dist(as.numeric(PROFIT_IN_MILLIONS_)), Ninety_Percentile= prof_percent > .90) %>% filter(prof_percent > .5,Rev>600) %>% tbl_df

Summarized <- df %>% group_by(YEAR, RANK,REVENUE_IN_MILLIONS_ ) %>% summarise(Expenses = sum(-as.numeric(as.character(PROFIT_IN_MILLIONS_)),as.numeric(as.character(REVENUE_IN_MILLIONS_))))%>%filter(RANK == 1|RANK==10,YEAR%in%c(1975:2000)) %>% tbl_df

Top_5 <- Oil_Gas %>% select(COMPANY, REVENUE_IN_MILLIONS_, PROFIT_IN_MILLIONS_, YEAR, RANK) %>% filter(YEAR %in% c(1955:2000),COMPANY%in%c("DuPont","General Motors","Exxon Mobil","Esmark")) %>% arrange(YEAR) %>% tbl_df

Concise_Oil_Gas <- Oil_Gas[,c("YEAR","GAS_PRODUCED_MCF","WATER_PRODUCED_BBL")]


Production <- Concise_Oil_Gas %>% select(YEAR, GAS_PRODUCED_MCF)%>% filter(GAS_PRODUCED_MCF != 'null') %>% summarise(gas_prod = sum(as.numeric(GAS_PRODUCED_MCF)))%>%View




Fortune_Gas <- dplyr::inner_join(Production, Fortune500, by="YEAR") %>% select(YEAR, COMPANY, PROFIT_IN_MILLIONS_,gas_prod) %>% filter(COMPANY %in% c("Exxon Mobil", "ChevronTexaco")) %>% View
#%>% filter(YEAR %in% c("1980", "1990", "2000")), RANK < 10) %>% View


dplyr::left_join(Dow_Jones, Fortune500, by="YEAR") %>% select(YEAR, Date, Open_, Close_) %>% filter(YEAR %in% c("1950", "1960", "1970", "1980", "1990")), Open_ > 10000, Close_ > 10000) %>% View



=======
dplyr::left_join(Fortune500, Country, by="YEAR") %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK < 10) %>% View

dplyr::inner_join(Dow_Jones, Fortune500, by="YEAR") %>% View
>>>>>>> 9bf2abbd35e32bf9778b53addb8b34552cda0426

