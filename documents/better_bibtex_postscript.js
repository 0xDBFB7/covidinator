// //inspiration https://github.com/zotero/translators/blob/master/Zotero%20RDF.js
// //documentation https://retorque.re/zotero-better-bibtex/exporting/scripting/
// //https://www.zotero.org/support/dev/client_coding/javascript_api
// if (Translator.BetterBibLaTeX) {
//     var collection;
//     while (collection = Zotero.nextCollection()) {
//         var children = collection.children ? collection.children : collection.descendents;
// 	if (!children) return;
// 	for (var i=0; i<children.length; i++) {
// //might need recursion here
//             if (child.type != "collection" && (itemResources[child.id] == item.id)){
//                 reference.add({name: 'collection', value: collection.name});
//             }
//         }
//     }
// }
//Zotero.nextCollection() only goes one way. Either this.collections could be passed to the
//postscript, or some other solution?


///inspiration https://github.com/zotero/translators/blob/master/Zotero%20RDF.js
///documentation https://retorque.re/zotero-better-bibtex/exporting/scripting/
///https://www.zotero.org/support/dev/client_coding/javascript_api
///https://groups.google.com/forum/#!searchin/zotero-dev/collection%7Csort:date

Zotero.debug("Doot");
//Zotero.debug(JSON.stringify(reference.collections))

//Zotero.debug(JSON.stringify(collectionIDs))
//this.add({name: 'collection', value: 'TEMP'});
//Zotero.debug(collections[0].name);
//this.add({name: 'collection', value: collectionIDs[0].id});
this.add({name: 'itemID', value: item.itemID});
