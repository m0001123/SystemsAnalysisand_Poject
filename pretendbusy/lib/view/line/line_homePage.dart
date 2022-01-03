import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homePage.dart';
import 'line_phonePage.dart';
class linehomePage extends StatefulWidget {
  const linehomePage({Key? key}) : super(key: key);

  @override
  _linehomePageState createState() => _linehomePageState();
}

class _linehomePageState extends State<linehomePage> {
  TextEditingController _sendMessageController = TextEditingController();
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        title: Text("黃彥龍",style: TextStyle(color:Colors.white,fontSize: 16 ),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
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
            },
            icon:Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => linephonePage()));
            },
            icon: LineIcon(
              LineIcons.phone,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }
  Widget getBody(){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 130,
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
                color: Color.fromARGB(255, 122, 255, 122),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            )),
      ),
    );
  }

  Widget getBottom() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2-25,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LineIcon(
                    LineIcons.camera,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LineIcon(
                    LineIcons.photoVideo,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2+25,
              child: Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 40) / 2 -25,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 50, 50, 50),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        controller: _sendMessageController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            hintText: "Aa",
                            suffixIcon: Icon(
                              FontAwesomeIcons.smile,
                              color: Colors.grey,
                              size: 25,
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
                    Icons.keyboard_voice_outlined,
                    color: Colors.white,
                    size: 25,
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
