
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime() async {
    WorldTime inst=WorldTime(location: "Kolkata",flag: 'India.png',url: 'Asia/Kolkata');
    await inst.getTime();
    //arguements is a map
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':inst.location,
      'flag':inst.flag,
      'time':inst.time,
      'isDayTime':inst.isDayTime
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRipple(
            color: Colors.white,
            size: 50,
        ),
      )
    );
  }
}
