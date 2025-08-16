library("tidyverse")
setwd("C:/Users/岡本　龍士/Documents/RA課題/data/raw/assignment1_data/生徒数")
library(readxl)
seitosuu<-readxl::read_excel("生徒数.xlsx")
setwd("C:/Users/岡本　龍士/Documents/RA課題/data/raw/assignment1_data/不登校生徒数")
hutoukou<-map(list("2013年度_不登校生徒数.xlsx","2014年度_不登校生徒数.xlsx",
                   "2015年度_不登校生徒数.xlsx","2016年度_不登校生徒数.xlsx",
                   "2017年度_不登校生徒数.xlsx","2018年度_不登校生徒数.xlsx",
                   "2019年度_不登校生徒数.xlsx","2020年度_不登校生徒数.xlsx",
                   "2021年度_不登校生徒数.xlsx","2022年度_不登校生徒数.xlsx"),
              read_excel)
df<-data.frame(seitosuu,hutoukou)
df_renamed<-df %>%
  rename("prefecture" = 都道府県,
         "year" = 年度,
         "students" = "生徒数",
         "prefecture_2013" = 都道府県.1,
         "absentees_2013" = 不登校生徒数,
         "prefecture_2014" = 都道府県.2,
         "absentees_2014" = 不登校生徒数.1,
         "prefecture_2015" = 都道府県.3,
         "absentees_2015" = 不登校生徒数.2,
         "prefecture_2016" = 都道府県.4,
         "absentees_2016" = 不登校生徒数.3,
         "prefecture_2017" = 都道府県.5,
         "absentees_2017" = 不登校生徒数.4,
         "prefecture_2018" = 都道府県.6,
         "absentees_2018" = 不登校生徒数.5,
         "prefecture_2019" = 都道府県.7,
         "absentees_2019" = 不登校生徒数.6,
         "prefecture_2020" = 都道府県.8,
         "absentees_2020" = 不登校生徒数.7,
         "prefecture_2021" = 都道府県.9,
         "absentees_2021" = 不登校生徒数.8,
         "prefecture_2022" = 都道府県.10,
         "absentees_2022" = 不登校生徒数.9
         )
install.packages("expss")
library(expss)
install.packages("labelled")
library(labelled)
var_label(df_renamed)<-list("prefecture" = "都道府県",
                            "year" = "年度",
                            "students" = "生徒数",
                            "prefecture_2013" = "都道府県2013",
                            "absentees_2013" = "不登校生徒数2013",
                            "prefecture_2014" = "都道府県2014",
                            "absentees_2014" = "不登校生徒数2014",
                            "prefecture_2015" = "都道府県2015",
                            "absentees_2015" = "不登校生徒数2015",
                            "prefecture_2016" = "都道府県2016",
                            "absentees_2016" = "不登校生徒数2016",
                            "prefecture_2017" = "都道府県2017",
                            "absentees_2017" = "不登校生徒数2017",
                            "prefecture_2018" = "都道府県2018",
                            "absentees_2018" = "不登校生徒数2018",
                            "prefecture_2019" = "都道府県2019",
                            "absentees_2019" = "不登校生徒数2019",
                            "prefecture_2020" = "都道府県2020",
                            "absentees_2020" = "不登校生徒数2020",
                            "prefecture_2021" = "都道府県2021",
                            "absentees_2021" = "不登校生徒数2021",
                            "prefecture_2022" = "都道府県2022",
                            "absentees_2022" = "不登校生徒数2022"
                            )
#renameの時とVar_labelの時とで順番が逆
saveRDS(df_renamed, "df_renamed.rds")
