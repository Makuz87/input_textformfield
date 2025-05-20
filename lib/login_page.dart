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
  final user = User(userMail: "markus@gmail.com", userPassword: "12345");

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
              controller: _emailController,
              decoration: InputDecoration(
                label: Text("Email eingeben"),
                border: OutlineInputBorder(),
              ),
            ),
            //
            SizedBox(height: 32),
            //                        Password
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                label: Text("Passwort "),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _obscurePassword = !_obscurePassword;
                      },
                    );
                  },
                ),
              ),
            ),
            //                          Bttn
            FilledButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email == user.userMail && password == user.userPassword) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "falsche Eingabedaten",
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
