import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookStor extends StatefulWidget {
  const BookStor({super.key});

  @override
  State<BookStor> createState() => _BookStorState();
}

class _BookStorState extends State<BookStor> {
  final CollectionReference Books =
      FirebaseFirestore.instance.collection('Books_Name');
  //-----------------------------------------------------------------------------------------------------update function start
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      nameController.text = documentSnapshot['Name'];
      priceController.text = documentSnapshot['price'];
      stockController.text = documentSnapshot['out of stock'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelText: 'Book name',
                    labelStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: priceController,
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelText: 'price',
                    labelStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: stockController,
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelText: 'out of stock',
                    labelStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                  onPressed: () async {
                    final String title = nameController.text;
                    final String subtitle = priceController.text;
                    final String trailing = stockController.text;

                    await Books.doc(documentSnapshot!.id).update({
                      "Name": title,
                      "price": subtitle,
                      "out of stock": trailing,
                    });
                    nameController.text = '';
                    priceController.text = '';
                    stockController.text = '';
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //-----------------------------------------------------------------------------------------------------update function end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Store"),
        backgroundColor: Color.fromARGB(255, 242, 209, 159),
      ),
      body: Container(
        height: 650,
        color: Color.fromARGB(255, 208, 176, 122),
        child: StreamBuilder(
          stream: Books.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  final docId = streamSnapshot.data!.docs[index].id;
                  return Card(
                      color: Color.fromARGB(255, 146, 93, 74),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(documentSnapshot['Name']),
                        subtitle: Text(documentSnapshot['price']),
                        trailing: Text(documentSnapshot['out of stock']),
                        leading: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('Books_Name')
                                .doc(docId)
                                .delete();
                          },
                          icon: Icon(Icons.delete_forever_outlined),
                        ),
                        onTap: () {
                          _update(documentSnapshot);
                        },
                      ));
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
