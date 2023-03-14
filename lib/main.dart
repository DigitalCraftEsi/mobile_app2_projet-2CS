import 'package:flutter/material.dart';
import 'package:mob2/UI/Screens/HistoryScreen.dart';
import 'package:mob2/UI/Screens/MyNotificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mob2',
      theme: ThemeData(

        fontFamily: "Poppins",
      ),
      home: Myhomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  int currentIndex=0;

  final List<Widget> screens=[MyNotificationScreen(),HistoryScreen(),Text("2"),Text("2")];

  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,

          decoration: BoxDecoration(

            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(

              items: [
                BottomNavigationBarItem(
                  icon: Icon(currentIndex==0?Icons.home:Icons.home_outlined,size: 30),
                  backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex==1?Icons.archive:Icons.archive_outlined,size: 30),
                  backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex==2?Icons.shopping_cart:Icons.shopping_cart_outlined,size: 30,),
                  backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex==3?Icons.person:Icons.perm_identity_outlined,size: 30,),
                  backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                  label: "",
                ),

              ],
              onTap: updateIndex,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              backgroundColor: Color.fromRGBO(1, 113, 75, 1),
              currentIndex: currentIndex,
            ),
          )
      ),
    );
  }
}


