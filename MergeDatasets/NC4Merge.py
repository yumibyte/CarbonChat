#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct  4 17:04:49 2020

@author: ashleyraigosa
"""

"""
import netCDF4 as nc
fn = 'OCO_CO2.nc4'
ds = nc.Dataset(fn)

# access metadata
# print(ds)

# dimensions
# for dim in ds.dimensions.values():
#     print(dim)

# variables
# for var in ds.variables.values():
#     print(var)

# bias correction for column-averaged dry-air mole fraction of CO2
#print("DATES")
#print(ds['date'][:])
#print("LONGITUDE")
#print(ds['longitude'][:])
#print("LATITUDE")
#print(ds['latitude'][:])
#print("XCO2")
#print(ds['xco2'][:])
#print("UNCERTAINTY")
#print(ds['xco2_uncertainty'][:])
"""
import pandas as pd
import numpy as np
import os
import fnmatch
import netCDF4 as nc
from pandas import DataFrame


path = os.getcwd()

# retrieve all files in directory and get rid of py file in it (this file)
file_list = os.listdir(path)
file_list.remove("NC4Merge.py")
InfoDF = pd.DataFrame()
#print(ds['date'])

datesList = []
longitudeList = []
latitudeList = []
xco2List = []
uncertaintyList = []
localityList = []
largerAreaList = []
countryList = []

yearsList = []
monthsList = []
daysList = []
hoursList = []

# retrieve values for date, xco2, lat, long, uncertainty, and location for each 30,000 piece of data in each file in this directory
for file in file_list:
    ds = nc.Dataset(file)
    date = ds['date'][:]
    longitude = ds['longitude'][:]
    latitude = ds['latitude'][:]
    xco2 = ds['xco2'][:]
    uncertainty = ds['xco2_uncertainty'][:]
    
    for i in range(0, len(date), 30000):
        datesList.append(date[i])
        longitudeList.append(longitude[i])
        latitudeList.append(latitude[i])
        xco2List.append(xco2[i])
        uncertaintyList.append(uncertainty[i])

# discover location
locationsList = []
import reverse_geocoder as rg
import pprint
coordinatePairs = zip(latitudeList, longitudeList)

for pair in coordinatePairs:
    result = rg.search(pair)
    locationsList.append(result)

# retrieve locality, largerArea, country
for location in locationsList:
    localityList.append(location[0]['name'])
    largerAreaList.append(location[0]['admin1'])
    countryList.append(location[0]['cc'])
    
# convert dates list into year, month, day, hour
for date in datesList:
    yearsList.append(date[0])
    monthsList.append(date[1])
    daysList.append(date[2])
    hoursList.append(date[3])

# combine all lists into one list to be zipped 
finalDataList = tuple(zip(yearsList, monthsList, daysList, hoursList, xco2List, localityList, largerAreaList, countryList, latitudeList, longitudeList, uncertaintyList))
print(finalDataList)

# write to excel file

def Write_xlsx(fileName, data):
    DB_columns = ['year', 'month', 'day', 'hour', 'CO2', 'locality', 'largerArea', 'country', 'lat', 'long', 'uncertainty']

    df = DataFrame(data, columns=DB_columns)
    df.to_excel(fileName, index=False)
Write_xlsx('mergedNC4Data.xlsx', finalDataList)
