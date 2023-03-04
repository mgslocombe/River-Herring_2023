library(DBI)

#Create Datbase ----
rh_db <- dbConnect(RSQLite::SQLite(), "./DataClean/rh.db")

#Add fish table ----

##Create fish table in sql
dbExecute(rh_db, "CREATE TABLE fish (
fish_id char(5) NOT NULL,
cove varchar(12) CHECK (cove IN ('chapman', 'wethersfield', 'hamburg')),
month varchar(10) CHECK (month IN ('July', 'August', 'September')),
covemonth varchar(22) CHECK (covemonth IN ('hamburgAugust', 'hamburgJuly', 
  'wethersfieldJuly', 'wethersfieldAugust', 'wethersfieldSeptember', 'chapmanJuly', 
  'chapmanAugust', 'chapmanSeptember')),
age_days integer(2),
TL_mm integer(2),
PRIMARY KEY (fish_id)
);")

##Load fish csv into R
fish <- read.csv("./DataClean/Fish.csv",
                 stringsAsFactors = FALSE)

##Check that names align
names(fish)

##Write loaded csv into sql table
dbWriteTable(rh_db, "fish", fish, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM fish LIMIT 10;")

#Add envir table ----

##Create envir table in sql
dbExecute(rh_db, "CREATE TABLE envir (
cove varchar(12) CHECK (cove IN ('chapman', 'wethersfield', 'hamburg')),
month varchar(10) CHECK (month IN ('June', 'July', 'August', 'September')),
covemonth varchar(22) NOT NULL PRIMARY KEY CHECK (covemonth IN ('hamburgAugust', 'hamburgJuly', 
  'hamburgJune', 'hamburgSeptember', 'wethersfieldJune',  'wethersfieldJuly', 
  'wethersfieldAugust', 'wethersfieldSeptember', 'chapmanJune', 'chapmanJuly', 
  'chapmanAugust', 'chapmanSeptember')),
avg_cond real,
avg_temp real,
avg_DOperc real,
avg_DOmlg real
);")

##Load fish csv into R
envir <- read.csv("./DataClean/Envir.csv",
                 stringsAsFactors = FALSE)

##Check that names align
names(envir)

##Write loaded csv into sql table
dbWriteTable(rh_db, "envir", envir, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM envir LIMIT 10;")

#Add diet table ----

##Create diet table in sql
dbExecute(rh_db, "CREATE TABLE diet (
diet_id char(7) PRIMARY KEY NOT NULL,
fish_id char(5),
prey_type varchar(20),
prey_cat varchar(20),
total integer(3),
preybiomass_microg double,
FOREIGN KEY (fish_id) REFERENCES fish(fish_id)
);")

##Load diet csv into R
diet <- read.csv("./DataClean/Diet.csv",
                 stringsAsFactors = FALSE)

##Check that names align
names(diet)

##Write loaded csv into sql table
dbWriteTable(rh_db, "diet", diet, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM diet LIMIT 10;")

#Add diet_size table ----

##Create diet_size table in sql
dbExecute(rh_db, "CREATE TABLE diet_size (
dietsize_id char(11) PRIMARY KEY NOT NULL,
fish_id char(5),
prey_type varchar(20),
prey_cat varchar(20),
TL1 double,
TL2 double,
TL3 double,
TL4 double,
TL5 double,
TL6 double,
TL7 double,
TL8 double,
TL9 double,
TL10 double,
TL11 double,
TL12 double,
TL13 doulbe,
TL14 double,
TL15 double,
TL16 double,
TL17 double,
TL18 double,
TL19 double,
TL20 double,
FOREIGN KEY (fish_id) REFERENCES fish(fish_id)
);")

##Load diet_size csv into R
diet_size <- read.csv("./DataClean/Diet_Size.csv",
                 stringsAsFactors = FALSE)

##Check that names align
names(diet_size)

##Write loaded csv into sql table
dbWriteTable(rh_db, "diet_size", diet_size, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM diet_size LIMIT 10;")

#Add zp_biomass table ----

##Create diet table in sql
dbExecute(rh_db, "CREATE TABLE zp_biomass (
zp_id char(5) PRIMARY KEY NOT NULL,
cove varchar(12) CHECK (cove IN ('chapman', 'wethersfield', 'hamburg')),
month varchar(10) CHECK (month IN ('June', 'July', 'August', 'September')),
covemonth varchar(22) CHECK (covemonth IN ('hamburgAugust', 'hamburgJuly', 
  'hamburgJune', 'hamburgSeptember', 'wethersfieldJune',  'wethersfieldJuly', 
  'wethersfieldAugust', 'wethersfieldSeptember', 'chapmanJune', 'chapmanJuly', 
  'chapmanAugust', 'chapmanSeptember')),
site integer(1),
zp_order varchar(20),
zp_family varchar(20),
zp_genus varchar(20),
zp_indiv_per_m3 double,
zp_microg_per_m3 double,
FOREIGN KEY (covemonth) REFERENCES envir(covemonth)
);")

##Load diet csv into R
zp_biomass <- read.csv("./DataClean/ZP_Biomass.csv",
                 stringsAsFactors = FALSE)

##Check that names align
names(zp_biomass)

##Write loaded csv into sql table
dbWriteTable(rh_db, "zp_biomass", zp_biomass, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM zp_biomass LIMIT 10;")

#Add zp_size table ----

##Create zp_size table in sql
dbExecute(rh_db, "CREATE TABLE zp_size (
zpsize_id char(8) PRIMARY KEY NOT NULL,
cove varchar(12) CHECK (cove IN ('chapman', 'wethersfield', 'hamburg')),
month varchar(10) CHECK (month IN ('June', 'July', 'August', 'September')),
covemonth varchar(22) CHECK (covemonth IN ('hamburgAugust', 'hamburgJuly', 
  'hamburgJune', 'hamburgSeptember', 'wethersfieldJune',  'wethersfieldJuly', 
  'wethersfieldAugust', 'wethersfieldSeptember', 'chapmanJune', 'chapmanJuly', 
  'chapmanAugust', 'chapmanSeptember')),
site integer(1),
zp_type varchar(20),
zp_order varchar(20),
TL1 double,
TL2 double,
TL3 double,
TL4 double,
TL5 double,
TL6 double,
TL7 double,
TL8 double,
TL9 double,
TL10 double,
TL11 double,
TL12 double,
TL13 doulbe,
TL14 double,
TL15 double,
TL16 double,
TL17 double,
TL18 double,
TL19 double,
TL20 double,
TL21 double,
TL22 double,
TL23 double,
TL24 double,
TL25 double,
TL26 double,
TL27 double,
TL28 double,
TL29 double,
TL30 double,
TL31 double,
TL32 double,
TL33 double,
TL34 double,
TL35 double,
TL36 double,
TL37 double,
TL38 double,
TL39 double,
TL40 double,
TL41 double,
TL42 double,
TL43 double,
TL44 double,
TL45 double,
TL46 double,
TL47 double,
TL48 double,
TL49 double,
TL50 double,
TL51 double,
TL52 double,
TL53 double,
TL54 double,
TL55 double,
TL56 double,
TL57 double,
TL58 double,
TL59 double,
TL60 double,
FOREIGN KEY (covemonth) REFERENCES envir(covemonth)
);")

##Load diet_size csv into R
zp_size <- read.csv("./DataClean/ZP_Size.csv",
                      stringsAsFactors = FALSE)

zp_size[zp_size == ''] <- NA

##Check that names align
names(zp_size)

##Write loaded csv into sql table
dbWriteTable(rh_db, "zp_size", zp_size, append = TRUE)

##Check that data loaded properly
dbGetQuery(rh_db, "SELECT * FROM zp_size LIMIT 10;")

