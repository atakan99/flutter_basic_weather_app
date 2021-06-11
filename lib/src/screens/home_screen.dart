
import 'package:flutter_basic_weather_app/src/models/models.dart';
import 'package:flutter_basic_weather_app/widgets/change_theme_button_widget.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_weather_app/src/API/data_service.dart';
import 'package:flutter_basic_weather_app/src/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget{

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse? _response = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            if (_response != null)
              Column(
                children: [
                  Image.network((_response?.iconUrl).toString()),
                  Text(
                    '${_response?.tempInfo.temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text((_response?.weatherInfo.description).toString())
                ],
              ),
            Padding(padding: EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: 150,
              child: TextField(controller: _cityTextController,
              decoration: InputDecoration(labelText: 'City Name'),
              textAlign: TextAlign.center,
              ),
            ),
            ),
            ElevatedButton(onPressed: _search, child: Text('Search'))
          ],
        ),
      ),
    );
  }

    void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}

 

