import json
from pybtex.database import parse_file
import pybtex

import difflib
import Levenshtein as lev
from fuzzywuzzy import fuzz
from fuzzywuzzy import process
import re
import glob
import os
#difflib
#pip install fuzzywuzzy
#pip install python-Levenshtein

#Export Better BibTeX JSON from Zotero,
# And also a Better BibTeX BibTeX.

#Munge a LaTeX document with fuzzy-matched cite keys


JSON_INPUT = 'references.json'
BIB_INPUT = 'references.bib'
BIB_STYLE = 'physical-review-letters.csl'

bibtex = pybtex.database.parse_file(BIB_INPUT)

refs = json.loads(open(JSON_INPUT).read())
collections = refs["collections"]
# A tree of
#
items = refs["items"]
#items have
# notes: [ "<p>, ",

# they can also be standalone notes, with the key "note" present.

changes = int(os.system("git diff --exit-code --quiet --ignore-submodules -- . ':(exclude)cite_processor.py'"))
# cached_changes = int(os.system("git diff --exit-code --quiet --ignore-submodules -- . ':(exclude)cite_processor.py' --cached"))
if(changes):
    print("Uncommitted changes are present. Commit before running.")
    raise

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

CITE_TAG = 'supercite{'
COLLECT_TAG = 'supercollect{'

itemIDs = [x["itemID"] for x in items if "itemID" in x.keys()]
itemID_filtered = [x for x in items if "itemID" in x.keys()]


cite_keys = [x["citekey"] for x in items if "citekey" in x.keys()]
filtered_items = [x for x in items if "citekey" in x.keys()]

print()

collections_filtered = [x for x in collections.values() if "name" in x.keys()]
collection_keys = [x["name"] for x in collections_filtered]


for tex_file in tex_files:

    with open(tex_file) as f:
        tex = f.read()
    with open("backup/backup_" + tex_file, "w+") as f:
        f.write(tex)

    #
    # keys = list(re.finditer(CITE_TAG, tex))
    # # offset = 0
    # for i in range(0, len(keys)):
    #     key = keys[i]
    #     tag_start = key.end()
    #     tag_end = tex.find('}',tag_start)
    #     text_begin = tex.find('[',tag_end)
    #     text_end = tex.find(']',text_begin)
    #
    #     fuzzy_tag = tex[tag_start:tag_end]
    #
    #     highest = process.extractOne(fuzzy_tag,cite_keys)
    #     ref_item = filtered_items[cite_keys.index(highest[0])]
    #
    #     print(fuzzy_tag, " = ", ref_item["title"], ref_item["itemID"])
    #
    #     # formatted_reference = str(ref_item["itemID"])
    #     formatted_reference = "\cite{" + ref_item["citekey"] + "}"
    #
    #     #add url
    #     if("DOI" in ref_item.keys()):
    #         formatted_reference += " \href{https://doi.org/" + ref_item["DOI"] + "}{\\faExternalLink}"
    #     elif("URL" in ref_item.keys()):
    #         formatted_reference += " \href{" + ref_item["URL"] + "}{\\faExternalLink}"
    #     else:
    #         print("No url for item " + ref_item["title"])
    #
    #
    #     tex = tex[:text_begin+1] + formatted_reference + tex[text_end:]
    #
    #     # offset += len(formatted_reference) - (text_end-text_begin) + 1
    #     # length of the inserted string minus the length of the string that was there
    #     keys = list(re.finditer(CITE_TAG, tex)) # keys have moved

    #Collections
    # keys = list(re.finditer(COLLECT_TAG, tex))
    # for i in range(0, len(keys)):
    #     key = keys[i]
    #     tag_start = key.end()
    #     tag_end = tex.find('}',tag_start)
    #     text_begin = tex.find('[',tag_end)
    #     text_end = tex.find(']',text_begin)
    #
    #     tag = tex[tag_start:tag_end]
    #
    #     highest = process.extractOne(tag,collection_keys)
    #     collection = collections_filtered[collection_keys.index(highest[0])]
    #
    #
    #     #from collection itemID to cite key
    #     cite_keys = []
    #     for i in collection["items"]:
    #         item = itemID_filtered[itemIDs.index(i)]
    #         cite_keys.append(item["citekey"])
    #
    #     # collection_bibtex = [for i in ]
    #
    #     collection_bibtex.to_file('bibliographies/' + tag + '.bib')
    #
    #     # formatted_bibliography = pybtex.Engine.format_from_file(BIB_INPUT, BIB_STYLE, citations=cite_keys)
    #
    #     # tex = tex[:text_begin+1] + formatted_bibliography + tex[text_end:]
    #
    #
    #     keys = list(re.finditer(CITE_TAG, tex))


    with open(tex_file, "w+") as f:
        f.write(tex)

    # format_from_files
