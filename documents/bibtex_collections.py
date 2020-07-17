from pybtex.database import parse_file
import pybtex
import json
pybtex.errors.set_strict_mode(False)
#I'd love to be able to do this from inside
# The better-bibtex plugin.
# unfortunately, the plugin already iterates through collections

JSON_INPUT = 'references.json'

refs = json.loads(open(JSON_INPUT).read())
collections = refs["collections"]

bibtex = pybtex.database.parse_file('references.bib')

# cite_keys = [x["citekey"] for x in items if "citekey" in x.keys()]
# filtered_items = [x for x in items if "citekey" in x.keys()]

# print(bibtex)
for key in bibtex.entries:
    entry = bibtex.entries[key]
    id = int(entry.fields["itemID"])
    collection_name = ""
    for collection in collections.values():
        if(id in collection["items"]):
            collection_name = collection["name"]
            break

    entry.fields["collection"] = collection_name
    entry.fields["keywords"] = collection_name

    # cite_key =

    # .index()

    #
    # #from collection itemID to cite key
    # cite_keys = []
    # for i in collection["items"]:
    # item = itemID_filtered[itemIDs.index(i)]
    # cite_keys.append(item["citekey"])
    #
    # # collection_bibtex = [for i in ]
    #
    #
    # keys = list(re.finditer(CITE_TAG, te)

bibtex.to_file('processed.bib')
