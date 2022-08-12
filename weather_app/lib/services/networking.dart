import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  String url;
  NetworkHelper({required this.url});


  Future getData() async {
    http.Response response = await http.get(Uri.parse(url),);
    if (response.statusCode == 200){
      var data = response.body;
      return  jsonDecode(data);
    }
    else{
      return response.statusCode;
    }

  }
}