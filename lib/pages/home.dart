import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {


    //fetch data from route arguements
    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;



    //setBackground
    //String bgImage= data['isDayTime']? 'day.png':'night.png';
   // Color bgColor=data['isDayTime']? Colors.blue:Colors.indigo[700];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          decoration:BoxDecoration(
            image: DecorationImage(
                  image: AssetImage('assets/night.png'),
                  fit: BoxFit.cover,
            ),
          ) ,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    //consider the pushed and the popped as one big async task
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    if(result!=null) {
                      setState(() {
                        print(result);
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],
                        };
                        print(data);
                      });
                    }
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
