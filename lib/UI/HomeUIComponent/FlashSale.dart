import 'dart:async';

import 'package:shimmer/shimmer.dart';
import 'package:treva_shop_flutter/Library/countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/FlashSaleItem.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/FlashSaleDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';

class flashSale extends StatefulWidget {
  @override
  _flashSaleState createState() => _flashSaleState();

}

class _flashSaleState extends State<flashSale> {

  ///
  /// Get image data dummy from firebase server
  ///
  var imageNetwork = NetworkImage("https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/Screenshot_20181005-213938.png?alt=media&token=8c1abb09-4acf-45cf-9383-2f94d93f4ec9");

  ///
  /// check the condition is right or wrong for image loaded or no
  ///
  bool loadImage = true;

  @override
  var hourssub, minutesub, secondsub;
  /// CountDown for timer
  CountDown hours, minutes, seconds;
  int hourstime, minute, second = 0;
  SaleItem itemSale;
  ///
  /// SetState after imageNetwork loaded to change list card
  /// And
  /// Set for StartStopPress CountDown
  onStartStopPress() {
    if (this.secondsub == null) {
      secondsub = seconds.stream.listen(null);
      secondsub.onData((Duration d) {
        print(d);
        setState(() {
          second = d.inSeconds;
        });
      });
    }
    if (this.minutesub == null) {
      minutesub = minutes.stream.listen(null);
      minutesub.onData((Duration d) {
        print(d);
        setState(() {
          minute = d.inMinutes;
        });
      });
    }
    if (this.hourssub == null) {
      hourssub = hours.stream.listen(null);
      hourssub.onData((Duration d) {
        print(d);
        setState(() {
          hourstime = d.inHours;
        });
      });
    }
  }

  /// To set duration initState auto start if FlashSale Layout open
  @override
  void initState() {

  Timer(Duration(seconds: 3),(){
setState(() {
  loadImage=false;
});
    });

    hours = new CountDown(new Duration(hours: 24));
    minutes = new CountDown(new Duration(hours: 1));
    seconds = new CountDown(new Duration(minutes: 1));

    onStartStopPress();
    // TODO: implement initState
    super.initState();
  }

  /// Component widget in flashSale layout
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flash Sale",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              /// Header banner
              Image.asset(
                "assets/img/flashsalebanner.png",
                height: 195.0,
                width: 1000.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "End in",
                      style: TextStyle(
                        fontFamily: "Sans",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    /// Get a countDown variable
                    Text(
                      hourstime.toString() +
                          " : " +
                          minute.toString() +
                          " : " +
                          second.toString(),
                      style: TextStyle(
                        fontFamily: "Gotik",
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ///
              ///
              /// check the condition if image data from server firebase loaded or no
              /// if image true (image still downloading from server)
              /// Card to set card loading animation
              ///
              ///
              /// Create a GridView
            loadImage?_loadingImageAnimation(context):_imageLoaded(context)
            ],
          ),
        ),
      ),
    );
  }
}

/// Component Card item in gridView after done loading image
class itemGrid extends StatelessWidget {
  /// Declare FlashSaleItem.dart get a data from FlashSaleItem.dart
  SaleItem itemSale;
  itemGrid(this.itemSale);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                /// Animation Transition with opacity value in route navigate another layout
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new flashSaleDetail(itemSale),
                    transitionDuration: Duration(milliseconds: 950),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    }));
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.2,
                      blurRadius: 0.5)
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Animation image header to flashSaleDetail.dart
                    Hero(
                      tag: "hero-flashsale-${itemSale.id}",
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) {
                                  return new Material(
                                    color: Colors.black54,
                                    child: Container(
                                      padding: EdgeInsets.all(30.0),
                                      child: InkWell(
                                        child: Hero(
                                            tag: "hero-flashsale-${itemSale.id}",
                                            child: Image.asset(
                                              itemSale.image,
                                              width: 300.0,
                                              height: 300.0,
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                            )),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                transitionDuration:
                                    Duration(milliseconds: 500)));
                          },
                          child: SizedBox(
                            child: Image.asset(
                              itemSale.image,
                              fit: BoxFit.cover,
                              height: 140.0,
                              width: mediaQueryData.size.width / 2.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 3.0, top: 15.0),
                      child: Container(
                        width: mediaQueryData.size.width / 2.7,
                        child: Text(
                          itemSale.title,
                          style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans"),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(itemSale.normalprice,
                          style: TextStyle(
                              fontSize: 10.5,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(itemSale.discountprice,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF7F7FD5),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_half,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Text(
                            itemSale.ratingvalue,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 11.0,
                            color: Colors.black38,
                          ),
                          Text(
                            itemSale.place,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text(
                        itemSale.stock,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 10.0, bottom: 15.0),
                      child: Container(
                        height: 5.0,
                        width: itemSale.widthLine,
                        decoration: BoxDecoration(
                            color: Color(itemSale.colorLine),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}


/// Component Card item for loading image
class loadingItemGrid extends StatelessWidget {
  @override
  SaleItem itemSale;
  loadingItemGrid(this.itemSale);
  final color = Colors.black38;
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 0.2,
                    blurRadius: 0.5)
              ]),
              child: Shimmer.fromColors(
                baseColor: color,
                highlightColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      width: mediaQueryData.size.width / 2.1,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Container(
                        height: 15.0,
                        width: mediaQueryData.size.width / 2.6,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 8.0),
                      child: Container(
                        height: 10.0,
                        width: mediaQueryData.size.width / 4.1,
                        color: Colors.black12,
                      ),
                    ),   Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Container(
                        height: 8.0,
                        width: mediaQueryData.size.width / 6.0,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 13.0,
                            color: Colors.black38,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Container(
                              height: 6.0,
                                width: mediaQueryData.size.width / 5.5,
                                color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, left: 10.0, bottom: 15.0),
                      child: Container(
                        height: 7.0,
                        width: mediaQueryData.size.width/2.5,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

///
///
/// Calling imageLoading animation for set a grid layout
///
///
Widget _loadingImageAnimation(BuildContext context){
  MediaQueryData mediaQueryData = MediaQuery.of(context);
 return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: mediaQueryData.size.height / 1300,
    crossAxisSpacing: 0.0,
    mainAxisSpacing: 0.0,
    primary: false,
    children: List.generate(
      /// Get data in flashSaleItem.dart (ListItem folder)
      flashData.length,
          (index) => loadingItemGrid(flashData[index]),
    ),
  );
}


///
///
/// Calling ImageLoaded animation for set a grid layout
///
///
Widget _imageLoaded(BuildContext context){
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: mediaQueryData.size.height / 1300,
    crossAxisSpacing: 0.0,
    mainAxisSpacing: 0.0,
    primary: false,
    children: List.generate(
      /// Get data in flashSaleItem.dart (ListItem folder)
      flashData.length,
          (index) => itemGrid(flashData[index]),
    ),
  );
}