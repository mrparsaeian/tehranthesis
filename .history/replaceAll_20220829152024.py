from jinja2 import Template
mytemplate = Template("Hello {{place}}!")
print(mytemplate.render(place="Palo Alto"))
mytemplate = Template(
    "Some numbers: { % for n in range(1, 10) % }{{n}}{% endfor % }")
print(mytemplate.render())
