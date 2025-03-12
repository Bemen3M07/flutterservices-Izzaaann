import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_provider.dart'; // o 'package:tu_nombre_de_paquete/car_provider.dart' si el archivo está en un subdirectorio

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a la App de Coches'),
      ),
      body: carProvider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];
                return ListTile(
                  title: Text(car.make),
                  subtitle: Text(car.model),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => carProvider.fetchCars(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
