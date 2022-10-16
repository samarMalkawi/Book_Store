import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/CreatBook.dart';

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 209, 159),
        title: Text("Sign in"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 650,
            color: Color.fromARGB(255, 208, 176, 122),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welecom in our app pleas sign up",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 61, 22, 7))),
                //the email is ss@gmail.com
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: Email,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Color.fromARGB(255, 61, 22, 7),
                ),
                //the password is 123456
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: Password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 253, 191, 99)),
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Color.fromARGB(255, 61, 22, 7),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Color.fromARGB(255, 99, 61, 5),
                      primary: Color.fromARGB(255, 253, 191, 99)),
                  onPressed: (() async {
                    try {
                      var AuthObj = FirebaseAuth.instance;
                      UserCredential myUser =
                          await AuthObj.signInWithEmailAndPassword(
                              email: Email.text, password: Password.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AddBook();
                        },
                      ));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Sorry")));
                    }
                    ;
                  }),
                  child: Text(
                    "sign in",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 61, 22, 7)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
