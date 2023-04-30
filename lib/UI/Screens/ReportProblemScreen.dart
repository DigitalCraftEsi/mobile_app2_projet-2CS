

import 'package:flutter/material.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  _ReportProblemScreenState createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _subject;
  late String _description;
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

                        child: Text('Submit',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                   ReportProblemScreen()),
                            );
                          }
                        },
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
