import 'package:flutter/material.dart';
import 'package:test/Screens/sing_in.dart';
import 'package:test/Screens/singup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 202, 127),
        title: Text("Library stor"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2018/10/09/01/19/books-3733892_960_720.jpg"))),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage("images/Owl.png"),
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Color.fromARGB(255, 99, 61, 5),
                    primary: Color.fromARGB(255, 253, 191, 99)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Sing_Up();
                    },
                  ));
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 61, 22, 7)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Color.fromARGB(255, 99, 61, 5),
                    primary: Color.fromARGB(255, 253, 191, 99)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Singin();
                    },
                  ));
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 61, 22, 7)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
