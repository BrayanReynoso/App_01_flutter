import 'package:app_brm_01/modules/home/entities/restaurants.dart';
import 'package:app_brm_01/widgets/home/list_restaurant_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  List<Restaurant> restaurants = [];
  bool loading = true; // Cambiamos a true porque estamos cargando los datos

  @override
  initState() {
    super.initState();
    //loadRestaurants();
    db.collection("restaurants").snapshots().listen((event) {
      restaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()["name"],
          doc.data()["description"],
          List<String>.from(doc.data()["images"]),
          doc.data()["rating"],
          doc.data()["count"],
        );
        restaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

/*   Future<void> loadRestaurants() async {
    try {
      final event = await db.collection('restaurants').get();
      final List<Restaurant> loadedRestaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()["name"],
          doc.data()["description"],
          List<String>.from(doc.data()["images"]),
          doc.data()["rating"],
          doc.data()["count"],
        );
        loadedRestaurants.add(restaurant);
      }
      setState(() {
        restaurants = loadedRestaurants;
        loading = false; // Cuando termine de cargar, cambiar a false
      });
    } catch (e) {
      print("Error al cargar los restaurantes: $e");
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  } */

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: restaurants.length,
          itemBuilder: (BuildContext context, int index) {
            return ListRestaurantData(restaurant: restaurants[index]);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.amber,
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: const Icon(Icons.home),
      ),
    );
  }
}