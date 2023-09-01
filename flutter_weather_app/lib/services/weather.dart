import 'package:flutter_weather_app/services/location.dart';
import 'network.dart';
const apiKey = 'Your Api Key';
const domain = 'api.openweathermap.org';
const unEn = '/data/2.5/weather';


class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Map<String, dynamic>? param = {'q': cityName,'appId' : apiKey, 'units' : "metric"};

    var url=  Uri.https(domain,unEn,param);
    NetworkHelper networkHelper = NetworkHelper(
        url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    GetLocation location = GetLocation();
    await location.getCurrentLocation();

    Map<String, dynamic>? param = {'lat': '${location.latitude}','lon': '${location.longitude}','appId' : apiKey, 'units' : "metric"};

    var url=  Uri.https(domain,unEn,param);
    NetworkHelper networkHelper = NetworkHelper(
        url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'thunder';
    } else if (condition < 400) {
      return 'drizzle';
    } else if (condition == 500) {
      return 'rain';
    } else if (condition < 600) {
      return 'heavy_rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'fog';
    } else if (condition == 800) {
      return 'sun';
    } else if (condition <= 804) {
      return 'cloud';
    } else {
      return 'thermometer';
    }
  }
}
