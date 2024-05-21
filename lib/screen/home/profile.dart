import 'package:flutter/material.dart';
import 'package:hotel/auth/service/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); 
                      },
                      child: const Text('Back'),
                    ),
                    TextButton(
                      onPressed: () {
                        authService.signOut();
                        Navigator.of(context).pop(); 
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
