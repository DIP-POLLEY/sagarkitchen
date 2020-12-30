import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sagar_kitchen/widgets/cardButton.dart';


final _firestore = Firestore.instance;

class CardStreamer extends StatefulWidget {
  @override
  _CardStreamerState createState() => _CardStreamerState();
}

class _CardStreamerState extends State<CardStreamer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Events').snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return Center(
            child: Text("No Upcoming events"),
          );
        }

        final details = snapshot.data.documents;
        List<CardButton> cardkeeper = [];
        for (var detl in details)
          {
            final name = detl.data['Event Name'];
            final date = detl.data['Date'];
            final nOI = detl.data['Number of Items'];
            final itms = detl.data['Items'];
            final prc = detl.data['Price'];
            final sts = detl.data['Status'];
            // print(itms);
            final wiget = CardButton(
              nam: name,
              dat: date,
              n: nOI,
              s1: itms,
              s2: prc,
            );
            if(sts == "ON")
              {
                cardkeeper.add(wiget);
              }

          }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cardkeeper,
        );
      }
    );
  }
}
