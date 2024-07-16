from jinja2 import Template
    with open('example.jinja') as f:
        tmpl = Template(f.read())
    print(tmpl.render(
        list_title = "Chapter Contents",
        list_description = "Here are the contents of chapter 16.",
        item_list = ["Mechanisms Of Template Injection", "Preventing Template Injection", "Hunting For Template Injection", "Escalating Template Injection", "Automating Template Injection", "Find your First Template Injection!"]
))
