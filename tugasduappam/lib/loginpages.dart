import 'package:flutter/material.dart';
import 'package:tugasduappam/homepages.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: SingleChildScrollView( 
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logosepatu.png',
                  width: 300,
                ),
                const SizedBox(height: 30), 
                _usernameField(),
                _passwordField(),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white, 
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? const Color.fromARGB(255, 0, 0, 0) : Colors.red,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white, 
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess) ? const Color.fromARGB(255, 0, 0, 0) : Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), 
          ),
        ),
        onPressed: () {
          String text = "";
          if (username == "Nabila" && password == "tugas2asik") {
            setState(() {
              text = "Login success!";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homepages(username: username),
              ),
            );
          } else {
            setState(() {
              text = "Login Failed!";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Login"),
      ),
    );
  }
}
