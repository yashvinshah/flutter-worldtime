// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Europe', flag: 'germany.png', url: 'Europe/London',);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    }
  
    @override
  void initState() {
    super.initState();
    setUpWorldTime();
    // print('hey!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue[700],
          size: 50,
        ),
      ),
      //   padding: EdgeInsets.all(100),
      //   child: Text('loading again'),
    );
  }
}