import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sagar_kitchen/widgets/appbar.dart';
import 'package:sagar_kitchen/utilities/constants.dart';
import 'package:sagar_kitchen/utilities/database.dart';
import 'package:sagar_kitchen/screens/homepage.dart';

class Items extends StatefulWidget {
  static const String id = 'events';
  Items({this.nam,this.dat,this.itn});
  final String nam,dat;
  final int itn;
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {

  int n=1;
  var items = <TextEditingController>[];
  var price = <TextEditingController>[];
  var card = <Card>[];

  Card createCard(){
    var it = TextEditingController();
    var pr = TextEditingController();

    items.add(it);
    price.add(pr);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              controller: it,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: kBoxfield.copyWith(
                hintText: "Item Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              controller: pr,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: kBoxfield.copyWith(
                hintText: "Item Price",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  String _name,_date;
  int _n;

  List<String> itlist = [];
  List<String> prlist = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = widget.nam;
    _n = widget.itn;
    _date = widget.dat;
    for(int i=0;i<_n;i++)
      {
        setState(() {
          card.add(createCard());
        });
      }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppbar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: card.length,
              itemBuilder: (BuildContext context,int index){
                return card[index];
              }
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                for(int j=0;j<card.length;j++)
                  {
                    String x= ((items[j].text).toString());
                    String y= ((price[j].text).toString());
                    itlist.add(x);
                    prlist.add(y);


                    // prlist[j] = price[j].text;
                  }

                addMenuDetails(_name, _date, _n, itlist, prlist);
                Navigator.popUntil(context, ModalRoute.withName(Home.id));
              },
              child: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'UPLOAD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
