import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/location_screen.dart';

class verifyCodeScreen extends StatefulWidget {

  final String verificationId;
  const verifyCodeScreen({Key? key, required this.verificationId}): super(key:key);

  @override
  State<verifyCodeScreen> createState() => _verifyCodeScreenState();
}

class _verifyCodeScreenState extends State<verifyCodeScreen> {
  final verificationCodeController = TextEditingController();

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("   OTP Verification", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Enter the OTP you received to\n +91 1234567890", style: TextStyle( fontSize: 15),),
                    ],
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: verificationCodeController,
                    decoration: InputDecoration(
                      hintText: '',
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
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("RESEND OTP", style: TextStyle(color: Colors.blue),),
                    ],
                  ),


                  SizedBox(height: 20),



                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize:
                      Size(0, 48), // Set minimum height of the button
                    ),
                    onPressed: () async{

                      final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId,
                          smsCode: verificationCodeController.text.toString());

                      try{
                        await auth.signInWithCredential(credential);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => locationScreen(),));

                      }catch(e){
                      }


                    },
                    child: Text("     Submit     ", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


