pacman::p_load(tidyverse)
library(readxl)
list_df<-list.files(path = "C:/Users/岡本　龍士/Documents/RA課題/data/raw/assignment1_data/学級数",full.names =  T)
#list.filesはpathをfullで指定しないと機能しない

name_df<-list.files(path = "C:/Users/岡本　龍士/Documents/RA課題/data/raw/assignment1_data/学級数",full.names =  F)
names<-c("data_2013","data_2022","data_2014","data_2015","data_2016",
         "data_2017","data_2018","data_2019","data_2020","data_2021")
df<-list_df |>
  map(\(df){
    df<-df |>
      read_excel()
    
    return(df)
  }) |>
  set_names(names) 

install.packages("janitor")
library(janitor)
df<-df |>
  map(\(df){
    
    df<-df |>
      row_to_names(row_number = 1)
     
  })

saveRDS(df, "data_class_original")

