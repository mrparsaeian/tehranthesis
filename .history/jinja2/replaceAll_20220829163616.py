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
numebrOfVariable = pd.Series({'a': 1, 'b': 2, 'c': 3})
template = latex_jinja_env.get_template('tex/jinja-template.tex')
outputTexVariables = template.render(
    VariableName='InitialSampleSize', VariableValue='512')
print(outputTexVariables)
with open("./tex/variables.tex", "w") as output:
    output.write(outputTexVariables)
