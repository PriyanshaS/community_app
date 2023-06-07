import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event{
String ?desc;
String ?heading;
String ? date;
String ? time;
String ? location ;


Event({this.heading, this.desc , this.date ,this.time, this.location} );

Map<String , String?> toJsonFunc()=>{
  'title' : heading,
  'description':desc,
  
  'date':date,
  'time':time,
  'location':location
  
};

static Event fromJson(Map<String , dynamic> json)=> Event(
       date: json['date'],
       desc: json['description'],
       heading: json['title'],
      
       location: json['location'],
       time: json['time']);
}

/*List<Event> eventData =[
  Event(img_url: ['asset/image/pcimg1.jpg'],heading: "Sic mundus cretus est",desc: "Sic mundus cretus est Sic mundus cretus est Sic mundus cretus est Sic mundus cretus estSic mundus cretus est",date: "23-07-2023",time: "07:30",location:  "DayalBagh"),
   
];*/




List<Event> eventData =[
  Event(heading: "Sic mundus cretus est",desc: "Sic mundus cretus est Sic mundus cretus est Sic mundus cretus est Sic mundus cretus estSic mundus cretus est",date: "23-07-2023",time: "07:30",location:  "DayalBagh"),
   
];
