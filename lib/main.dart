import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/Home.dart';
import 'package:test/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Ideal time to initialize

//...
  runApp(MaterialApp(
    home: BoomBoom(),
  ));
}

class BoomBoom extends StatelessWidget {
  const BoomBoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
