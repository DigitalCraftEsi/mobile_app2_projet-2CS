

import 'package:flutter/material.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/UI/Screens/ProblemReportedScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';
class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  _ReportProblemScreenState createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading=false;
  late String _subject;
  late String _description;
  Future<void> _submit() async {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isloading=true;
      });
      int idCommande=Provider.of<OrderedDrinksBloc>(context,listen: false).paymentData["data"]["idCommande"];
      print(_subject);
      print(_description);
      print(idCommande);
      await Provider.of<OrderedDrinksBloc>(context,listen: false).addReclamation(title: _subject, descr: _description, idCommande: idCommande);
      setState(() {
        _isloading=false;
      });
      Map<String,dynamic> data=Provider.of<OrderedDrinksBloc>(context,listen: false).reclamationData;
      if(data["statusCode"]!=200 ){
        print(data);
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
      else{

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ProplemReportedScreen()));

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CostumNavBar(index: 2,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 40,bottom: 10),
            child: Column(
              children: [
                Image.asset("lib/UI/assets/Images/Logo.png"),
                SizedBox(height: 5,),
                Text("Report Problem",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Reason of report...",
                      hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Report reason';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _subject = value!;
                    },
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    maxLines: 8,
                    decoration: InputDecoration(
                     hintText: "Discribe your problem in detail...",
                      hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Problem Description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  SizedBox(height: 35,),
                  Center(
                    child: SizedBox(
                      width: 230,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10), backgroundColor: Color.fromRGBO(1, 113, 75, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),

                        child: _isloading?CircularProgressIndicator(color: Colors.white,strokeWidth: 3,):Text('Submit',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                        onPressed:_submit,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),],
          ),
        ),
      ),
    );
  }
}
