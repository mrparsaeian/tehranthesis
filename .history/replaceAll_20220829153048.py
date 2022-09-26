
from jinja2 import Environment, FileSystemLoader, Template
import os
latex_jinja_env = Environment(
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
    loader=FileSystemLoader(os.path.abspath('.'))
)
header = ['Num', 'Date', 'Ticker']


data2 = [[1, 2, 3], [4, 'STR', 'Test'], [5, 6, 'Ticker']]
renderer_template = Template.render(dict_map=data2, header=header)
