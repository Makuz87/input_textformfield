import 'package:flutter/material.dart';
import 'package:input_textformfield/src/domain/validate_user.dart';
import 'package:input_textformfield/src/presentation/second_page.dart';
import 'package:input_textformfield/src/domain/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ##################################################################

class _LoginPageState extends State<LoginPage> {
  final user =
      User(userMail: "markus@gmail.com", userPassword: "MarkusWillmann_38");

  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

//______________________________________________________initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
//______________________________________________________

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //______________________________________________________User
            TextFormField(
              controller: _userController,
              validator: validateUsername,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                label: Text("Namen eingeben"),
                border: OutlineInputBorder(),
              ),
            ),
            //______________________________________________________Email
            SizedBox(height: 32),

            TextFormField(
              controller: _emailController,
              validator: validateEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                label: Text("Email eingeben"),
                border: OutlineInputBorder(),
              ),
            ),
            //
            SizedBox(height: 32),
            //___________________________________________________Password
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
            //______________________________________________________Bttn
            FilledButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email == user.userMail && password == user.userPassword) {
                  Navigator.of(context).pushReplacement(
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

// _____________________________________________________dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  //____________________________________________________
}
