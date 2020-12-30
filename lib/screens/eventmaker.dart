import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagar_kitchen/screens/items.dart';
import 'package:sagar_kitchen/utilities/constants.dart';
import 'package:sagar_kitchen/widgets/appbar.dart';

class EventsMaker extends StatefulWidget {
  static const String id = 'items';
  @override
  _EventsMakerState createState() => _EventsMakerState();
}

class _EventsMakerState extends State<EventsMaker> {

  DateTime selectedDate = DateTime.now();

  String s1,s3;
  int s2;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2025)
    );
    if(picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: kBoxfield.copyWith(
                hintText: "Event Name",
              ),

              onChanged: (value){
                s1 = value;
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20,top: 15),
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 60),
            child: RaisedButton(
              onPressed: () => _selectDate(context),
              elevation: 5,
              child: Text(
                'Select Date',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: kBoxfield.copyWith(
                hintText: "No. of items",
              ),
              onChanged: (value){
                s2 = int.parse(value);
              },

            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 80),
            child: RaisedButton(
              onPressed: () {
                s3 = selectedDate.toLocal().toString();
                s3 = s3.split(' ')[0];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Items(
                        nam: s1,
                        itn: s2,
                        dat: s3,
                      )
                  )
                );
              },
              elevation: 5,
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
