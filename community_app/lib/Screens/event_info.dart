import 'package:community_app/Models/event_model.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
            
             
              elevation: 0,
              centerTitle: true,
              title: Text('Sic mundus cretus est' ,style: TextStyle(color: Colors.black , fontSize:30 , )),
              leading:CircleAvatar(backgroundImage: AssetImage('asset/image/pcimg1.jpg') ,
              ),
            backgroundColor: Colors.white,
             ),
          ),
        ), 
      body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('asset/image/pcimg1.jpg' ,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,),
      
              Padding(
                padding: const EdgeInsets.fromLTRB(12,15,12,15),
                child: Text('${eventData[0].heading}' , textAlign:TextAlign.left,
                style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600 ),),
              )
              ,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      height: 40,
                      width:  90,
                      child: Center(child: Text('${eventData[0].date}')),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[300]),
                    )
                   ),
                    Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      child: Center(child: Text('${eventData[0].time}')),
                      height: 40,
                      width:  80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[300]),
                    )
                   ),
                    Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      height: 40,
                      width:  80,
                      child: Icon(Icons.location_on),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[300]),
                    )
                   ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(12,15,12,15),
                child: Text('${eventData[0].desc}' , 
                style: TextStyle(fontSize: 12,  ),),
              )
            ],
          ),
        ));
       
  }
 
 
}



// share , rsvp , add to calendar , 