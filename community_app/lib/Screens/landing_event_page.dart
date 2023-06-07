
import 'event_info.dart';
import 'package:community_app/Widgets/event_search_box.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_app/Models/event_model.dart';
class EventPage extends StatefulWidget {
  const EventPage({super.key});
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<List<Event>>(
        stream: readUsers(),
        builder: ((context, snapshot) {
          if(snapshot.hasError){
            return Text('Something went wrong ${snapshot.error}');
          }
       else if(snapshot.hasData){
         final events = snapshot.data;
         
       
       return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0 , 8.0,20.0,8.0 ),
                child: EventSearchBox(events:events),
              ),
             SizedBox(height: 20,),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Upcoming Events" , style: const TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                child: SizedBox(
                  height: 250,
                  child: ListView(

                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    
                    children: events!.map(buildEvent).toList()
                  ,),
                ),
              ),
            ],
          ),
             SizedBox(height: 20,),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Past Events" , style: const TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                child: SizedBox(
                  height: 250,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: events.map(buildEvent).toList(),
                   ),
                ),
              ),
            ],
          ),
            ],
          ),
        );}
        else{
          return Center(child: CircularProgressIndicator(),);
        }
        
        
         }
        )

      ),
    );


    
  }
  Widget buildEvent(Event event) =>Container(
      height: 100,
      width: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EventInfo(event: event.toJsonFunc(),),));
        },
        child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              SizedBox(height: 20,),
      
      
              Text('${event.heading}' , style: TextStyle(
                
                fontSize:18, fontWeight: FontWeight.bold,),
              ),
      
      
              SizedBox(height: 10,),
      
      
              Text('${event.desc}' ,
              maxLines: 2, style: TextStyle(
                
                fontSize:13,), 
              ),
                          SizedBox(height: 10,),
      
              Row(
                children: [
                  Icon(Icons.date_range ,),
                  SizedBox(
                  width: 8,),
                  Text('${event.date}'),
      
                  
                ],
              ),
              SizedBox(height:5),
               Row(
                children: [
                  Icon(Icons.timer ,),
                  SizedBox(
                  width: 8,),
                  Text('${event.time}'),
      
                  
                ],
              ),
               SizedBox(height:5),
               Row(
                children: [
                  Icon(Icons.location_on,),
                  SizedBox(
                  width: 8,),
                  Expanded(
                    child: Text(
                     
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      '${event.location}'),
                  ),
      
                  
                ],
              )
            ],
          ),
        ),
      
        ),
      ),
    );
   Stream<List<Event>> readUsers() {
    Stream<List<Event>> value = FirebaseFirestore.instance.collection('events').snapshots().map((snapshot) =>snapshot.docs.map((e) =>Event.fromJson(e.data())).toList());
    
    return value;}

}