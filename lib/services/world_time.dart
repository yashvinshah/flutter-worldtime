import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //!location name for UI
  String time='0'; //!time in the location
  String flag; //! url for flags
  String url; //! location url for api endpoints
  late bool isDaytime; //! true or false for day

  WorldTime({required this.location, required this.flag, required this.url,});


   Future<void> getTime() async {

    try {
      
       //?make the request

    Response response =  await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    // print(data);

    //?get properties from data

    // String datetime = data['datetime'];
    // DateTime now = DateTime.parse(datetime);
    // print(now);
    // now = now.toLocal();

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    print(datetime);
    print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
    


    // print(now);

    // Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    //?simulate a network req for a username

  //  String username = await Future.delayed(Duration(seconds: 5), () {
  //     return 'yashvi';
  //   });

  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'the best';
  //   });

  //   print('$username - $bio');
  }



    catch (e) {
      print('caught an error: $e');
      time = 'could not get the time data';

    }
  }

}

   

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
