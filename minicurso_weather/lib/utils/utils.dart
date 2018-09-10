import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final appid = "dd52e898f798b31cc002a2b2e0adf0d6";
final defautCity = "Curitiba";
final url = "http://api.openweathermap.org/data/2.5/weather";
final urlParams = "&appid=dd52e898f798b31cc002a2b2e0adf0d6&units=metric&lang=pt";


String getIcon(String iconID){
return "http://openweathermap.org/img/w/$iconID.png";
}

TextStyle cityStyle() => TextStyle(color: Colors.white,
fontSize: 22.0,
fontStyle: FontStyle.italic);
//http://api.openweathermap.org/data/2.5/weather?q=Curitiba&appid=dd52e898f798b31cc002a2b2e0adf0d6&units=metric&lang=pt
//espaço separa com +

Future<Map>getWeather(String city) async {
String apiUrl = '$url?q=$city$urlParams';
http.Response response = await http.get(apiUrl);
print(apiUrl);
 var data = json.decode(response.body);
print(data);
return data;
}