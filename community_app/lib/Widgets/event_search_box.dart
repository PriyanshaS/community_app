import 'package:flutter/material.dart';
import 'package:community_app/Models/event_model.dart';
import 'package:community_app/Screens/search.dart';
class EventSearchBox extends StatefulWidget {
   EventSearchBox({super.key , required this.events});
  List<Event>? events;

  @override
  State<EventSearchBox> createState() => _EventSearchBoxState();
}

class _EventSearchBoxState extends State<EventSearchBox> {
  
  TextEditingController controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search(allEvents:widget.events,),));
      },
              readOnly: true,
              decoration: InputDecoration(
               
                prefixIcon: Icon(Icons.search , color: Colors.grey,),
                hintText: 'Search Event',
                hintStyle: TextStyle(color: Colors.grey),
               
      
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
      
                borderSide: BorderSide(color: Colors.grey))
              ),
            );
  }
}