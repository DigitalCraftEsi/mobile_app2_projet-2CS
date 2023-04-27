import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/DistributeurInfoBloc.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/UI/Screens/ScanQrCodeScreen.dart';
import 'package:mob2/UI/Screens/SelectPaymentMethodScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';

class AcceptPaymentScreen extends StatefulWidget {
  const AcceptPaymentScreen({Key? key}) : super(key: key);

  @override
  _AcceptPaymentScreenState createState() => _AcceptPaymentScreenState();
}


class _AcceptPaymentScreenState extends State<AcceptPaymentScreen> {
  bool isloading=true;
  Map<String,dynamic>  data={};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int _idDistributeur=Provider.of<OrderedDrinksBloc>(context,listen: false).orderedDrinks["idDistributeur"];
    Provider.of<DistributeurinfoBloc>(context,listen: false).GetDistributeurInfos(_idDistributeur).then((value){
      if(mounted){
        setState(() {
          isloading=false;
        });
          data=Provider.of<DistributeurinfoBloc>(context,listen: false).data;
      }
    });



  }
  @override
  Widget build(BuildContext context) {





    return Scaffold(


      bottomNavigationBar: CostumNavBar(index: 2,),
      body: SingleChildScrollView(
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
                  Text("Payment",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 22),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            isloading?CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),): Container(
              width: 250,
              child: Card(
                color: Color.fromRGBO(240, 240, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset("lib/UI/assets/Images/Logo.png",width: 44,),
                          SizedBox(height: 5,),
                          Text("SmartBev",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18),),
                          Text("${data["data"]["adresse"]}",style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.72),fontSize: 16),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text("Total",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(17, 17, 17, 0.72)),),
                      SizedBox(height: 10,),
                      Text("120 DA",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 27),),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                        width: 230,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Color.fromRGBO(1, 113, 75, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text('Accept',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                          onPressed: () {

                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => SelectPaymentMethodSceen()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                        width: 230,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color:Color.fromRGBO(1, 113, 75, 1)),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text('Decline',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Color.fromRGBO(1, 113, 75, 1),fontSize: 16),),
                          onPressed: () {

                            /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => ScanQrCodeScreen()));*/
                            print(Provider.of<OrderedDrinksBloc>(context,listen: false).orderedDrinks["idDistributeur"]);
                           print("hhh");
                            print(data);
                          },
                        ),
                      ),
                    ),


                  ],
                ))
          ],
        ),
      ),


    );
  }
}

