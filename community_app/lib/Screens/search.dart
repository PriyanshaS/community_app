import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
   List searchResult=[] ;
    void searchFromFb(String query) async{
      final result = await FirebaseFirestore.instance.collection('events').where('title',isEqualTo: query).get();
      


setState(() {
        searchResult = result.docs.map((e) => e.data()).toList();

});
    }
  TextEditingController controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            TextField(
                      controller: controller,
                      onChanged: (query) {
                        searchFromFb(query);
                      },
                      decoration: InputDecoration(
                       
                        prefixIcon: Icon(Icons.search , color: Colors.grey,),
                        hintText: 'Search Event',
                        hintStyle: TextStyle(color: Colors.grey),
                       
                
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                  
                        borderSide: BorderSide(color: Colors.grey))
                      ),
                    ),
        
                    Expanded(child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchResult[index]['title']),
                        subtitle: Text(searchResult[index]['description']),
                      );
                    },))]),
      ),
    );
  }
}