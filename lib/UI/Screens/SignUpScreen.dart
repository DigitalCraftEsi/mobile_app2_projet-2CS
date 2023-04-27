import 'package:flutter/material.dart';
import 'package:mob2/Bloc/AuthBloc.dart';
import 'package:mob2/UI/Screens/AllDoneScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _isChecked = false;
  bool _isloading=false;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password,_confirmPassword,_nom,_prenom,_telephone;
  Future<void> _submit() async {
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
        setState(() {
          _isloading = true;
        });
        await Provider.of<AuthBloc>(context, listen: false).Signup(nom: _nom,
            prenom: _prenom,
            telephone: _telephone,
            email: _email,
            password: _password);
        setState(() {
          _isloading = false;
        });
        Map<String, dynamic> data = Provider
            .of<AuthBloc>(context, listen: false)
            .data;
        if (data["statusCode"] == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AllDone()),
          );
        }
        else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("${data["message"]}"),
                actions: <Widget>[
                  RaisedButton(
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
                                  "lib/UI/assets/Images/img_1.png",
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
                          const EdgeInsets.only(top: 40, left: 0, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Full name',
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(200, 51, 51, 51),
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                                onChanged: (input) {
                                  // handle email input changes
                                },
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  if (input.split(' ').length!=2) {
                                    return 'Please enter a valid full name';
                                  }
                                  return null;
                                },
                                onSaved: (input) {
                                  _nom = input.toString().split(' ')[0];
                                  _prenom=input.toString().split(' ')[1];
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Phone number',
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(200, 51, 51, 51),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                onChanged: (input) {
                                  // handle email input changes
                                },
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please enter your Phone number';
                                  }
                                  if (input.length!=10) {
                                    return 'Please enter a valid Phone number';
                                  }
                                  return null;
                                },
                                onSaved: (input) {
                                  _telephone = input!;

                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
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
                                      child: _isloading?CircularProgressIndicator(color: Colors.white,strokeWidth: 3,): Text(
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
