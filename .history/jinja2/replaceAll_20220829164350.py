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
numebrOfVariables = pd.Series({{'variableName':"Initial",'variableValue': 1}, {'variableName':2,'variableValue': 1}, {'variableName':2,'variableValue': 1}})
template = latex_jinja_env.get_template('tex/jinja-template.tex')
outputTexVariables = template.render(
    Variables='InitialSampleSize', VariableValues='512', numebrOfVariables= numebrOfVariables)
print(outputTexVariables)
with open("./tex/variables.tex", "w") as output:
    output.write(outputTexVariables)
