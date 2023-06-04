import 'package:flutter/material.dart';

import 'package:community_app/Screens/search.dart';
class EventSearchBox extends StatefulWidget {
  const EventSearchBox({super.key});

  @override
  State<EventSearchBox> createState() => _EventSearchBoxState();
}

class _EventSearchBoxState extends State<EventSearchBox> {
  List? searchResult ;

  TextEditingController controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
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