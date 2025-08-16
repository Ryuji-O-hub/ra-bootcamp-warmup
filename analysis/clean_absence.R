library(tidyverse)
df_noblank<-df_renamed[,c(-6,-9,-12,-15,-18,-21,-24,-27,-30,-33)]
test1<-df_noblank[,c(-1,-2,-3)]
test2<-test1[1:47,]
test3<-test2[, c(-3,-5,-7,-9,-11,-13,-15,-17,-19)] %>%
  rename(prefecture = "prefecture_2013")
test4<-pivot_longer(test3,
                    cols = -1,
                    names_to = c("variable","year"),
                    names_sep = "_",
                    values_to = "value")
test5<-test4 %>%
  pivot_wider(
    names_from = variable,
    values_from = value
  ) %>%
  mutate(year = as.integer(year)) 

df_students<-df_noblank[,1:3]

merged_df <- inner_join(df_students, test5, by = c("prefecture", "year"))
library(labelled)
var_label(merged_df)<-list("prefecture" = "都道府県",
                           "year" = "年",
                           "students" = "生徒数",
                           "absentees" = "不登校生徒数")
merged_df<-relocate(merged_df, "prefecture", .after = "year")

#年度別で不登校者数の割合を計算

merged_df<-as_tibble(merged_df)
merged_df<-merged_df %>%
  mutate(absentees = as.numeric(absentees))
test6<-merged_df %>%
  group_by(year) %>%
  summarise(prop_year = sum(absentees)/sum(students)) %>%
  ungroup()
 
merged_df2 <- inner_join(merged_df, test6, by = "year")

#都道府県別で不登校者数の割合を計算

test7<-merged_df %>%
  group_by(prefecture) %>%
  summarise(prop_pref = sum(absentees)/sum(students)) %>%
  ungroup()

merged_df3 <- inner_join(merged_df2, test7, by = "prefecture")

var_label(merged_df3)<-list("prefecture" = "都道府県",
                           "year" = "年",
                           "students" = "生徒数",
                           "absentees" = "不登校生徒数",
                           "prop_year" = "年ごとの割合",
                           "prop_pref" = "地域ごとの割合")

#年度・都道府県別の列を追加する
merged_df<-merged_df %>%
  mutate(proportion = absentees/students)
library(labelled)
var_label(merged_df)<-list("prefecture" = "都道府県",
                           "year" = "年",
                           "students" = "生徒数",
                           "absentees" = "不登校生徒数",
                           "proportion" = "年別・都道府県別割合")

saveRDS(merged_df, "df_cleaned.rds")
