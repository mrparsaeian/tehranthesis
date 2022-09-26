#!/usr/bin/env python3
import jinja2
import os
import pandas as pd
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
Variables = {{'variableName': 'InitialSampleSize', 'variableValue': 512},
             {'variableName': 'CleanedSampleSize', 'variableValue': 400},
             {'variableName': 'sampleAgeMean', 'variableValue': 25.2},
             {'variableName': 'sampleAgeMeanMale',
              'variableValue': 25.2},
             {'variableName': 'sampleAgeMeanFemale', 'variableValue': 23.2}}
template = latex_jinja_env.get_template('tex/jinja-template.tex')
outputTexVariables = template.render(
    Variables=Variables,  numebrOfVariables=len(Variables))
print(outputTexVariables)
with open("./tex/variables.tex", "w") as output:
    output.write(outputTexVariables)
