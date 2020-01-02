import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';

class privatemessage extends StatefulWidget {

  /// Declare Brand class and Get Data Name for Appbar (BrandDataList.dart)
  final Brand brand;
  privatemessage(this.brand);

  @override
  _privatemessageState createState() => _privatemessageState(brand);
}

/// Declare default User Name
const String defaultUserName = "Alisa Heart";

class _privatemessageState extends State<privatemessage>
    with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  /// Declare Brand class
  final Brand brand;
  _privatemessageState(this.brand);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          brand.name,
          style: TextStyle(
              fontFamily: "Gotik", fontSize: 18.0, color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
          child: _messages.length>0
              ?  Container(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(10.0),
            ),
          ): NoMessage(),
        ),
        new Divider(height: 1.5),
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(
              color: Theme.of(ctx).cardColor,
              boxShadow: [BoxShadow(blurRadius: 1.0, color: Colors.black12)]),
        ),
      ]),
    );
  }

  /// Component for typing text
  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String txt) {
                      setState(() {
                        _isWriting = txt.length > 0;
                      });
                    },
                    onSubmitted: _submitMsg,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Enter some text to send a message",
                        hintStyle: TextStyle(
                            fontFamily: "Sans",
                            fontSize: 16.0,
                            color: Colors.black26)),
                  ),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(Icons.message),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController});

  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.fastOutSlowIn),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: new Text(defaultUserName[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(defaultUserName,
                      style: TextStyle(
                          fontFamily: "Gotik", fontWeight: FontWeight.w900)),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: new Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class NoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                  opacity: 0.5,
                  child: Image.asset("assets/imgIllustration/IlustrasiMessage.png",height: 220.0,)),
              Text("Not Have Message", style: TextStyle( fontWeight: FontWeight.w300,color: Colors.black12,fontSize: 17.0,fontFamily: "Popins"),)
            ],
          ),
        ));
  }
}
