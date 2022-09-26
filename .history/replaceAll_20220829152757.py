
from jinja2 import Template
data2 = [[1, 2, 3], [4, 'STR', 'Test'], [5, 6, 'Ticker']]
renderer_template = Template.render(dict_map = data2, header = header)