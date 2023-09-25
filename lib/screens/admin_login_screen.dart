import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel Example',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AdminLoginScreen(),
    );
  }
}

class AdminPanelScreen extends StatelessWidget {
  final String adminId;
  final List<Patient> patients;

  AdminPanelScreen({required this.adminId, required this.patients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin ID: $adminId",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // You can add more admin details here
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Patient Details:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: patients.map((patient) {
                    return ListTile(
                      title: Text("Name: ${patient.name}"),
                      subtitle: Text(
                          "Health Percentage: ${patient.healthPercentage.toStringAsFixed(2)}%"),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Patient {
  final String name;
  final double healthPercentage;

  Patient({required this.name, required this.healthPercentage});
}

class AdminLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ID",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
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
                        adminId: 'XYZ', // Replace with the actual admin ID
                        patients: [
                          Patient(
                            name: 'ABC', // Replace with actual patient data
                            healthPercentage: 90.0,
                          ),
                          // Add more patients here
                        ],
                      ),
                    ),
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}