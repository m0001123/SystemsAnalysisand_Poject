import 'package:flutter/material.dart';
import 'package:pretendbusy/view/facebook_message/facebookMessage_homePage.dart';
import 'package:pretendbusy/view/homePage.dart';
import 'package:pretendbusy/view/line/line_homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int currentPage;
  currentPage = await prefs.getInt("page") ?? 0;

  runApp( MyApp(currentPage));
}

class MyApp extends StatelessWidget {
  MyApp(this.currentPage);
   int currentPage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:(
          (){
            if(currentPage==1){
              return facebookMessagehomePage();
            }else if(currentPage == 2){
              return linehomePage();
            }
            return homePage();
          }()
      )
    );
  }

}

