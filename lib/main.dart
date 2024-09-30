import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';
import 'package:flutter_project/constants/constants.dart';
import 'package:flutter_project/provider/email_provider.dart';
import 'package:flutter_project/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    //using provider for statemanagement
    MultiProvider(providers: [
        ChangeNotifierProvider<EmailProvider>(
              create: (context) => EmailProvider()),
    ],    
    child: 
    
    MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: 
      ThemeData(        
        fontFamily: "Aeonik",
        primaryColor: blueColor,
        useMaterial3: true,
      ),
      home:  BottomNav(),
    ));
  }
}

