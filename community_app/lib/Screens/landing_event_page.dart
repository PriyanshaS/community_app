import 'package:community_app/Widgets/event_card.dart';
import 'package:community_app/Widgets/event_listview.dart';
import 'package:community_app/Widgets/event_search_box.dart';
import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0 , 8.0,20.0,8.0 ),
            child: EventSearchBox()
          ),
         SizedBox(height: 20,),
         EventListview(title: 'Upcoming Events',),
         SizedBox(height: 20,),
         EventListview(title: 'Past Events',),
        ],
      ),
    );
  }
}