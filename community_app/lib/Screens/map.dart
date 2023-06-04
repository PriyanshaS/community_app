import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class Mapp extends StatefulWidget {
   Mapp({super.key , this.address});
   TextEditingController ?address;

  @override
  State<Mapp> createState() => _MappState();
}

class _MappState extends State<Mapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OpenStreetMapSearchAndPick(
      center: LatLong(28, 77),onPicked: (pickedData) {
        final latitude = pickedData.latLong.latitude;
        final longitude = pickedData.latLong.longitude;
        setState(() {
                  widget.address!.text = pickedData.address;

        });
        print(widget.address);
      },
      
      
      ),);
  }

}