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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Store"),
        backgroundColor: Color.fromARGB(255, 242, 209, 159),
      ),
      body: StreamBuilder(
        stream: Books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['Name']),
                    subtitle: Text(documentSnapshot['price']),
                    trailing: Text(documentSnapshot['out of stock']),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
