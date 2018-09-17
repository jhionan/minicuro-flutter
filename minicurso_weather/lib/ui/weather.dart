import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minicurso_weather/utils/utils.dart';
import 'citySelector.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WeatherState();
  }
}

class _WeatherState extends State<Weather> {
  String _city = defautCity;
  @override
  Widget build(BuildContext context) {
   
   

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WeatherApp'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              _navigateToNextScreen();
            },
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'lib/images/cold.jpeg',
              width: 900.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: new Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _city.replaceAll('+', ' ')??defautCity,
                    style: cityStyle(),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: new FittedBox(
              child: updateTempWidget(_city),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

 Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              child: new Column(children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                        'Temperatura: \n' +
                            content['main']['temp']
                                .toString()
                                .replaceAll('.', ',') +
                            ' ºC',
                        style: cityStyle()),
                  ),
                  elevation: 4.0,
                  color: Colors.white.withAlpha(60),
                )
              ]),
            );
          } else {
            return new CircularProgressIndicator();
          }
        });
  }

  Future _navigateToNextScreen() async {
   
   Map result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CitySelector();
    }));

    if (result!=null && result.containsKey('city') && result['city'].toString().isNotEmpty) {
      var mCity = result['city'] as String;
      _city = mCity.replaceAll(' ', '+');
      
    }
  }
}
