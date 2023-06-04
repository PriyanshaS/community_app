import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Models/event_model.dart';
import 'event_card.dart';
class EventListview extends StatefulWidget {
  const EventListview({Key? key , required this.title});
  final String title ;
  @override
  State<EventListview> createState() => _EventListviewState();
}

class _EventListviewState extends State<EventListview> {
  @override
  
  Widget build(BuildContext context) {
    return
        StreamBuilder(
          stream:FirebaseFirestore.instance.collection('events').get().asStream(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final events = snapshot.data!.docs;
              
              
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title , style: const TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                child: SizedBox(
                  height: 363,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                    return EventCard(event: events,index: index,);
                  },),
                ),
              ),
            ],
          );}
          return Center(child: CircularProgressIndicator(),);
          
          }
        );
  }
}