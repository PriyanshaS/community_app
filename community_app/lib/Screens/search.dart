import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_app/Screens/event_info.dart';
import 'package:flutter/material.dart';
import 'package:community_app/Models/event_model.dart';
import 'landing_event_page.dart';
class Search extends StatefulWidget {
  Search({super.key , this.allEvents});
    List<Event>? allEvents ;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
   
  TextEditingController controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,8,20,8),
          child: Column(
            children: [
              TextField(
                        controller: controller,
                        onChanged: searchEvent,
                        decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.search , color: Colors.grey,),
                          hintText: 'Search Event',
                          hintStyle: TextStyle(color: Colors.grey),
                         
                  
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                    
                          borderSide: BorderSide(color: Colors.grey))
                        
                        ),
                      ),
          
                      Expanded(child: ListView.builder(
                        itemCount: widget.allEvents!.length,
                        itemBuilder: (context, index) {
                        final event = widget.allEvents![index];
                        
                        return ListTile(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>EventInfo(event: event.toJsonFunc(),) ,)),
                          leading: Text('${event.date}'),
                          title: Text('${event.heading}'),
                        );
                      },))
                      ,
                      ]),
        ),
      ),
    );
  }
  void searchEvent(String query){
    final suggestions = widget.allEvents!.where((element){
      final eventHeading = element.heading!.toLowerCase();
      final input = query.toLowerCase();
      return eventHeading.contains(input);
    }).toList();
    setState(() {
      widget.allEvents=suggestions;
    });
  }
}