import 'package:flutter/material.dart';
import 'screen4.dart';
import 'screen5.dart';
import 'screen6.dart';
import 'screen8.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password,_confirmPassword;
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password != _confirmPassword) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Passwords don't match"),
              actions: <Widget>[
                RaisedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      } else {
        // TODO: Implement sign-up logic
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 40, left: 20, bottom: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "HI   ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                                Image.asset(
                                  "images/img_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Welcome to ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "SmartBev",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 33, 130, 97),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          "images/img.png",
                          height: 70,
                          width: 100,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          const EdgeInsets.only(top: 40, left: 0, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 51, 51, 51),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'This will be your username',
                                  hintStyle: TextStyle(
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
                              const SizedBox(height: 16.0),
                              TextFormField(
                                obscureText: _obscureText,
                                validator: (input) {
                                  if (input!.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _password = input!,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                obscureText: _obscureText2,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _confirmPassword = value!,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50.0),
                              const Text(
                                "Email preferences & terms",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.7,
                                    child: Checkbox(
                                      value: _isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                          color: Color.fromARGB(255, 33, 130, 97),
                                        ),
                                      ),
                                      activeColor:
                                      const Color.fromARGB(255, 33, 130, 97),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 240,
                                    child: Text(
                                      "I do not wish to receive news, special offers and more form SmartBev",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const SizedBox(
                                width: 300,
                                child: Text(
                                  "By clicking this button, I agree to the SmartBev Site",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2.0),
                              const Text(
                                "Terms of Use",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 33, 130, 97),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child:  SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: RaisedButton(
                                      onPressed: _submit,
                                      color: const Color.fromARGB(255, 33, 130, 97),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      child: const Text(
                                        "Join now",
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
