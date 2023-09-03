import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }



  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

  if(mounted){

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        locationWeather: weatherData,
      );
    }));
  }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 25.0,
        ),
      ),
    );
  }
}
