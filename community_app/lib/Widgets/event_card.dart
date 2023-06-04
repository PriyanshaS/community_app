import 'package:community_app/Models/event_model.dart';
import 'package:community_app/Screens/event_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class EventCard extends StatefulWidget {
   EventCard({super.key,this.event,this.index});
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? event;
  int ?index;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 363,
      width: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EventInfo(),));
        },
        child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${widget.event![widget.index!].data()['img_url'][0]}', fit: BoxFit.cover,
              
              height: 134,
              width: 334,),
      
      
              SizedBox(height: 20,),
      
      
              Text('${widget.event![widget.index!].data()['title']}' , style: TextStyle(
                
                fontSize:18, fontWeight: FontWeight.bold,),
              ),
      
      
              SizedBox(height: 10,),
      
      
              Text('${widget.event![widget.index!].data()['description']}' , style: TextStyle(
                fontSize:13,), 
              ),
                          SizedBox(height: 10,),
      
              Row(
                children: [
                  Icon(Icons.date_range ,),
                  SizedBox(
                  width: 8,),
                  Text('${widget.event![widget.index!].data()['date']}'),
      
                  
                ],
              ),
              SizedBox(height:5),
               Row(
                children: [
                  Icon(Icons.timer ,),
                  SizedBox(
                  width: 8,),
                  Text('${widget.event![widget.index!].data()['time']}'),
      
                  
                ],
              ),
               SizedBox(height:5),
               Row(
                children: [
                  Icon(Icons.location_on,),
                  SizedBox(
                  width: 8,),
                  Text('${widget.event![widget.index!].data()['location']}'),
      
                  
                ],
              )
            ],
          ),
        ),
      
        ),
      ),
    );
  }
}