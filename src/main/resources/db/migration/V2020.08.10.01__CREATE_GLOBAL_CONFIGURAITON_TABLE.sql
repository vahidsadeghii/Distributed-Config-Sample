create table GLOBAL_CONFIGURATION (
ID INT AUTO_INCREMENT  PRIMARY KEY,
CONF_KEY varchar(50) unique,
CONF_VALUE varchar(255)
);