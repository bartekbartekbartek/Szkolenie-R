

#1) pobrać i zaimportować do środowiska plik

m2w<-read.csv("https://github.com/LaCH-UW/warsztatR/raw/master/data/muzeum2wojny.csv",header = TRUE, sep = ";", encoding="UTF-8")

#2) zrobić statystykę typów wpisów i wyeksportować ją do csv z poprawnymi nazwami kolumn

library(dplyr)


m2wfreq<-m2w %>%
  group_by(type) %>%
  summarise(n = n()) 

names(m2wfreq) <- c("typ","count")


write.csv( m2wfreq, file="frekwencje_typy_export.csv", row.names = FALSE, col.names = TRUE)

#3) znaleźć: a) najbardziej komentowany wpis "Comments count"

#max(m2w$comments_count, na.rm = TRUE)
m2w %>% filter(comments_count == max(m2w$comments_count, na.rm = TRUE)) ->mostComments

#3) znaleźć: b) wpis z największą liczbą lajków "likes count"

m2w %>% filter(likes_count == max(m2w$likes_count, na.rm = TRUE)) ->mostlikes

#3) znaleźć: c) średnią i medianę liczby lajków

mediana<-median(m2w$likes_count)
mean<-mean(m2w$likes_count)