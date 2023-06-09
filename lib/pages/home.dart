// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //! background
    String bg = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgC = data['isDaytime'] ? Color.fromARGB(255, 10, 16, 112) : Color.fromARGB(255, 1,47, 70);
    Color? textcolor = data['isDaytime'] ? Color.fromARGB(255, 101, 65, 51) : Color.fromARGB(255, 219, 211, 185);

    return Scaffold(
      backgroundColor: bgC,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120,0,0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed:() async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                  ),
                  SizedBox(height: 400),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 30,
                        color: textcolor,
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60,
                      color: textcolor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}