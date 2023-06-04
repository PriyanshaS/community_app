import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTime extends StatefulWidget {
  DateAndTime({super.key , this.dateController , this.timeController});
 TextEditingController ?dateController ;
  TextEditingController ?timeController ;
  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.fromLTRB(30,8,30,8),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        child: TextField(controller: widget.dateController,
                        decoration: InputDecoration(icon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey) ),
                        labelText: 'Enter Date',
                        labelStyle:TextStyle(color: Colors.grey), ),
                        readOnly: true,
                        onTap: () async{
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), 
                              firstDate:DateTime.now(), 
                              lastDate: DateTime(2101)
                          );
                          if(pickedDate != null ){
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                        setState(() {
                           widget.dateController!.text = formattedDate; 
                        });
                    }else{
                        print("Date is not selected");
                    }
                        },),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 160,
                        child: TextField(controller: widget.timeController,
                        decoration: InputDecoration(icon: Icon(Icons.timer),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey) ),
                        
                        labelText: 'Enter Time'
                        ,labelStyle:TextStyle(color: Colors.grey), ),
                        readOnly: true,
                        onTap: () async{
                          TimeOfDay? result = await showTimePicker(
                            context: context, 
                            initialTime: TimeOfDay.now());
                            if (result != null) {
                              setState(() {
                           widget.timeController!.text = result.format(context);});}
                           else{
                            print("Time is not selected");
                           }
                  
                        },),

                      ),
                    ],
                  ),
                );
  }
}