import 'package:http/http.dart';
import 'dart:convert';

class worker{
  late String location;

  //Constructor
  worker({required this.location})
  {
    location = location;
  }

  late String temperature;
  late String humidity;
  late String description;
  late String airSpeed;
  late String icon;
  late String date1;

  //late String main;
  //

  Future<void> getData() async{
    print("Location in Worker $location");
    try{
      Response response = await get(
        //"https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4f1d03903cf646d86a600456788f4f27"
          Uri.parse(
              "https://api.weatherapi.com/v1/forecast"
                  ".json?key=8c9b67ef8b7d4d4286d73524222011&q=$location&days=7"
          ));
      Map data = jsonDecode(response.body);

      //Getting Current Temperature, Humidity
      Map currentData = data['current'];
      temperature = currentData['temp_c'].toString();
      humidity = currentData['humidity'].toString();

      //Getting Description and Icon
      Map condition = currentData['condition'] as Map;
      description = condition['text'].toString();
      icon =  condition['icon'].toString();

      //Getting Air Speed
      airSpeed = currentData ['wind_kph'].toString();

      //Forcast Data
      Map forecast = data['forecast'] as Map;
      List forecastDay = forecast['forecastday'] as List;
      Map day1 = forecastDay[0];
      date1 = day1['date'];



      //airSpeed = "NA";
      //main = "NA";
      //icon = "09d";

      //Getting Air Speed
      /*Map windData = data['wind'];
      //double getAirSpeed = windData['speed']/.27777777777778; // m/s to km./h

      //Getting Weather Description and Icon
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getDescription = weatherMainData['description'];
      String getMain = weatherMainData['main'];
      String getIcon = weatherMainData['icon'].toString();*/


      //Assigning Values
      //temperature = getTemperature.toStringAsFixed(1);
      //temperatureF = getTemperatureF.toStringAsFixed(2);
      //humidity = getHumidity.toString();
      //airSpeed = getAirSpeed.toStringAsFixed(1);
      //description = getDescription;
      //main = getMain;
      //icon = getIcon;
    }catch(e) {
      temperature = "NA";
      humidity = "NA";
      airSpeed ="NA";
      description = "Can not Find Data";
      date1 = "Can not Find Data";
      icon = "09d";
    }

  }
}

