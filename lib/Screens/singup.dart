import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sing_Up extends StatefulWidget {
  const Sing_Up({super.key});

  @override
  State<Sing_Up> createState() => _Sing_UpState();
}

class _Sing_UpState extends State<Sing_Up> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        backgroundColor: Color.fromARGB(255, 242, 209, 159),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 650,
            color: Color.fromARGB(255, 208, 176, 122),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welecom in our app please sign up",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 99, 61, 5)),
                ),
                SizedBox(
                  height: 50,
                ),
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: Password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 252, 186, 87)),
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
                          await AuthObj.createUserWithEmailAndPassword(
                              email: Email.text, password: Password.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Your email is add successfully")));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Sorry the email is already exist")));
                    }
                    ;
                  }),
                  child: Text(
                    "sign up",
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
