# scraping data from TFRRS for distance events
# 800m/1500m/3000mSC/5000m/10000m
# by gender, by Division, by Gender

#= URLS
# D1
https://www.tfrrs.org/lists/2909/2020_NCAA_Division_I_Outdoor_Qualifying/2020/o
https://www.tfrrs.org/archived_lists/2568/2019_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2019/o
https://www.tfrrs.org/archived_lists/2279/2018_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2018/o
https://www.tfrrs.org/archived_lists/1912/2017_NCAA_Div._I_Outdoor_Qualifying_(FINAL)/2017/o
https://www.tfrrs.org/archived_lists/1688/2016_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2016/o
https://www.tfrrs.org/archived_lists/1439/2015_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2015/o
https://www.tfrrs.org/archived_lists/1228/2014_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2014/o
https://www.tfrrs.org/archived_lists/1029/2013_NCAA_Division_I_Outdoor_Qualifying_(FINAL)/2013/o
https://www.tfrrs.org/archived_lists/840/2012_NCAA_Div._I_Outdoor_Qualifiers_(Final)/2012/o
https://www.tfrrs.org/archived_lists/673/2011_NCAA_Division_I_Outdoor_POP_List_(FINAL)/2011/o
https://www.tfrrs.org/archived_lists/528/2010_NCAA_Division_I_Outdoor_POP_List_(FINAL)/2010/o
D2
https://www.tfrrs.org/lists/2908/2020_NCAA_Div._II_Outdoor_Qualifying/2020/o
https://www.tfrrs.org/archived_lists/2571/2019_NCAA_Div._II_Outdoor_Qualifying_(FINAL)/2019/o
=#
# Tyler's scraping tutorial
# https://github.com/tyleransom/DScourseS18/blob/master/WebData/WebScrapingInJulia.ipynb


# add Packages HTTP, Gumbo, DataFrames

using HTTP
using Gumbo
using Cascadia
using DataFrames


# url as string
url = "https://www.tfrrs.org/lists/2909/2020_NCAA_Division_I_Outdoor_Qualifying/2020/o";

# initial scrape
r = HTTP.get(url);

# parse into traversable string
r_parsed = parsehtml(String(r.body));

# check object types
println(typeof(r))
println(typeof(r_parsed))

# extract header from HTML table
