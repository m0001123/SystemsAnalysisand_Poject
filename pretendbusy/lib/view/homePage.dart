import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'facebook_message/facebookMessage_homePage.dart';
import 'line/line_homePage.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "裝忙小助手",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 100, 100, 100),
      ),
      backgroundColor: Color.fromARGB(255, 100, 100, 100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("請選擇欲模擬樣貌", style: TextStyle(color: Colors.white))),
          SizedBox(height: 15,),
          IconButton(
            color: Colors.white,
            icon: Image.asset('assets/message2.png'),
            iconSize: 50,
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt("page", 1);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => facebookMessagehomePage()));
            },
          ),
          SizedBox(height: 15,),
          IconButton(
            color: Colors.white,
            icon: Image.asset('assets/line.png'),
            iconSize: 42,
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt("page", 2);
               print(prefs.get("page"));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => linehomePage()));
            },
          )
        ],
      ),
    );
  }
}
