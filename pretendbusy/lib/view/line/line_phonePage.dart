import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'line_homePage.dart';
class linephonePage extends StatelessWidget {
  const linephonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/demo.jpg'), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: ExactAssetImage('assets/demo.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "黃彥龍",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "00:34",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Icon(
                  Icons.graphic_eq_outlined,
                  color: Color.fromARGB(255, 122, 255, 122),
                  size: 35,
                ),
              ),

            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height/3,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(backgroundColor: Colors.transparent, icon: Icon(Icons.mic,color: Colors.white,size: 35,),text: Text("關麥克風",style: TextStyle(fontSize: 10,decoration: TextDecoration.none,color: Colors.white70)),),
                      Spacer(),
                      RoundButton(backgroundColor: Colors.transparent, icon: Icon(FontAwesomeIcons.video,color: Colors.white,size: 30,),text: Text("開始視訊",style: TextStyle(fontSize:10,decoration: TextDecoration.none,color: Colors.white70)),),
                      Spacer(),
                      RoundButton(backgroundColor: Colors.transparent, icon: Icon(FontAwesomeIcons.volumeUp,color: Colors.white,size: 30,),text: Text("關聲音",style: TextStyle(fontSize: 10,decoration: TextDecoration.none,color: Colors.white70)),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, MaterialPageRoute(builder: (context) => linephonePage()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(60, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(150))),
                        child: Icon(Icons.close,color: Colors.white,)),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.backgroundColor,
    required this.icon, required this.text,
  }) : super(key: key);
  final Color backgroundColor;
  final Widget icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            primary:backgroundColor,
            minimumSize: Size(60, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: text,
            ),
          ],
        ));
  }
}
