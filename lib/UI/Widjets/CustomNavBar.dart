import 'package:flutter/material.dart';
import 'package:mob2/UI/Screens/HistoryScreen.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';
import 'package:mob2/UI/Screens/MyInfoScreen.dart';
import 'package:mob2/UI/Screens/ProfileScreen.dart';
import 'package:mob2/UI/Screens/ScanQrCodeScreen.dart';

class CostumNavBar extends StatelessWidget {
  CostumNavBar({Key? key, required this.index}) : super(key: key);
  final int index;
  List<Widget> _listOfScreens=[HomeScreen(),HistoryScreen(),ScanQrCodeScreen(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return   Container(
        width: MediaQuery.of(context).size.width,
        height: 63,

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
                icon: Icon(index==0?Icons.home:Icons.home_outlined,size: 27),
                backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(index==1?Icons.archive:Icons.archive_outlined,size: 27),
                backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(index==2?Icons.shopping_cart:Icons.shopping_cart_outlined,size: 27,),
                backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(index==3?Icons.person:Icons.perm_identity_outlined,size: 27,),
                backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                label: "",
              ),

            ],
            onTap: (value){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => _listOfScreens[value]),
              );
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Color.fromRGBO(1, 113, 75, 1),
            currentIndex: index,
          ),
        )
    );
  }
}