import 'package:flutter/material.dart';

class ClientReviewCard extends StatelessWidget {
  final double rating;
  final String reviewText;
  final String clientName;
  final String clientImageUrl;

  const ClientReviewCard({
    Key? key,
    required this.rating,
    required this.reviewText,
    required this.clientName,
    required this.clientImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating stars
            Row(
              children: List.generate(5, (index) {
                if (index < rating.floor()) {
                  return const Icon(Icons.star, color: Colors.amber, size: 20);
                } else if (index < rating) {
                  return const Icon(Icons.star_half, color: Colors.amber, size: 20);
                } else {
                  return const Icon(Icons.star_border, color: Colors.amber, size: 20);
                }
              }),
            ),
            const SizedBox(height: 8),

            // Review text
            Text(
              reviewText,
              style: TextStyle(),
            ),
            const SizedBox(height: 12),

            // Client image and name
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(clientImageUrl),
                ),
                const SizedBox(width: 12),
                Text(
                  clientName,
                  style: TextStyle()
                ),
              ],
            ),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
