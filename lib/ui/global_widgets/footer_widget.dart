import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF3A4B5C),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Custom Print Store',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          // Social Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 20),
              SizedBox(width: 16),
              FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 20),
              SizedBox(width: 16),
              FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 20),
              SizedBox(width: 16),
              FaIcon(FontAwesomeIcons.facebook, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Get in Touch with Us for the Best\nQuality Custom Prints & Supplies.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Qui dolore ipsum quia dolor sit amet, consec\n'
            'tetur adipisci velit, sed quia non numquam eius\n'
            'modi tempora incidunt lores ta porro ame.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 30),
          const Text(
            'Quick Links',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Important Links',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white30),
          const SizedBox(height: 10),
          const Text(
            'Copyright © 2025 | ecomsupport360 Demo Store',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          const Text(
            'Powered By ecomsupport360 Demo Store',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
