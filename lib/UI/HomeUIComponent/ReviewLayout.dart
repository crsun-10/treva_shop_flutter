import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:treva_shop_flutter/Library/Expanded/ExpandedDetailRatting.dart';
import 'package:treva_shop_flutter/Library/Expanded/ExpandedDetailReviews.dart';

class ReviewsAll extends StatefulWidget {
  @override
  _ReviewsAllState createState() => _ReviewsAllState();
}

class _ReviewsAllState extends State<ReviewsAll> {
  @override
  double rating = 3.5;
  int starCount = 5;

  /// Custom Text for Detail title
  static var _detailText = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black54,
      letterSpacing: 0.3,
      wordSpacing: 0.5);

  Widget build(BuildContext context) {

    MediaQueryData mediaQuery = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reviews"),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.black87,)),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:10.0,left: 20.0),
                  child:  Text("Reviews",style: TextStyle(color: Colors.black,fontSize: 20.0,fontFamily: "Popins",fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:5.0,left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            StarRating(
                              size: 25.0,
                              starCount: 5,
                              rating: rating,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 5.0),
                            Text('8 Reviews')
                          ]),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                ListTile(
                  leading: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/avatars/avatar-4.jpg"),fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      StarRating(
                        size: 20.0,
                        rating: rating,
                        starCount: starCount,
                        color: Colors.yellow,
                        onRatingChanged:   (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        },),
                      SizedBox(width: 8.0),
                      Text(
                        "01 Jan 2019",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                  subtitle:  ExpansionTileReview(
                    title:Text(
                      'Item delivered in good condition. I will recommend to other buyer',style: _detailText,
                    ),
                    children:[
                      SizedBox(height: 10.0),
                      Text("Very Recommended item i love it very love it",style: _detailText,),
                      SizedBox(height: 10.0),
                      Text("Item delivered in good condition. I will recommend to other buyer.",style: _detailText,),
                    ],
//                              child: Text("Read More",style: _subHeaderCustomStyle.copyWith(fontSize: 13.0,color: Colors.blueAccent),
//                              textAlign: TextAlign.end,
//                              ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                _buildRating('18 Nov 2018',
                    'Item delivered in good condition. I will recommend to other buyer.',
                        (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                    "assets/avatars/avatar-1.jpg"
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                _buildRating('18 Nov 2018',
                    'Item delivered in good condition. I will recommend to other buyer.',
                        (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                    "assets/avatars/avatar-4.jpg"
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                _buildRating('18 Nov 2018',
                    'Item delivered in good condition. I will recommend to other buyer.',
                        (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                    "assets/avatars/avatar-2.jpg"
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                _buildRating('18 Nov 2018',
                    'Item delivered in good condition. I will recommend to other buyer.',
                        (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                    "assets/avatars/avatar-3.jpg"
                ),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                  child: _line(),
                ),
                _buildRating('18 Nov 2018',
                    'Item delivered in good condition. I will recommend to other buyer.',
                        (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                    "assets/avatars/avatar-5.jpg"
                ),
                SizedBox(height: 10.0,),
                _line(),
                Column(
                  children: <Widget>[
                    ExpansionTileCustomRatting(
                      title: _buildRating('18 Nov 2018',
                          'Item delivered in good condition. I will recommend to other buyer.',
                              (rating) {
                            setState(() {
                              this.rating = rating;
                            });
                          },
                          "assets/avatars/avatar-6.jpg"
                      ),
                      children:[
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-1.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-3.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-2.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-1.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating('18 Nov 2018',
                            'Item delivered in good condition. I will recommend to other buyer.',
                                (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            "assets/avatars/avatar-5.jpg"
                        ),
                      ],
//                              child: Text("Read More",style: _subHeaderCustomStyle.copyWith(fontSize: 13.0,color: Colors.blueAccent),
//                              textAlign: TextAlign.end,
//                              ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 40.0)),
              ],
            ),
          ),
          /// Get a class AppbarGradient
          /// This is a Appbar in home activity
//          Container(
//            height: 200.0,
//            width: double.infinity,
//            child: Column(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top: statusBarHeight),
//                  height: 8.0 + statusBarHeight,
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                    /// gradient in appbar
//                      gradient: LinearGradient(
//                          colors: [
////                            const Color(0xFFA3BDED),
////                            const Color(0xFF6991C7),
//                          Colors.white
//                          ],
//                          begin: const FractionalOffset(0.0, 0.0),
//                          end: const FractionalOffset(1.0, 0.0),
//                          stops: [0.0, 1.0],
//                          tileMode: TileMode.clamp)),
////                  child: Center(child: Text("Review",style: TextStyle(color: Colors.white,fontSize: 18.0,fontFamily: "Popins",fontWeight: FontWeight.w600),)),
//                ),
//                Icon(Icons.arrow_back_ios,color: Colors.black87,size: 20.0,),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
  Widget _buildRating(String date, String details, Function changeRating,String image) {
    return ListTile(
      leading: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(50.0))
        ),
      ),
      title: Row(
        children: <Widget>[
          StarRating(
              size: 20.0,
              rating: rating,
              starCount: starCount,
              color: Colors.yellow,
              onRatingChanged: changeRating),
          SizedBox(width: 8.0),
          Text(
            date,
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
      subtitle: Text(details,style: _detailText,),
    );
  }

}

Widget _line(){
  return  Container(
    height: 0.9,
    width: double.infinity,
    color: Colors.black12,
  );
}