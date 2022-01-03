import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pretendbusy/view/facebook_message/facebookMessage_phonePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homePage.dart';

class facebookMessagehomePage extends StatefulWidget {
  const facebookMessagehomePage({Key? key}) : super(key: key);
  @override
  _facebookMessagehomePageState createState() => _facebookMessagehomePageState();
}

class _facebookMessagehomePageState extends State<facebookMessagehomePage> {
  TextEditingController _sendMessageController = TextEditingController();
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:  ExactAssetImage('assets/demo.jpg'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "黃彥龍",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "目前在線上",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              )
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            ),
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("page", 0);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage()));
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => facebookMessagephonePage()));
              },
              icon: Icon(
                FontAwesomeIcons.phoneAlt,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.video,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        bottomSheet: getBottom(),
        body: getBody());
  }

  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height - 160,
      color: Colors.black,
      child: AnimatedList(
        key: _listkey,
        initialItemCount: data.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return addItem(data[index], index, animation);
        },
      ),
    );
  }

  Widget addItem(String item, int index, Animation<double> animation) {
    bool mine = item.endsWith("<bot>");
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Container(
            alignment: mine ? Alignment.topLeft : Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 2 - 20,
                minWidth: 30,
              ),
              padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
    );
  }

  Widget getBottom() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    size: 25,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 25,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.photo,
                    size: 25,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.keyboard_voice,
                    size: 25,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 40) / 2 - 50,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        cursorColor: Colors.black38,
                        controller: _sendMessageController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: Icon(
                              Icons.face,
                              color: Colors.grey,
                              size: 35,
                            )),
                        onSubmitted: (msg) {
                          if(_sendMessageController.text.length>1){
                            insertItem(msg);
                            _sendMessageController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.thumb_up,
                    size: 25,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void insertItem(String msg) {
    data.add(msg);
    _listkey.currentState!.insertItem(data.length - 1);
  }
}
