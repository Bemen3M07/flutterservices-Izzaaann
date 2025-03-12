import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'car_model.dart'; // o 'package:tu_nombre_de_paquete/car_model.dart' si el archivo está en un subdirectorio

class CarProvider with ChangeNotifier {
  List<CarsModel> _cars = [];
  bool _loading = false;

  List<CarsModel> get cars => _cars;
  bool get loading => _loading;

  final String url = 'https://car-data.p.rapidapi.com/cars?limit=10&page=0';
  final Map<String, String> headers = {
    'X-RapidAPI-Key':
        'e2fd5ca622msh805bd9bbf199e46p118448jsn77ab4c5c79f3', // Reemplaza con tu propia API key
    'X-RapidAPI-Host': 'car-data.p.rapidapi.com',
  };

  // Método para obtener los coches desde la API
  Future<void> fetchCars() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _cars = data
            .map((carJson) => CarsModel.fromMapToCarObject(carJson))
            .toList();
      } else {
        throw Exception('Failed to load cars');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
