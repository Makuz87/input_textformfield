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

  final formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;

//______________________________________________________initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController;
    _emailController;
    _passwordController;
  }
//______________________________________________________

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          onChanged: () {
            final bool isFormValid = formKey.currentState!.validate();
            _isButtonDisabled = !isFormValid;
          },
          // nicht in die Form rein!
          // autovalidateMode: AutovalidateMode.onUnfocus,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //______________________________________________________User
              TextFormField(
                controller: _userController,
                validator: validateUsername,
                // autovalidateMode: AutovalidateMode.onUnfocus,
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
                // autovalidateMode: AutovalidateMode.onUnfocus,
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
                // autovalidateMode: AutovalidateMode.onUnfocus,
                decoration: InputDecoration(
                  label: Text("Passwort "),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        final bool isFormValid =
                            formKey.currentState!.validate();
                        if (isFormValid) {}

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondPage(),
                        ));
                      },
                child: Text("Login"),
              )
              //
            ],
          ),
        ),
      ),
    );
  }

// _____________________________________________________dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController;
    _emailController;
    _passwordController;
  }
  //____________________________________________________
}
