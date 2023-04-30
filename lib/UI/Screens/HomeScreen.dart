
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/CreditCardsBloc.dart';
import 'package:mob2/Bloc/UserInfosBloc.dart';
import 'package:mob2/Data/Models/CreditCard.dart';
import 'package:mob2/UI/Screens/MyNotificationScreen.dart';
import 'package:mob2/UI/Widjets/CreditCard.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:mob2/UI/Widjets/PaymentRow.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController controller=PageController(initialPage: 0,

  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  int currentCard=0;
  List<creditCard> _listOfCards=[];
  List<dynamic> ListOfMap=[];
  Map<String,dynamic>  userInfos={};
  bool isloading2=true;
  bool isloading3=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserInfosBloc>(context,listen: false).getUserInfos().then((value){
      if(mounted){
        setState(() {
          isloading3=false;
        }
        );}
        userInfos=Provider.of<UserInfosBloc>(context,listen: false).data;
      if(userInfos["statusCode"]!=200 ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("${userInfos["message"]}"),
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
    }) ;
    Provider.of<CreditCardsBloc>(context,listen: false).GetCreditCards().then((value){
      if(mounted){
      setState(() {
        isloading2=false;
      }
      );}
      Map<String,dynamic>  Cards=Provider.of<CreditCardsBloc>(context,listen: false).Cards;
      if(Cards["statusCode"]!=200 ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("${Cards["message"]}"),
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
      else{

        ListOfMap=Cards["data"];
      }


    });

  }
  @override
  Widget build(BuildContext context) {

    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    _listOfCards= ListOfMap.map((c)=>creditCard.fromJson(c)).toList() ;
    List<Widget> _listOfCardsWidjets=List.generate(_listOfCards.length, (index) => CreditCard(cardNumber: _listOfCards[index].cardNumber, cardHolder: _listOfCards[index].holderName, expirationDate: "${_listOfCards[index].expiryMonth}/${_listOfCards[index].expiryYear}"));



    return Scaffold(

      bottomNavigationBar: CostumNavBar(index: 0,),
      body: (isloading2||isloading3)?Center(child: CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),)):SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 60,bottom: 10),
      child: Column(
        children: [
          Image.asset("lib/UI/assets/Images/Logo.png"),
          SizedBox(height: 5,),
        ],
      ),
    ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(

                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.8,
                            color: Color.fromRGBO(1, 113, 75, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(200))
                      ),
            width: 45,
            height: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200),



                      ),
                       child:
                       // userInfos["data"]?["picture"]==null?Image.asset("lib/UI/assets/Images/user.png",fit: BoxFit.fill,):Image.network("${userInfos["data"]["picture"]}",fit: BoxFit.fill,),
                       Image.asset("lib/UI/assets/Images/user.png",fit: BoxFit.fill,),
                      ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi ${userInfos["data"]["prenomConsommateur"] } ${userInfos["data"]["nomConsommateur"]}",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 98, 59, 1),fontSize: 14),),
                      Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),)
                    ],
                  ),
                ],
              ),
    Stack(
    children: [
    Container(

    color: Colors.blue,
    ),
    Positioned(
      top: 5,
      left: 5,
    child: Container(
    width: 13,
    height: 13,
    child: Center(child: Text("2",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 9),)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200)),
      color: Colors.red,
    ),
    ),

    ),
      IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyNotificationScreen()),
        );
      },
        icon: Icon(Icons.notifications,color: Color.fromRGBO(1, 113, 75, 1),),
      ),
    ],
    ),


            ],

          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 170,

          child: PageView(

            children:
            _listOfCardsWidjets,
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (int num){
              setState(() {
                currentCard=num;

              }

              );
            },
          ),
        ),
        SizedBox(height: 13,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_listOfCardsWidjets.length, (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: index==currentCard?10:8,
              height: index==currentCard?10:8,
              decoration: BoxDecoration(
                  color: index==currentCard?Color.fromRGBO(1, 113, 75, 1):Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(200))
              ),
            )),



          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
          child: Text("Recent Activity",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
        ),
        Column(
          children: [
            PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment", date: "12.03.2023", amount: "60",istTime: false,),

          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
          child: Text("Recent Reports",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
        ),
        Column(
          children: [
            PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment Failure", date: "12.03.2023", amount: "10:45",istTime: true,),

          ],
        ),


      ],
    ),
    ),
    );
  }
}
