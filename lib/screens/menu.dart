import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sagar_kitchen/utilities/database.dart';
import 'package:sagar_kitchen/widgets/appbar.dart';
import 'package:sagar_kitchen/utilities/constants.dart';
import 'package:sagar_kitchen/screens/homepage.dart';

class Menu extends StatefulWidget {
  static const String id = 'menu';
  Menu({this.l1,this.l2,this.n,this.evnt});
  final int n;
  final String evnt;
  final List<dynamic> l1;
  final List<dynamic> l2;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _num;
  String _evnm;
  var od = <TextEditingController>[];
  List<dynamic> _l1;
  List<dynamic> _l2;
  var card = <Card>[];
  Map map = Map<String,String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _num = widget.n;
    _l1 = widget.l1;
    _l2 = widget.l2;
    _evnm = widget.evnt;
    for(int i=0;i<_num;i++)
      {
        setState(() {

          card.add(create(i));
        });

      }
    setState(() {
      card.add(adddets());
    });


  }
  var nm = TextEditingController();
  var phn = TextEditingController();
  Card adddets()
  {

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              controller: nm,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: kBoxfield.copyWith(
                hintText: "Your Name:",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              controller: phn,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: kBoxfield.copyWith(
                hintText: "Contact Number",
              ),
            ),
          ),
        ],
      ),
    );
  }
  Card create(int i)
  {
    var cl = TextEditingController();
    od.add(cl);

    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
             "${_l1[i]}",

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
             "Rs.${_l2[i]}",

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              controller:cl,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: kBoxfield.copyWith(
                hintText: "Order: 0",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );

  }

  List<String> orders = [];


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
              child:GestureDetector(
                onTap: (){

                  String cn = nm.text.toString();
                  String p = phn.text.toString();

                  if(p!="" && cn != "")
                    {
                      for(int j=0;j<card.length-1;j++)
                      {
                        String x= ((od[j].text).toString());
                        if(x == "")
                          orders.add("0");
                        else
                          orders.add(x);

                        map[_l1[j]] = orders[j];
                      }

                      placeOrder(cn, p, _evnm, map);
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Confirmed",
                        desc: "Your order have been placed.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            width: 120,
                            onPressed: (){
                              Navigator.popUntil(context, ModalRoute.withName(Home.id));
                            },
                          )

                        ],
                      ).show();


                    }
                  else
                    {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Error",
                        desc: "Enter name and contact number to place order.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            width: 120,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )

                        ],
                      ).show();
                    }

                },
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Place Order',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ) ,
          )
        ],
      ),
    );
  }
}
