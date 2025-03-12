import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeController {
  static const String apiUrl = 'https://api.sampleapis.com/jokes/goodJokes';

  Future<String> fetchJoke() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      print('API Response: ${response.body}'); // Agrega una línea de depuración

      if (response.statusCode == 200) {
        List<dynamic> jokes = json.decode(response.body);
        if (jokes.isNotEmpty) {
          // Muestra el primer chiste de la lista
          return jokes[0]['setup'] + " - " + jokes[0]['punchline'];
        } else {
          return "No joke available!";
        }
      } else {
        throw Exception('Failed to load joke');
      }
    } catch (e) {
      return "Error fetching joke: $e";
    }
  }
}
