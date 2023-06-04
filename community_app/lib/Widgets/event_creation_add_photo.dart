import 'dart:io';

import 'package:community_app/Widgets/event_listview.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
class AddPhoto extends StatefulWidget {
   AddPhoto({super.key , this.urls});
  List<TextEditingController> ?urls;
  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  FilePickerResult ?result;
   UploadTask? uploadTask;
   
   List<PlatformFile> allFiles=[];

Future selectFile() async{
  
      result = await FilePicker.platform.pickFiles(allowMultiple: true,);
  if(result == null)
  return ;

    allFiles = result!.files;
    allFiles.forEach((element) {
      uploadFile(element);
    },);
   
  
    
}

Future uploadFile(PlatformFile pickedFile) async{
  final path = 'files/${pickedFile.name}';
  final file = File(pickedFile.path!);
  final ref = FirebaseStorage.instance.ref().child(path);
  setState(() {
      uploadTask = ref.putFile(file);
  });
  

  final snapshot = await uploadTask!.whenComplete(() {

  });
    await snapshot.ref.getDownloadURL().then((value){
      TextEditingController controller = TextEditingController();
      controller.text = value;
      setState(() {
         widget.urls!.add(controller);
      });
     });
    
  
  setState(() {
    uploadTask=null;
    
  });
 
}

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30,8,30,8),
            child: GestureDetector(
              onTap: () {
                selectFile();
              },
              child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey[300]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Add event photo' , style: TextStyle(color: Colors.grey),),
                                        Icon(Icons.add_a_photo),
                                      ],
                                    ),
                                  ),
            ),
          ),
        if(allFiles!=null)
             Padding(
                             padding: const EdgeInsets.fromLTRB(30,8,30,8),
                             child: Container(
                              height: 150,
                               child:SizedBox(
                          height: 363,
                          
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20,);
                            },
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: allFiles.length,
                            itemBuilder: (context, index) 
                            {
                                 return 
                                 Container(

                                   decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.grey[100], ),
                                    height: 150,
                                    width:150,
                                    child: Image.file(File(allFiles[index].path!
                                    ,
                                    ),
                                    fit: BoxFit.cover,
                                    
                                  ));  
                              
                          },),
                        ),)
                          ,),
                          
                           Padding(
                             padding: const EdgeInsets.fromLTRB(30,8,30,8),
                             child: Container(
                              height: 150,
                               child:SizedBox(
                          height: 363,
                         
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20,);
                            },
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) 
                            
                            {
                                 return 
                                 Container(
                                   decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.grey[100], ),
                                    height: 150,
                                    width:150,
                                    child:  Icon(Icons.add , color: Colors.grey,
                                    size: 30,),
                                    
                                  );  
                              
                          },),
                        ),)
                          ,),
         
          
                    ]),
                         );
                       
  }
}


