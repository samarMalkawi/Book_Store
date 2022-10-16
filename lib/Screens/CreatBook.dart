import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/BookStore.dart';
import 'package:test/Screens/Home.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController BookName = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController outOfStock = TextEditingController();
  TextEditingController id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 209, 159),
        title: Text("Add books"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 650,
            color: Color.fromARGB(255, 208, 176, 122),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: id,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      label: Text("give me a unique ID"),
                      hintText: "Enter the Id of the book",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: BookName,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      label: Text("book name"),
                      hintText: "Enter the name of the book",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: Price,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      label: Text("Price in Dollar ?"),
                      hintText: "Enter the price of the book",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: outOfStock,
                    decoration: InputDecoration(
                      label: Text("Is it out of stock ?"),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      hintText: "yes / No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            try {
                              final name = BookName.text;
                              final Pr = Price.text;
                              final OS = outOfStock.text;
                              final ID = id.text;
                              createBook(name: name, Pr: Pr, OS: OS, ID: ID);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Added successfully :) ")));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Sorry somthing roung happened ); ")));
                            }
                          },
                          icon: Icon(Icons.add)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return BookStor();
                              },
                            ));
                          },
                          icon: Icon(Icons.shopping_cart)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ));
                          },
                          icon: Icon(Icons.logout_rounded)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createBook(
      {required String name,
      required String Pr,
      required String OS,
      required String ID}) async {
    final docBook = FirebaseFirestore.instance.collection('Books_Name').doc();
    final bookInfo = <String, dynamic>{
      'ID': ID,
      'Name': name,
      'price': Pr,
      'out of stock': OS,
    };
    await docBook.set(bookInfo);
  }
}
