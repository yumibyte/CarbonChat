import os

from lib.AnalyzeCO2 import analyzeState
from lib.PolynomialModel import callPolyModel
from flask import Flask
from flask import jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def root():
    return 'Welcome to CarbonChat!'

@app.route('/ping')
def ping():
    with open('gitsha.txt', 'r') as file:
        gitsha_data = file.read().replace('\n', '')
    return jsonify(
        message="pong!",
        datetime=datetime.now().strftime("%d/%m/%Y %H:%M:%S"),
        gitsha=gitsha_data
    )

@app.route('/analyzeCO2')
def analyzeCO2():
    return jsonify({'result':analyzeState()})

@app.route('/polymodel')

def polymodel():
    return jsonify({'result': callPolyModel()})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
