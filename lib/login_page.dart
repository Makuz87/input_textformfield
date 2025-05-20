import 'package:flutter/material.dart';
import 'package:input_textformfield/second_page.dart';
import 'package:input_textformfield/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ##################################################################

class _LoginPageState extends State<LoginPage> {
  String userInput = "";
  final testUser = User(userMail: "markus@gmail.com", userPassword: "12345");

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

//
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
//

  @override
  Widget build(BuildContext context) {
//

//
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //                        Email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email eingeben"),
                border: OutlineInputBorder(),
              ),
            ),
            //
            SizedBox(height: 32),
            //                        Password
            TextFormField(
              controller: passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                label: Text("Passwort "),
                border: OutlineInputBorder(),
                suffix: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            //                          Bttn
            FilledButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                if (email == testUser.userMail &&
                    password == testUser.userPassword) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "falsche Eingabedaten",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  );
                }
              },
              child: Text("Login"),
            )
            //
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


// 
