
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherModel {

  Future<dynamic> getLocationData() async {
    String url = "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1";
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
    NetworkHelper networkHelper = NetworkHelper(url:url );
    var data = await networkHelper.getData();
    return data;

  }

  Future<dynamic> getCityData(String city) async {
    String url = "https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=b1b15e88fa797225412429c1c50c122a1";
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(url:url );
    var data = await networkHelper.getData();
    return data;

  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
