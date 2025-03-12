import 'dart:convert';

// Función para obtener una lista de objetos de tipo CarsModel a partir de un string JSON
List<CarsModel> carsModelFromJson(String str) => List<CarsModel>.from(
    json.decode(str).map((x) => CarsModel.fromMapToCarObject(x)));

// Función para convertir una lista de objetos CarsModel a un string JSON
String carsModelToJson(List<CarsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.fromObjectToMap())));

class CarsModel {
  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  // Constructor que convierte un mapa JSON en un objeto CarsModel
  factory CarsModel.fromMapToCarObject(Map<String, dynamic> json) => CarsModel(
        id: json["id"],
        year: json["year"],
        make: json["make"],
        model: json["model"],
        type: json["type"],
      );

  // Método para convertir un objeto CarsModel a un mapa de objetos
  Map<String, dynamic> fromObjectToMap() => {
        "id": id,
        "year": year,
        "make": make,
        "model": model,
        "type": type,
      };
}
