import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagar_kitchen/screens/eventmaker.dart';
import 'package:sagar_kitchen/utilities/getMenu.dart';
import 'package:sagar_kitchen/widgets/appbar.dart';
import 'package:sagar_kitchen/widgets/roundbutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';





class Home extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppbar(),
      ),
      body: ListView(
        children: <Widget>[

          CarouselSlider(
            height: 250,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.9,
            items: [
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/13.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image:AssetImage("images/1.jpeg"),
                      fit: BoxFit.cover
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/2.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/3.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/4.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/5.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/6.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/7.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/8.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/9.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/10.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("images/11.jpeg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),




            ],

          ),
          SizedBox(
            height: 30,
          ),
          CardStreamer(),
          // RoundButton(
          //   onpres: (){
          //     Navigator.pushNamed(context, EventsMaker.id);
          //   },
          //   icon: FontAwesomeIcons.plus,
          // ),
        ],
      ),
    );
  }
}

