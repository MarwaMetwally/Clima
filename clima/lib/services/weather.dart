import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIKey = '2a98b506db10dd234c6c4073a198aa6f';

class WeatherModel {
  Future<dynamic> getcityweather(String name) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$APIKey&units=metric';

    NetworkHelper nh = NetworkHelper(url);
    var weatherdata = await nh.getdata();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getcurrentLocation();

    NetworkHelper nh = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.lat}&lon=${loc.long}&appid=$APIKey&units=metric');
    var weatherData = await nh.getdata();
    return weatherData;
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
