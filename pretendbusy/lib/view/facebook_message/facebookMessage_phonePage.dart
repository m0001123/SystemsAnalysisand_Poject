import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class facebookMessagephonePage extends StatefulWidget {
  const facebookMessagephonePage({Key? key}) : super(key: key);

  @override
  _facebookMessagephonePageState createState() =>
      _facebookMessagephonePageState();
}

class _facebookMessagephonePageState extends State<facebookMessagephonePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/demo.jpg'), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: ExactAssetImage('assets/demo.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "黃彥龍",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "00:34",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                color: Color.fromARGB(255, 40, 40, 40),
              ),
              height: 125,
              child: Row(
                children: [
                  RoundButton(
                      backgroundColor: Color.fromARGB(255, 100, 100, 100),
                      icon: Icon(Icons.person_add)),
                  Spacer(),
                  RoundButton(backgroundColor: Color.fromARGB(255, 100, 100, 100),
                      icon: FaIcon(FontAwesomeIcons.volumeUp)),
                  Spacer(),
                  RoundButton(backgroundColor: Color.fromARGB(255, 100, 100, 100),
                      icon: Icon(Icons.keyboard_voice)),
                  Spacer(),
                  RoundButton(backgroundColor: Colors.red, icon: Icon(Icons.call_end))
                ],
              ),
            )
            ),
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);
  final Color backgroundColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {Navigator.pop(context, MaterialPageRoute(builder: (context) => facebookMessagephonePage()));},
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            minimumSize: Size(60, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150))),
        child: icon);
  }
}
