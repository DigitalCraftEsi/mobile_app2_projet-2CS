import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mob2/Bloc/CreditCardsBloc.dart';
import 'package:mob2/Bloc/DistributeurInfoBloc.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/Bloc/UserInfosBloc.dart';
import 'package:mob2/UI/Screens/HistoryScreen.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';
import 'package:mob2/UI/Screens/LoginScreen.dart';
import 'package:mob2/UI/Screens/MyCardsScreen.dart';
import 'package:mob2/UI/Screens/MyNotificationScreen.dart';
import 'package:mob2/UI/Screens/PaymentDetailsScreen.dart';
import 'package:mob2/UI/Screens/SelectPaymentMethodScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Bloc/AuthBloc.dart';
import 'UI/Screens/ReportProblemScreen.dart';
import 'UI/Screens/SignUpScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  final cookie = await storage.read(key: 'cookie');
  runApp(MultiProvider(child:MyApp(Cookie: cookie,),
    providers: [
      ChangeNotifierProvider<UserInfosBloc>.value(value: UserInfosBloc()),
      ChangeNotifierProvider<CreditCardsBloc>.value(value: CreditCardsBloc()),
      ChangeNotifierProvider<DistributeurinfoBloc>.value(value: DistributeurinfoBloc()),
      ChangeNotifierProvider<OrderedDrinksBloc>.value(value: OrderedDrinksBloc()),
      ChangeNotifierProvider<AuthBloc>.value(value: AuthBloc()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final  Cookie;

  const MyApp({Key? key, required this.Cookie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final expires =Cookie!=null?RegExp('Expires=([^;]*)').firstMatch(Cookie)?.group(1):null;

    // Parse the expiration date into a DateTime object
    //final expirationDate = expires != null ? HttpDate.parse(expires) : null;
    //print(expires);
    //print(expirationDate);
    //print(DateTime.now().isAfter(expirationDate!));
    //print(expirationDate != null);
    return MaterialApp(
      title: 'mob2',
      theme: ThemeData(

        fontFamily: "Poppins",
      ),
      home://(expirationDate != null && DateTime.now().isAfter(expirationDate))?Login():HomeScreen(),
      //(Cookie==null ||((jsonDecode(Cookie).expires)== null || DateTime.now().isAfter(jsonDecode(Cookie).expires)))?Login():HomeScreen(),
      Cookie==null?Login():HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}





