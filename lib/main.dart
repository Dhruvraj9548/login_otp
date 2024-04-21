import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Intro_Screen.dart';
import 'package:login_app/verify_code.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    print('Error initializing: $error');
// Handle initialization error gracefully, possibly showing an error message to the user or retrying initialization.
    return;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: introScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneNumberController = TextEditingController();

  final auth = FirebaseAuth.instance;

  void navigateToCountryScreen() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (e) {},
        verificationFailed: (e) {},
        codeSent: (String verificationId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => verifyCodeScreen(
                  verificationId: verificationId,
                ),
              ));
        },
        codeAutoRetrievalTimeout: (e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Country Selection"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/Clip path group.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize:
                            Size(0, 48), // Set minimum height of the button
                      ),
                      onPressed: navigateToCountryScreen,
                      child: Text(
                        "     Login Using OTP     ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            Text(
              'By Clicking on Button,\n'
              "you are agree to Reaching's Disclaimers,",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Privacy Policy and Terms and Conditions.',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
