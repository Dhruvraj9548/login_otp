import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

class introScreen extends StatelessWidget {
  const introScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo (1).png'),
              Text('Ensure Smiles When Reached!', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 80.0),
              ElevatedButton.icon(
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page'),));
                },
                icon: Icon(Icons.forward, color: Colors.white,),
                label: Text('       Get started      ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize:
                    Size(0, 48), // Set minimum height of the button
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
