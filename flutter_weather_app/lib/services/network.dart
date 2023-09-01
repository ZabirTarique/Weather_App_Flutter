import 'package:http/http.dart' as http;
import 'dart:convert';
//const apiKey = 'b711735f805945fd3737d3cb940bc035';
class NetworkHelper {
  NetworkHelper(this.url,);
  Uri url;

  Future getData() async {

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
