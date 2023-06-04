import 'package:flutter/material.dart';

class FromTextfield extends StatefulWidget {
  FromTextfield({super.key , required this.controller , required this.hintText ,});
  TextEditingController ?controller = TextEditingController();
  String ?hintText;
  
  @override
  State<FromTextfield> createState() => _FromTextfieldState();
}

class _FromTextfieldState extends State<FromTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,8.0,30,8),
      child: TextField(
                controller:widget.controller ,
                
                decoration: InputDecoration(
                  
                  hintText: '${widget.hintText}',
                  hintStyle: TextStyle(color: Colors.grey),
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey))
                ),
              ),
    );
  }
}