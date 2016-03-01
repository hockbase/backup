from HTMLParser import HTMLParser
class MyHTMLParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self.flag = 0
        self.links = []
        self.title = ""
        self.img= ""
        self.content = ""

    def handle_starttag(self,tag,attrs):
        if tag == "a":
            if len(attrs) == 0: pass
            else:
                for (variable,value) in attrs:
                    if variable == "href":
                        self.links.append(value)

