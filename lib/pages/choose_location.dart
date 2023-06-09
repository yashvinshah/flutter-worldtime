// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // int counter = 0;

  List<WorldTime> locations = [ 
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'), 
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'), 
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'), 
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'), 
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'), 
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'), 
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'), 
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'), 
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //!navigate to home screen
    Navigator.pop(
      context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      }
    );
  }
 

  @override
  Widget build(BuildContext context) {
    // print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: Card(
              color: Colors.cyan[50],
              child: ListTile(
                onTap: () {
                  updateTime(index);                                  
                },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(color: Colors.cyan[800]),
                  ),
              ),
            ),
          );
        }
        ),
    );
  }
}