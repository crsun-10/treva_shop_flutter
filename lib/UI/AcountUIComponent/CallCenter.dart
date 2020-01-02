import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/Chat.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/ChatItem.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/Message.dart';

class callCenter extends StatefulWidget {
 @override
 _callCenterState createState() => _callCenterState();
}

class _callCenterState extends State<callCenter> {
 @override
 static var _txtCustomHead = TextStyle(
  color: Colors.black54,
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  fontFamily: "Gotik",
 );

 static var _txtCustomSub = TextStyle(
  color: Colors.black26,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  fontFamily: "Gotik",
 );

 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text(
     "Call Center",
     style: TextStyle(
         fontWeight: FontWeight.w700,
         fontSize: 16.0,
         color: Colors.black54,
         fontFamily: "Gotik"),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF6991C7)),
    elevation: 0.0,
   ),
   body: Container(
       color: Colors.white,
       child: Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image.asset(
              "assets/icon/girlcallcenter.png",
              height: 175.0,
             ),
             Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text(
               "We're Happy to Help You!",
               style: _txtCustomHead,
              ),
             ),
             Padding(
              padding:
              const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
              child: Text(
               "If you have complain about \nthe product chat me ",
               style: _txtCustomSub,
               textAlign: TextAlign.center,
              ),
             ),
             Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: InkWell(
               onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new chatItem()));
               },
               child: Center(
                child: Container(
                 height: 50.0,
                 width: 280.0,
                 decoration: BoxDecoration(
                     color: Color(0xFF6991C7),
                     borderRadius:
                     BorderRadius.all(Radius.circular(25.0))),
                 child: Center(
                     child: Text(
                      "Chat Me",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                     )),
                ),
               ),
              ),
             )
            ],
           ))),
  );
 }
}
