import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    // 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon139&appid=$apiKey'));
    // 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon$longitude&appid=$apiKey'));
    // 'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&exclude={part}&appid=$apiKey'));
    // 'https://api.openweathermap.org/data/2.5/weather?q=Seoul,kr&APPID=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
