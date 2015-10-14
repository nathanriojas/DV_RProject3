dplyr::left_join(Fortune500, Country, by="YEAR") %>% filter(YEAR %in% c("1980", "1990", "2000"), RANK < 10) %>% View

dplyr::inner_join(Dow_Jones, Fortune500, by="YEAR") %>% View

