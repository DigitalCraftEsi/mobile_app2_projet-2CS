import 'package:flutter/material.dart';
import 'package:mob2/Bloc/AuthBloc.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ForgotPasswordScreen.dart';
import 'SignUpScreen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool _obscureText = true;
  bool _isChecked = false;
  bool _isloading=false;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  Future<void> _login() async {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isloading=true;
      });
      await Provider.of<AuthBloc>(context,listen: false).Signin(_email,_password);
      setState(() {
        _isloading=false;
      });
      Map<String,dynamic> data=Provider.of<AuthBloc>(context,listen: false).data;
      if(data["statusCode"]==200 && data["data"]["role"]=="CONSUMER"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
              HomeScreen()),
        );
      }
      else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("${data["message"]}"),
              actions: <Widget>[
                ElevatedButton(
                  child:  Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 40, left: 20, bottom: 50),
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
                                "Good Morning,  ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                              ),
                              Image.asset(
                                "lib/UI/assets/Images/img_1.png",
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                          const Text(
                            "Welcome back!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "lib/UI/assets/Images/img.png",
                        height: 70,
                        width: 100,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 50, left: 0, right: 20),
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
                            const SizedBox(height: 16.0),
                            TextFormField(
                              obscureText: _obscureText,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                return null;
                              },
                              onSaved: (input) => _password = input!,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(200, 51, 51, 51),
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
                            const SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.1,
                                      child: Checkbox(
                                        value: _isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _isChecked = value!;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 33, 130, 97),
                                          ),
                                        ),
                                        activeColor: const Color.fromARGB(
                                            255, 33, 130, 97),
                                      ),
                                    ),
                                    const Text(
                                      "Keep me logged in",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword()),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 33, 130, 97)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 40.0),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 60),
                                child: SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ), backgroundColor: Color.fromARGB(255, 33, 130, 97),
                                    ),
                                    onPressed: _login,
                                    child: _isloading?CircularProgressIndicator(color: Colors.white,strokeWidth: 3,): Text(
                                      "Login",
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
                                children: [
                                  const Text(
                                    "Don’t have an account?",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(200, 51, 51, 51),
                                    ),
                                  ),
                                  TextButton(
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
                                        color: Color.fromARGB(255, 33, 130, 97),
                                      ),
                                    ),
                                  ),
                                ]),
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
    );
  }
}
