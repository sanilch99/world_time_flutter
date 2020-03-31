import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//location for UI
  String time;//time for UI in that location
  String flag;//url to asset flag icon
  String url;
  bool isDayTime;//true or false for day or not

  WorldTime({this.location, this.flag, this.url}); //location url for API Endpoint


  Future<void> getTime() async {

    //make the request
    try{
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      print(response.body);
      //get properties from data
      String datetime=data['datetime'];
      String offsetHR=data['utc_offset'].substring(1,3);
      String offsetMin=data['utc_offset'].substring(4);

      //create a DateTime object
      DateTime now=DateTime.parse(datetime);
      print(response.body);
      now=now.add(Duration(hours: int.parse(offsetHR),minutes: int.parse(offsetMin)));

      //set Time using intl package
      isDayTime=now.hour>6 && now.hour<19 ? true:false;
      time=DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error : $e');
      time="could not get time data";
    }

  }

}
