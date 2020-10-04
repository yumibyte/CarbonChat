#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct  3 20:21:34 2020

@author: ashleyraigosa
"""

# importing libraries

import numpy as np
import pandas as pd


def analyzeState():
    
    # make necessary variables global to be accessed in variable explorer
    global datasetState, XState

    datasetState = pd.read_csv('StateCO2Dataset.csv')
    XState = datasetState.iloc[2:308,2:30].values
    
analyzeState()