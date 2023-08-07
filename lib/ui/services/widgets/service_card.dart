import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {

  final String serviceName;
  final String imageIndex;
  const ServiceCard({super.key, required this.serviceName, required this.imageIndex});


  // Fields for service name and image

  @override
  Widget build(BuildContext context) {
  
    return Card(
      //shape: const BorderDirectional(bottom: BorderSide(color: Colors.teal, width: 3)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
          
            // Service image
            Image.asset(
              "assets/images/services/$imageIndex.png",
              height: 50,
              width: 50,
            ),
            
            // Service name text
            Positioned(
              top:0,
              child: Text(
                serviceName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ) 
            ),
           

          ],
        ),
      ),
    );

  }

}