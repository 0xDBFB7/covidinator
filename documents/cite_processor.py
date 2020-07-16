import json

#Export Better BibTeX JSON from Zotero

JSON_INPUT = 'test.json'

refs = json.loads(open(JSON_INPUT).read())
collections = refs["collections"]
# A tree of
#
items = refs["items"]
#items have
# notes: [ "<p>, ",

# they can also be standalone notes, with the key "note" present.

print(collections)


files = glob.glob('*.tex')
