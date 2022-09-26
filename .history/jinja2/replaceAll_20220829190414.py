#!/usr/bin/env python3
from cmath import nan
import jinja2
import os
import pandas as pd
import requests
import json
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# session = requests.Session()
# retry = Retry(connect=3, backoff_factor=0.5)
# adapter = HTTPAdapter(max_retries=retry)
# session.mount('http://', adapter)
# session.mount('https://', adapter)

# r = session.get('https://www.ponya.ir/api18211/users', verify=False)
with open("./jinja2/variables.json", "r") as inputFile:
    data = pd.read_json(inputFile)
    # data = json.loads(inputFile.read())


for json_inner_array in data:
    # for json_data in json_inner_array:
    print(json_inner_array["willingnessToPayOthers"])

InitialSampleSize = len(data)
CleanedSampleSize = 400
# sampleAgeMean = np.mean(data["108886540606931256604"]["demographic"]["age"])
sampleAgeMean = 32.1
sampleAgeMeanMale = 23.1
sampleAgeMeanFemale = 21.4


latex_jinja_env = jinja2.Environment(
    block_start_string='\BLOCK{',
    block_end_string='}',
    variable_start_string='\VAR{',
    variable_end_string='}',
    comment_start_string='\#{',
    comment_end_string='}',
    line_statement_prefix='%%',
    line_comment_prefix='%#',
    trim_blocks=True,
    autoescape=False,
    loader=jinja2.FileSystemLoader(os.path.abspath('.'))
)
Variables = {1: {'variableName': 'InitialSampleSize', 'variableValue': InitialSampleSize},
             2: {'variableName': 'CleanedSampleSize', 'variableValue': CleanedSampleSize},
             3: {'variableName': 'sampleAgeMean', 'variableValue': sampleAgeMean},
             4: {'variableName': 'sampleAgeMeanMale',
                 'variableValue': sampleAgeMeanMale},
             5: {'variableName': 'sampleAgeMeanFemale', 'variableValue': sampleAgeMeanFemale}}
template = latex_jinja_env.get_template('tex/jinja-template.tex')
outputTexVariables = template.render(
    Variables=Variables,  numebrOfVariables=len(Variables))
print(outputTexVariables)
with open("./tex/variables.tex", "w") as output:
    output.write(outputTexVariables)
