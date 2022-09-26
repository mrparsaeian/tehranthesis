#!/usr/bin/env python3
import jinja2
import os
import pandas as pd
import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

session = requests.Session()
retry = Retry(connect=3, backoff_factor=0.5)
adapter = HTTPAdapter(max_retries=retry)
session.mount('http://', adapter)
session.mount('https://', adapter)

r = session.get('https://www.ponya.ir/api18211/users', verify=False)
print(r.status_code())
with open("./jija2/variables.json", "w") as output:
    output.write(r.json())


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
Variables = {1: {'variableName': 'InitialSampleSize', 'variableValue': 512},
             2: {'variableName': 'CleanedSampleSize', 'variableValue': 400},
             3: {'variableName': 'sampleAgeMean', 'variableValue': 25.2},
             4: {'variableName': 'sampleAgeMeanMale',
                 'variableValue': 25.2},
             5: {'variableName': 'sampleAgeMeanFemale', 'variableValue': 23.2}}
template = latex_jinja_env.get_template('tex/jinja-template.tex')
outputTexVariables = template.render(
    Variables=Variables,  numebrOfVariables=len(Variables))
print(outputTexVariables)
with open("./tex/variables.tex", "w") as output:
    output.write(outputTexVariables)
