import 'dart:developer';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/AuthBloc.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/UI/Screens/AcceptPaymentScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {

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
            SizedBox(height: 30,),
            Image.asset(
              "lib/UI/assets/Images/QRcode.png",
              height: 275,
              width: 300,
            ),
            SizedBox(height: 100,),
            Center(
              child: SizedBox(
                width: 230,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Color.fromRGBO(1, 113, 75, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text('Scan QR Code',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QRViewScreen()),
                    );
                  },
                ),
              ),
            ),






          ],
        ),
      ),


    );
  }
}

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}
class _QRViewScreenState extends State<QRViewScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if(result!=null){
       Provider.of<OrderedDrinksBloc>(context,listen: false).DecodeData(result!.code);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AcceptPaymentScreen()),
        );
      }
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
