
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget statistics() {
    return Row(
      children: [
        Expanded(
          child: statCard(
            "42",
            "Boxes",
            Icons.inventory_2_outlined,
            Colors.deepPurple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: statCard(
            "215",
            "Items",
            Icons.widgets_outlined,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget statCard(String value, String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(title),
        ],
      ),
    );
  }
