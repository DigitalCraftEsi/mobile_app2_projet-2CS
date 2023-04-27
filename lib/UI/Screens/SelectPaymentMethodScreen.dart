
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/CreditCardsBloc.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/Data/Models/CreditCard.dart';
import 'package:mob2/UI/Screens/WaitingScreen.dart';
import 'package:mob2/UI/Widjets/CreditCard.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';
class SelectPaymentMethodSceen extends StatefulWidget {
  const SelectPaymentMethodSceen({Key? key}) : super(key: key);

  @override
  _SelectPaymentMethodSceenState createState() => _SelectPaymentMethodSceenState();
}

class _SelectPaymentMethodSceenState extends State<SelectPaymentMethodSceen> {
  PageController controller=PageController(initialPage: 0,

  );
  final _formKey = GlobalKey<FormState>();
  late String _cardcvc;
  Future<void> _submit() async {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<OrderedDrinksBloc>(context,listen: false).PutCvcToPaymentData(_cardcvc);
      print( Provider.of<OrderedDrinksBloc>(context,listen: false).orderedDrinks);
      print("hhh");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WaitingScreen()),
      );
    }
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  int currentCard=0;
  List<creditCard> _listOfCards=[];
  List<dynamic> ListOfMap=[];
@override
  void initState() {
    // TODO: implement initState
  Map<String,dynamic>  Cards=Provider.of<CreditCardsBloc>(context,listen: false).Cards;
  ListOfMap=Cards["data"];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    _listOfCards= ListOfMap.map((c)=>creditCard.fromJson(c)).toList() ;
    List<Widget> _listOfCardsWidjets=List.generate(_listOfCards.length, (index) => CreditCard(cardNumber: _listOfCards[index].cardNumber, cardHolder: _listOfCards[index].holderName, expirationDate: "${_listOfCards[index].expiryMonth}/${_listOfCards[index].expiryYear}"));
    return Scaffold(
      bottomNavigationBar: CostumNavBar(index: 2,),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 35,bottom: 10),
        child: Column(
          children: [
            Image.asset("lib/UI/assets/Images/Logo.png"),
            SizedBox(height: 5,),
            Text("Payment",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
          ],
        ),
      ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
      width: screenWidth/1.25,
      child: Card(
      color: Color.fromRGBO(240, 240, 240, 1),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      ),
      elevation: 4,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("lib/UI/assets/Images/Logo.png",width: 35,height: 35,),
                    SizedBox(width: 10,),
                    Text("SmartBev",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),),
                  ],
                ),
                Row(
                  children: [
                    Text("Total",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(51, 51, 51, 1),fontSize: 11),),
                     SizedBox(width: 5,),
                    Text("120 DA",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),),

                  ],
                ),
              ],

            ),
          ),
      ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text("Select Payment Method",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18),),
          ),
          SizedBox(height: 15,),
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
          SizedBox(height: 40,),
          Center(
            child: SizedBox(
              width: 230,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Color.fromRGBO(1, 113, 75, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text('Submit',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                onPressed: () {
                  Provider.of<OrderedDrinksBloc>(context,listen: false).PutCardToPaymentData(_listOfCards[currentCard]);
                 print( Provider.of<OrderedDrinksBloc>(context,listen: false).orderedDrinks);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Enter the card cvc"),
                        content: Container(
                          height: 90,
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Card cvc",
                                    hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the Card cvc';
                                    }
                                    if (value.length!=3) {
                                      return 'cvc must contains 3 numbers';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _cardcvc = value!;
                                  },
                                ),
                                SizedBox(height: 10,),


                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100,
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  child: Text('Cancel',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.black54,fontSize: 16),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                               SizedBox(width: 10,),
                               SizedBox(
                                  width: 100,
                                  child: RaisedButton(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    color: Color.fromRGBO(1, 113, 75, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    child: Text('Submit',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                                    onPressed: _submit,
                                  ),
                                ),
                            ],
                          ),

                        ],
                      );
                    },
                  );
                  /*Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WaitingScreen()),
                  );*/
                },
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
