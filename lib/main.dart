import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      home: ChangeNotifierProvider(
        create: (_) => CarProvider(),
        child: CarListScreen(),
      ),
    );
  }
}

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Coches'),
      ),
      body: carProvider.loading
          ? Center(child: CircularProgressIndicator()) // Indicador de carga
          : ListView.builder(
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];
                return ListTile(
                  title: Text(car.make), // Nombre de la marca
                  subtitle: Text(car.model), // Modelo del coche
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            carProvider.fetchCars(), // Botón para cargar los coches
        child: Icon(Icons.refresh),
      ),
    );
  }
}
