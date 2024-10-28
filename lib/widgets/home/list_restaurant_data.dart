import 'package:app_brm_01/modules/home/entities/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ListRestaurantData extends StatelessWidget {
  const ListRestaurantData({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        restaurant.images.isNotEmpty
            ? Image.network(
                restaurant.images[0],
                width: 70,
                height: 70,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              )
            : const Icon(Icons.image_not_supported),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(restaurant.description),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StarRating(
              rating: restaurant.rating / restaurant.count,
              starCount: 5,
              size: 12,
              color: Colors.amber,
              borderColor: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}