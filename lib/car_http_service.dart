import 'car_model.dart'; // o 'package:tu_nombre_de_paquete/car_model.dart' si el archivo está en un subdirectorio
import 'package:http/http.dart' as http;

class CarHttpService {
  final String _serverUrl = "https://car-data.p.rapidapi.com";
  final String _headerKey =
      "e2fd5ca622msh805bd9bbf199e46p118448jsn77ab4c5c79f3";
  final String _headerHost = "car-data.p.rapidapi.com";

  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse("$_serverUrl/cars");
    var response = await http.get(uri, headers: {
      "x-rapidapi-key": _headerKey,
      "x-rapidapi-host": _headerHost,
    });

    if (response.statusCode == 200) {
      return carsModelFromJson(response.body);
    } else {
      throw ("Error al obtener la lista de coches: ${response.statusCode}");
    }
  }
}
