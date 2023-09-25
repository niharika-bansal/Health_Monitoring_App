import 'package:flutter/material.dart';

import 'admin_login_screen.dart';
import 'admin_panel.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(// Change app bar color to deep orange
      ),
      home: AdminLoginScreen(),
    );
  }
}

class AdminLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.greenAccent), // Increase font size and change text color
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ID",
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 18), // Increase font size
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 18), // Increase font size
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                style: TextStyle(fontSize: 18), // Increase font size
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your admin login logic here
                  // Check if the ID, username, and password are valid
                  // If valid, navigate to the admin panel
                  // If not valid, show an error message
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminPanelScreen(
                        adminId: '42001082020', // Replace with the actual admin ID
                        patients: [
                          Patient(name: 'Sachin', healthPercentage: 95),
                          Patient(name: 'Mitali', healthPercentage: 90),
                          Patient(name: 'Niha', healthPercentage: 97),
                          Patient(name: 'Vedika', healthPercentage: 91),
                          Patient(name: 'Aditya', healthPercentage: 92),
                          Patient(name: 'Alex', healthPercentage: 100),
                          Patient(name: 'Niha', healthPercentage: 97),
                          Patient(name: 'Vedika', healthPercentage: 91),
                          Patient(name: 'Aditya', healthPercentage: 92),

                          // Add more patients here
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20), // Increase button text size
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, // Change button color to deep orange
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Increase button padding
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}