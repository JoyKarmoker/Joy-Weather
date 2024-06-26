import 'package:flutter/material.dart';
import 'package:joy_weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Rajshahi";
  late String temperature;
  late String temperatureF;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String latitude;
  late String longitude;
  late String icon;
  late String date1;

  void startApp(String city) async
  {
    worker instance =  worker(location: city);
    await instance.getData();
    temperature = instance.temperature;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    description = instance.description;
    date1 = instance.date1;
    //main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), (){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temperatureValue" : temperature,
        "humidityValue" : humidity,
        "airSpeedValue" : airSpeed,
        "descriptionValue" : description,
        "date1Value" : date1,
        //"mainValue" : main,
        "iconValue" : icon,
        "cityValue" : city
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)?.settings.arguments != null)
    {
      Map info = ModalRoute.of(context)?.settings.arguments as Map;
      city = info['searchText'];
    }

    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: 150),
            Image.asset("assets/images/wlogo.png"),
            const Text('Joy Weather',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                )),
            const SizedBox(height: 10),
            const Text('Made with ❤ by JOY',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white
            )),
            const SizedBox(height: 50),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
