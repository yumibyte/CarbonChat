#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct  3 20:21:34 2020

@author: ashleyraigosa
"""

# importing libraries

import numpy as np
import pandas as pd
import os
import json


def analyzeState():
    
    # make necessary variables global to be accessed in variable explorer
    global datasetState, XState, YState

    datasetState = pd.read_csv(os.path.join(
        os.environ['CARBONCHAT_DATA'], 'StateCO2Dataset.csv'))
    
    XState = datasetState.iloc[1, 2:]
    
    # contains all CO2 info under all subcategories and total for the state
    YState = datasetState.iloc[2:308,2:30].values
    print(YState)
    return "called"

    # print(json.dumps({'XState': XState, 'YState': YState}))
    
analyzeState()
