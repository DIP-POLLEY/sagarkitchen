import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = Firestore.instance;


Future<bool> eventAlready(String evnt) async
{
  final QuerySnapshot result = await _firestore.collection('Events').where('Event Name', isEqualTo: evnt).getDocuments();
  final List<DocumentSnapshot> documents = result.documents;

  return documents.length>0;
}

void addMenuDetails(String event,String date,int itn,var itlist,var prlist) async
{
  if(await eventAlready(event) == false)
    {
      _firestore.collection('Events').document('$event').setData({
        'Event Name':event,
        'Date':date,
        'Number of Items':itn,
        'Items': itlist,
        'Price': prlist,
        'Status': "ON",
      });
    }
}

void placeOrder(String nm,String phn,String evnt,var odlst)
{
  _firestore.collection('$evnt').document('$nm').setData({
    'Name': nm,
    'Phone Number': phn,
    'Order List': odlst,
  });
}