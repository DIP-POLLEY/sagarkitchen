import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagar_kitchen/screens/menu.dart';
import 'package:sagar_kitchen/utilities/constants.dart';

class CardButton extends StatefulWidget {
  CardButton({this.nam,this.dat,this.n,this.s1,this.s2});
  final String nam,dat;
  final int n;
  final List<dynamic> s1;
  final List<dynamic> s2;
  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {


  String _nam,_dat;
  int c;
  int _n;
  List<dynamic> _it;
  List<dynamic> _pr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nam = widget.nam;
    _it = widget.s1;
    _pr = widget.s2;
    _n = widget.n;
    _dat = widget.dat;
    datefunc(_dat);

  }
  String a,b;
  void datefunc(String s)
  {
    a = s.substring(8,10);
    b = s.substring(5,7);
    c = int.parse(b);
    b = kMonths[c];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Menu(
                  n: _n,
                  l1: _it,
                  l2: _pr,
                  evnt: _nam,
                )
            ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$a",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$b",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  "$_nam",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          height: 100,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
