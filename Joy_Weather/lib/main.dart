import 'package:flutter/material.dart';
import 'package:joy_weather/Activity/home.dart';
import 'package:joy_weather/Activity/location.dart';
import 'package:joy_weather/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => const Loading(),
      "/home": (context) => const Home(),
      "/loading": (context) => const Loading()
    },
  ));
}
