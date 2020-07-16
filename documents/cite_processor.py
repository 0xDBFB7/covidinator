import json
import pybtex
import difflib
import Levenshtein as lev
from fuzzywuzzy import fuzz
from fuzzywuzzy import process
import re
import glob
#difflib
#pip install fuzzywuzzy
#pip install python-Levenshtein

#Export Better BibTeX JSON from Zotero,
# And also a Better BibTeX BibTeX.

JSON_INPUT = 'references.json'
BIB_INPUT = 'references.bib'

refs = json.loads(open(JSON_INPUT).read())
collections = refs["collections"]
# A tree of
#
items = refs["items"]
#items have
# notes: [ "<p>, ",

# they can also be standalone notes, with the key "note" present.


# print(collections)

tex_files = glob.glob('*.tex')
tex_files.pop(tex_files.index("preamble.tex")) # don't include the definition of the supercite command

# fuzzy_tags = []
# for x in items:
#     tag = ""
#     if "title" in x.keys():
#         tag += x["title"]
#         "creators" in x.keys():
#         ["creators"][0]["lastName"]
# Cite keys

cite_keys = [x["citekey"] for x in items if "citekey" in x.keys()]
for tex_file in tex_files:
    with open(tex_file) as f:
        tex = f.read()
    with open("backup/backup_" + tex_file, "w+") as f:
        f.write(tex)

    keys = re.finditer('supercite{', tex)
    for key in keys:
        tag_start = key.end()
        tag_end = tex.find('}',tag_start)
        text_begin = tex.find('{',tag_end)
        text_end = tex.find('}',text_begin)

        fuzzy_tag = tex[tag_start:tag_end]

        highest = process.extractOne(fuzzy_tag,cite_keys)
        ref_item = items[cite_keys.index(highest[0])]


        formatted_reference = str(ref_item["itemID"]) + "\href{\faExternalLink}{+"  "+ }"

        tex = tex[:text_begin+1] +  + tex[text_end:]

        keys = re.finditer('supercite{', tex) # keys have moved


    supercollections = re.finditer('supercollections{', tex)
    for supercollection in supercollections:
        tag_start = key.end()
        tag_end = tex.find('}',tag_start)
        text_begin = tex.find('{',tag_end)
        text_end = tex.find('}',text_begin)

        


    with open(tex_file, "w+") as f:
        f.write(tex)

    # format_from_files
