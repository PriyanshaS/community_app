import 'package:community_app/Models/event_model.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
   const EventInfo({super.key , required this.event});
 final Map<String,dynamic> ?event;

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
              title: Text('${widget.event!['title']}' ,style: TextStyle(color: Colors.black , fontSize:30 , )),
              
               shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ), 
             ),
          ),
        ), 
      body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Expanded(
                      child: Text('${widget.event!['title']}' , textAlign:TextAlign.left,
                      style: TextStyle(fontSize:30 , fontWeight: FontWeight.w600 ),
                      overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                    ),
                  ),
                  IconButton(onPressed: () {
                    
                  },
                    icon: const Icon(Icons.share , color: Colors.grey),
                    ),
                ],
              )
              ,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      height: 40,
                      width:  90,
                      child: Center(child: Text('${widget.event!['date']}')),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.purple[100]),
                    )
                   ),
                    Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      child: Center(child: Text('${widget.event!['time']}')),
                      height: 40,
                      width:  80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.purple[100]),
                    )
                   ),
                   
                    Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: Container(
                      height: 40,
                      width:  100,
                      child: Center(child: Text('${widget.event!['location']}')),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.purple[100]),
                    )
                   ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(12,15,12,15),
                child: Text('${widget.event!['description']}' , 
                style: TextStyle(fontSize: 15,  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  
                     IconButton(onPressed: () {
                    
                  },
                  tooltip: 'RSVP',
                    icon:  Icon(Icons.rsvp, color: Colors.grey ,semanticLabel: 'RSVP',),
                    ),

                    Container(width: 2,color: Colors.grey,height: 20,),
                     IconButton(onPressed: () {
                    
                  },
                    icon:  Icon(Icons.calendar_today , color: Colors.grey),
                    ),
                  
                ],),
              )
            ],
          ),
        ));
     

  }


 
}



// share , rsvp , add to calendar , 