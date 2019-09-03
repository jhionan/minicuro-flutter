import 'package:flutter/material.dart';

class CitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _cityController = TextEditingController();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Selecione uma Cidade'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/ocean.jpg', 
          width: 490.0,
          height: 1200.0,
          fit: BoxFit.fill,),
          new Center(
              child: Card(
                  margin: EdgeInsets.all(20.0),

            child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new TextField(
                        controller: _cityController,
                        decoration: InputDecoration(labelText: 'Digite uma cidade'),
                        keyboardType: TextInputType.text,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RaisedButton(
                           onPressed: (){
             Navigator.pop(context,{
               'city':_cityController.text
             });
                           },
            child: Text('Salvar', style: TextStyle( color: Colors.white),),
            color: Colors.red,
                        ),
                      )
                    ],
                  ),
              ),
            color: Colors.white.withAlpha(190),
          )),
        ],
      ),
    );
  }
}
