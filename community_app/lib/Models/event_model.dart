import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event{
List<String> ?img_url ;
String ?desc;
String ?heading;
String ? date;
String ? time;
String ? location ;


Event({this.img_url ,this.heading, this.desc , this.date ,this.time, this.location} );

Map<String , dynamic> toJson()=>{
  'title' : heading,
  'description':desc,
  'img_url' : img_url,
  'date':date,
  'time':time,
  'location':location
  
};

 

}

/*List<Event> eventData =[
  Event(img_url: ['asset/image/pcimg1.jpg'],heading: "Sic mundus cretus est",desc: "Sic mundus cretus est Sic mundus cretus est Sic mundus cretus est Sic mundus cretus estSic mundus cretus est",date: "23-07-2023",time: "07:30",location:  "DayalBagh"),
   
];*/

Future createUser ({List<String> ? img_url ,
String ?desc,
String ?title,
String ? date,
String? time,
String ? location ,
})
async{
  final docUser = FirebaseFirestore.instance.collection('events').add(
    {
      'title' : title,
  'description':desc,
  'img_url' : img_url,
  'date':date,
  'time':time,
  'location':location
    }


  );
   /*final event = Event(img_url: img_url,heading:  title, desc: desc,date:  date, time: time,location: location);
   final json = event.toJson();
   await docUser.set(json);*/
}




List<Event> eventData =[
  Event(img_url: ['asset/image/pcimg1.jpg'],heading: "Sic mundus cretus est",desc: "Sic mundus cretus est Sic mundus cretus est Sic mundus cretus est Sic mundus cretus estSic mundus cretus est",date: "23-07-2023",time: "07:30",location:  "DayalBagh"),
   
];
