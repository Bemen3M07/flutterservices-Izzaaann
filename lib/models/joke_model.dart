import 'dart:convert';

// Modelo para un chiste
class Joke {
  final String type;
  final String setup;
  final String punchline;

  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
  });

  // Crear un chiste a partir de un mapa (JSON)
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }

  // Convertir un objeto Joke a formato JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'setup': setup,
      'punchline': punchline,
    };
  }
}
