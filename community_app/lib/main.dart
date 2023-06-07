import 'package:community_app/Screens/event_creation_page.dart';
import 'package:community_app/Screens/landing_event_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed:Colors.purple 
        ,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Anton',
        textTheme: TextTheme(bodyText1:TextStyle(
          fontSize: 30 , 
          color: Colors.indigoAccent
        ) ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[100],
          centerTitle: true,

        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
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
            title: Text('Event' ,style: TextStyle(color: Colors.black , fontSize:30 , )),
            
            
          
           ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const EventCreation()),
  );
      },
      icon: Icon(Icons.add),
      label: Text("Add Event"),
      ),
     body: EventPage(),
     
    );
  }
}