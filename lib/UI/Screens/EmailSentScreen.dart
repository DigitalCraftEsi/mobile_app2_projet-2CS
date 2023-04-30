import 'package:flutter/material.dart';

import 'LoginScreen.dart';


class EmailSent extends StatefulWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  State<EmailSent> createState() => _EmailSent();
}

class _EmailSent extends State<EmailSent> {
  final _formKey = GlobalKey<FormState>();
  late String _email = "emb***@gmail.com";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/UI/assets/Images/img.png",
                      height: 70,
                      width: 100,
                    ),
                    const SizedBox(height: 70.0),
                    const Text(
                      "Email Sent!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 33, 130, 97),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "We’ve sent a password reset link to",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Didn't Receive?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(200, 51, 51, 51),
                                  ),
                                ),
                                const TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 33, 130, 97),
                                    ),
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 20.0),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ), backgroundColor: Color.fromARGB(255, 33, 130, 97),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Login()),
                                  );
                                },
                                child: const Text(
                                  "Back to Login",
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
                          const SizedBox(height: 20.0),
                          const Center(
                            child: const TextButton(
                              onPressed: null,
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 33, 130, 97),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
