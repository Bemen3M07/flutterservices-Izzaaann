import 'package:flutter/material.dart';
import 'package:jokes_app/controllers/joke_controller.dart'; // Asegúrate de que la importación sea correcta

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  late JokeController _jokeController;
  String _joke = 'Press the button to get a joke!';

  @override
  void initState() {
    super.initState();
    _jokeController = JokeController();
  }

  void _fetchJoke() async {
    String newJoke = await _jokeController.fetchJoke();
    setState(() {
      _joke = newJoke; // Actualiza el estado con el nuevo chiste
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra el chiste actual
            Text(
              _joke,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Botón para obtener un nuevo chiste
            ElevatedButton(
              onPressed:
                  _fetchJoke, // Llama a _fetchJoke cada vez que presionas el botón
              child: Text('Get New Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
