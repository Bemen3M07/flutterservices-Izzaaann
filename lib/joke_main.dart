import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JokeScreen(),
    );
  }
}

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<dynamic> jokes = [];
  String currentJoke = '';

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  // Función para obtener los chistes de la API
  Future<void> fetchJokes() async {
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/jokes/ten'));

    if (response.statusCode == 200) {
      setState(() {
        jokes = json.decode(response.body);
        currentJoke = jokes[Random().nextInt(jokes.length)]['setup'] +
            " - " +
            jokes[Random().nextInt(jokes.length)]['punchline'];
      });
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  // Función para mostrar un chiste aleatorio
  void getRandomJoke() {
    setState(() {
      currentJoke = jokes[Random().nextInt(jokes.length)]['setup'] +
          " - " +
          jokes[Random().nextInt(jokes.length)]['punchline'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: Center(
        child: jokes.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentJoke,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getRandomJoke,
                    child: Text("Get Random Joke"),
                  ),
                ],
              ),
      ),
    );
  }
}
