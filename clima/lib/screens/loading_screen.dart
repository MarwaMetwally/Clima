import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    getLocationData();

    super.initState();
  }

  void getLocationData() async {
    var weatherData = await weather.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.grey,
        size: 60,
      )),
    );
  }
}
