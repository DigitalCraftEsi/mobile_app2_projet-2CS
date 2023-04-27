import 'package:flutter/material.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';

class AllDone extends StatefulWidget {
  const AllDone({Key? key}) : super(key: key);

  @override
  State<AllDone> createState() => _AllDone();
}

class _AllDone extends State<AllDone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom:80),
                child: Image.asset(
                  "lib/UI/assets/Images/img.png",
                  height: 70,
                  width: 100,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                alignment: Alignment.center,
                child: const Text(
                  "All Done",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color:Color.fromARGB(255, 33, 130, 97),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: const Text(
                  "Thanks for giving us your precious time. Now you are ready for an enjoyable moment.",
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
                margin: const EdgeInsets.only(top: 60),
                child:  SizedBox(
                  height: 50,
                  width: 300,
                  child: RaisedButton(
                    color: const Color.fromARGB(255, 33, 130, 97),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Text(
                      "Let's go",
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
            ],
          ),
        ),
      ),
    );
  }
}
