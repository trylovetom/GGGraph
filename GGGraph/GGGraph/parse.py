import json
from pprint import pprint

clique1 = ["Thenardier", "Babet", "Claquesous", "Eponine", "Brujon", "Gueulemer", "Montparnasse"]
clique2 = ["Combeferre", "Enjolras", "Grantaire", "Joly", "Bahorel", "Feuilly", "Prouvaire", "Courfeyrac", "Bossuet", "Gavroche"]
clique3 = ["Blacheville", "Dahlia", "Zephine", "Tholomyes", "Fameuil", "Fantine", "Listolier", "Favourite"]

for clique in clique1:
	print(clique)

with open('graph.json') as data_file:    
    data = json.load(data_file)

for node in data["nodes"]:
	print("_ = graph.addVertex(\"" + node["id"] + "\")")
	node["group"] = 0
	
	for clique in clique1:
		if clique == node["id"]:
			node["group"] = 1

	for clique in clique2:
		if clique == node["id"]:
			node["group"] = 2

	for clique in clique3:
		if clique == node["id"]:
			node["group"] = 3

for link in data["links"]:
	print("graph.addEdge(from: \"" + link["source"] + "\", to: \"" + link["target"] + "\")")
	link["value"] = 1

with open('data.json', 'w') as outfile:
    json.dump(data, outfile)