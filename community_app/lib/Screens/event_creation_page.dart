import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_app/Models/event_model.dart';
import 'package:community_app/Screens/landing_event_page.dart';
import 'package:community_app/Screens/map.dart';
import 'package:community_app/Widgets/event_creation_add_photo.dart';
import 'package:community_app/Widgets/event_creation_date_time.dart';
import 'package:community_app/Widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class EventCreation extends StatefulWidget {
  const EventCreation({super.key});
  
  @override
  State<EventCreation> createState() => _EventCreationState();
}
class _EventCreationState extends State<EventCreation> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
 List<TextEditingController> urls = [TextEditingController()];
 List<String> ?urlstring;
 
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
             shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ), 
              elevation: 0,
              centerTitle: true,
              title: Text('New Event' ,style: TextStyle(color: Colors.black , fontSize:30 , )
              ),
            ),
             ),
          ),
        
      body: SingleChildScrollView(
        child: Column(
          children: [
            FromTextfield(controller: titleController,hintText: 'Event Title',),
                 Padding(
              padding: const EdgeInsets.fromLTRB(30,8,30,8),
              child: TextField(
                  controller:descriptionController ,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Event Description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey))
                  ),
                ),
            ),
             
            SizedBox(height: 25,),
            Row(
              children: [
                DateAndTime(dateController: dateController , timeController: timeController,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,8,30,8),
                  child: GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Mapp(address: locationController),));
                  }, 
                  child: Container(child: Image.asset('asset/image/map.jpg',
                  fit: BoxFit.cover),
                  decoration: BoxDecoration(border: Border.all(
                    color: Colors.grey,
                    
                  ),),
                   height: 150,
                   width: 120,),
                  ),
                ),
                 
              ],
            ),
              SizedBox(height: 30,),

              AddPhoto(urls:urls),
              SizedBox(height: 30,),
              Container(height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                final title  = titleController.text;
                final desc = descriptionController.text;
                final date = dateController.text;
                final time = timeController.text;
                final location = locationController.text;   
  // for (TextEditingController controller in urls) {
  //     urlstring!.add(controller.text);
  //   }      
   Navigator.pop(context);
                createEvent(title : title , desc:desc , date:date,
                time:time , location : location , img_url : ['htttp1','http2','http3']);
             }
                ,  
              child: Text('Submit')),
              ),
              ],
            )
      ),
    ) ;

  }
   Future createEvent ({List<String> ? img_url ,
String ?desc,
String ?title,
String ? date,
String? time,
String? location
})
async{
  final docUser = FirebaseFirestore.instance.collection('events').doc();
    final event = Event(
      date: date , time: time ,heading: title , desc: desc , 
        location: location);
      print('in create Eventtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
    final json = event.toJsonFunc();
    await docUser.set(json); 
}
}