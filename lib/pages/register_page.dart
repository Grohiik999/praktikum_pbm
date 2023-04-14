import 'package:flutter/material.dart';
import 'package:praktikum_pbm/pages/login_page.dart';

String Username = "";
String Password = "";

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // backgroundColor: Colors.black12,
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: RegisterScreen(),
        // backgroundColor: Colors.black,
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegister() {
    final String username2 = _usernameController.text;
    final String password2 = _passwordController.text;
    Username = username2;
    Password = password2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.0,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/496/496216.png?w=740&t=st=1681456677~exp=1681457277~hmac=64efdacdd5080003719876dbb3e0647eab12ba3d67e723fe4c9bd552dad19e38',
                  height: 100.0,
                ),
              ),
              SizedBox(
                height: 70,
                child: Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Masukkan username',
                    labelStyle: TextStyle(color: Colors.red),
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))
                    ),
                    style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password',
                  labelStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                style: TextStyle(color: Colors.red),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (Username != null || Password != null) {
                    _handleRegister();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          username_login: Username,
                          password_login: Password,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}