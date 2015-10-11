

Solo_1995 <- df %>% select(COMPANY, YEAR,PROFIT_IN_MILLIONS_, REVENUE_IN_MILLIONS_)  %>% filter(YEAR == 1955) %>% mutate(Rev = as.numeric(as.character(REVENUE_IN_MILLIONS_)), prof_percent = cume_dist(as.numeric(PROFIT_IN_MILLIONS_)), Ninety_Percentile= prof_percent > .90) %>% filter(prof_percent > .5,Rev>600) %>% tbl_df
X <- df %>% group_by(RANK, YEAR) %>% select(COMPANY, YEAR, PROFIT_IN_MILLIONS_) %>% filter(RANK < 6, YEAR<2005) %>% tbl_df
Y <- df %>% select(COMPANY, REVENUE_IN_MILLIONS_, PROFIT_IN_MILLIONS_, YEAR, RANK) %>% filter(YEAR %in% c(1955:2004),COMPANY%in%c("U.S. Steel","General Motors","Exxon Mobil","General Electric","Esmark")) %>% arrange(YEAR) %>% tbl_df


View(Solo_1995)
View(X)
View(Y)

