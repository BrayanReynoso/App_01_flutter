import 'package:app_brm_01/modules/home/entities/restaurants.dart';
import 'package:app_brm_01/modules/home/restaurant_details.dart';
import 'package:app_brm_01/widgets/home/list_restaurant_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//AIzaSyACBx0cfvInzNy7RmaiEaP8L_pN1rEdgxs 

//AIzaSyBVNt30TteZTnBYaIB8dJ68ntjW9W0rX_w
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  List<Restaurant> restaurants = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    db.collection("restaurants").snapshots().listen((event) {
      restaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()["name"],
          doc.data()["description"],
          List<String>.from(doc.data()["images"]),
          doc.data()["rating"],
          doc.data()["count"],
          doc.data()['longitude'],
          doc.data()['latitude'],

         
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetails(
                    name: restaurants[index].name,
                    rating: restaurants[index].rating,
                    images: restaurants[index].images,
                    description: restaurants[index].description,
                    latitude: restaurants[index].latitude,
                    longitude: restaurants[index].longitude,
                    
                  ),
                ),
              );
            },
            child: ListRestaurantData(restaurant: restaurants[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.amber,
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: const Icon(Icons.home),
      ),
    );
  }
}
