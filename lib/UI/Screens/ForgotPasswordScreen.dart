import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top:30),
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/UI/assets/Images/img.png",
                          height: 70,
                          width: 100,
                        ),
                        const SizedBox(height: 40.0),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 33, 130, 97),
                          ),
                        ),
                        Container(
                          width:300,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top:30,right: 10, left: 10),
                          child: const Text(
                            "Don’t worry! Enter your registered email below to receive password instructions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(200, 51, 51, 51),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (input) {
                                  // handle email input changes
                                },
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!input.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _email = input!,
                              ),
                              const SizedBox(height: 50.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Text(
                                      "Remember Password?",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: Color.fromARGB(200, 51, 51, 51),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const Login()),
                                        );
                                      },
                                      child: const Text(
                                        "Log In",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromARGB(255, 33, 130, 97),
                                        ),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 20.0),
                              Center(
                                child: Container(
                                  child: SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: RaisedButton(
                                      color: const Color.fromARGB(
                                          255, 33, 130, 97),
                                      onPressed: (){},
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: const Text(
                                        "Reset Password",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Text(
                                      "Don’t have an account?",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: Color.fromARGB(200, 51, 51, 51),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const SignUp()),
                                        );
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromARGB(255, 33, 130, 97),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
              ),
                  ),
            ),
          ),
        ),
    );
  }
}
