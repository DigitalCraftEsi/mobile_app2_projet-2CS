
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/CreditCardsBloc.dart';
import 'package:mob2/Data/Models/CreditCard.dart';
import 'package:mob2/UI/Widjets/CreditCard.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';
class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}
class _MyCardsScreenState extends State<MyCardsScreen> {
  PageController controller=PageController(initialPage: 0,

  );
  List<creditCard> _listOfCards=[];
  List<dynamic> ListOfMap=[];
  bool isloading2=true;
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<CreditCardsBloc>(context,listen: false).GetCreditCards().then((value){
        setState(() {
          isloading2=false;
        }
        );
        Map<String,dynamic>  Cards=Provider.of<CreditCardsBloc>(context,listen: false).Cards;
        if(Cards["statusCode"]!=200 ){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("${Cards["message"]}"),
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
        else{

          ListOfMap=Cards["data"];
        }


    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  int currentCard=0;
  final _formKey = GlobalKey<FormState>();
  late String _cardHolderName;
  late String _cardNumber;
  late String _expMonth;
  late String _expYear;
  bool _isloading=false;
  Future<void> _submit() async {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isloading=true;
      });
      await Provider.of<CreditCardsBloc>(context,listen: false).AddCreditCard(cardNumber: _cardNumber, holderName: _cardHolderName, expiryMonth: _expMonth, expiryYear: _expYear);
      setState(() {
        _isloading=false;
      });
      Map<String,dynamic> data=Provider.of<CreditCardsBloc>(context,listen: false).dataAdded;
      if(data["statusCode"]!=200 ){
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
      else{

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyCardsScreen()));

      }
    }
  }

  @override
  Widget build(BuildContext context) {

    _listOfCards= ListOfMap.map((c)=>creditCard.fromJson(c)).toList() ;
    List<Widget> _listOfCardsWidjets=List.generate(_listOfCards.length, (index) => CreditCard(cardNumber: _listOfCards[index].cardNumber, cardHolder: _listOfCards[index].holderName, expirationDate: "${_listOfCards[index].expiryMonth}/${_listOfCards[index].expiryYear}"));

    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CostumNavBar(index: 3,),
        body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        margin: EdgeInsets.only(top: 35,bottom: 10,left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            },
                icon: Icon(Icons.arrow_back_outlined,color: Color.fromRGBO(1, 113, 75, 1),),
            ),
            SizedBox(width: screenWidth/5,),
            Text("My Cards",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
          ],
        ),
    ),
          isloading2?CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),):Column(
            children: [
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
            ],
          ),

          SizedBox(height: 35,),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Add New Card",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Card Holder Name",
                      hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the Card Holder Name';
                      }
                      if (value.split(' ').length!=2) {
                        return 'Please enter the Card Holder Full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _cardHolderName = value!;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the Card number';
                      }
                      if(value.length!=16){
                        return 'Please enter a valide Card number of 16 digits';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _cardNumber = value!;
                    },
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Exp. Month",
                            hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the Exp. Month';
                            }
                            if(value.length!=2 || int.parse(value)>12||int.parse(value)<1){
                              return 'Please enter a valide Exp. Month';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _expMonth = value!;
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth/6,),
                      Container(
                        width: 80,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Exp. Year",
                            hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the Exp. Year';
                            }
                            if(value.length!=4 || int.parse(value)>2035||int.parse(value)<2023){
                              return 'Please enter a valide Exp. Year';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _expYear = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: SizedBox(
                      width: 230,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color: Color.fromRGBO(1, 113, 75, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: _isloading?CircularProgressIndicator(color: Colors.white,strokeWidth: 3,):Text('Submit',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                        onPressed: _submit,
                      ),
                    ),
                  ),

                ],
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
