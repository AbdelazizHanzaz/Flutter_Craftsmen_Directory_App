


import 'package:flutter/material.dart';

class FilterHeaderWidget extends StatelessWidget {
  final String title;
  const FilterHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  // Header 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900]
                ),
              ),
              TextButton(
                
                child: Text('View all', style: TextStyle(color: Colors.teal[100]),),
                onPressed: () {
                  // Navigate to view all categories
                },
              )
            ],
          ),
        );

  }
}