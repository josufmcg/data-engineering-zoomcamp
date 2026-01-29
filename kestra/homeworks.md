# Homeworks

1.- 134.5 MiB (Checked in metrics)
2.- green_tripdata_2020-04.csv (Checked in logs)
3.- `SELECT COUNT(*) AS total FROM `demo_dataset.yellow_tripdata` YT WHERE YT.filename IN ('yellow_tripdata_2020-01.csv', 'yellow_tripdata_2020-02.csv', 'yellow_tripdata_2020-03.csv', 'yellow_tripdata_2020-04.csv', 'yellow_tripdata_2020-05.csv', 'yellow_tripdata_2020-06.csv', 'yellow_tripdata_2020-07.csv', 'yellow_tripdata_2020-08.csv', 'yellow_tripdata_2020-09.csv', 'yellow_tripdata_2020-10.csv', 'yellow_tripdata_2020-11.csv', 'yellow_tripdata_2020-12.csv')` -> 24648499
4.- `SELECT COUNT(*) AS total FROM `demo_dataset.green_tripdata` YT WHERE YT.filename IN ('green_tripdata_2020-01.csv', 'green_tripdata_2020-02.csv', 'green_tripdata_2020-03.csv', 'green_tripdata_2020-04.csv', 'green_tripdata_2020-05.csv', 'green_tripdata_2020-06.csv', 'green_tripdata_2020-07.csv', 'green_tripdata_2020-08.csv', 'green_tripdata_2020-09.csv', 'green_tripdata_2020-10.csv', 'green_tripdata_2020-11.csv', 'green_tripdata_2020-12.csv')` -> 1734051
5.- `SELECT COUNT(*) AS total FROM `demo_dataset.yellow_tripdata` YT WHERE YT.filename IN ('yellow_tripdata_2021-03.csv')` -> 1925152
6.- Add a timezone property set to America/New_York in the Schedule trigger configuration (In wikipedia table)
