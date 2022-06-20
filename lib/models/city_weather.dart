class WeatherLocation {
  final String city;
  final String dateTime;
  final String temperature;
  final String iconCode;
  final String weatherType;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.iconCode,
    required this.weatherType,
    required this.wind,
    required this.rain,
    required this.humidity,
  });

  WeatherLocation.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        dateTime = json['dateTime'],
        temperature = json['temperature'],
        iconCode = json['iconCode'],
        weatherType = json['weatherType'],
        wind = json['wind'],
        rain = json['rain'],
        humidity = json['humidity'];
  //a method that convert object to json
  Map<String, dynamic> toJson() => {
        'city': city,
        'dateTime': dateTime,
        'temperature': temperature,
        'iconCode': iconCode,
        'weatherType': weatherType,
        'wind': wind,
        'rain': rain,
        'humidity': humidity
      };
}

final locationList = [
  WeatherLocation(
    city: 'Kolkata',
    dateTime: '07:50 PM — Monday, 9 Nov 2020',
    temperature: '24\u2103',
    weatherType: 'Night',
    iconCode: 'assets/moon.svg',
    wind: 10,
    rain: 2,
    humidity: 10,
  ),
  WeatherLocation(
    city: 'London',
    dateTime: '02:20 PM — Monday, 9 Nov 2020',
    temperature: '15\u2103',
    weatherType: 'Cloudy',
    iconCode: 'assets/cloudy.svg',
    wind: 8,
    rain: 7,
    humidity: 82,
  ),
  WeatherLocation(
    city: 'New York',
    dateTime: '09:20 AM — Monday, 9 Nov 2020',
    temperature: '17\u2103',
    weatherType: 'Sunny',
    iconCode: 'assets/sun.svg',
    wind: 5,
    rain: 15,
    humidity: 61,
  ),
  WeatherLocation(
    city: 'Sydney',
    dateTime: '01:20 AM — Tuesday, 10 Nov 2020',
    temperature: '10\u2103',
    weatherType: 'Rainy',
    iconCode: 'assets/rain.svg',
    wind: 20,
    rain: 70,
    humidity: 91,
  ),
];

// var cityListO = ['Kolkata', 'London', 'New York', 'Sydney'];
