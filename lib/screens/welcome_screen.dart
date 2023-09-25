import 'package:doctor/screens/admin_login_screen.dart';
import 'package:doctor/screens/login_screen.dart';
import 'package:doctor/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AdminLoginScreen(),
                    ));
                },
                child: Text("Admin Panel ", style: TextStyle(color: Colors.blueGrey, fontSize: 25,
                ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(20),
              child: Image.asset("assets/images/doctor.gif"),
            ),
            SizedBox(height: 50,),
            Text("Health Monitoring App",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10,),
            Text("Health Tracker",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child:Text("LogIn",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignUpScreen()
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child:Text("SignUp",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}