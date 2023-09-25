import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/screens/login_screen.dart';
import 'package:doctor/screens/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  final CollectionReference _table = FirebaseFirestore.instance.collection('User');

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  void _create() async {
    String? name1 = name.text;
    String? email1 = email.text;
    int? phone1 = int.tryParse(phone.text);
    String? password1 = password.text;

    await _table.add({
      "name": name1,
      "email": email1,
      "phone": phone1,
      "password": password1,
    });

    // Add navigation code here if needed
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MessageScreen(),
    ));
  }

  // ... rest of your code ...

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // ... your other widgets ...
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/images/doctor.gif"),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Full name"),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email Address"),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Phone Number"),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: password,
                  obscureText: passToggle? true:false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        if(passToggle == true){
                          passToggle = false;
                        }
                        else{
                          passToggle = true;
                        }
                        setState(() {

                        });
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_fill),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: _create, // Call _create when the button is tapped
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),



              // ... rest of your code ...
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Already have account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}