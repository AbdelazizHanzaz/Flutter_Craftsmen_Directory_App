
import 'package:craftsmen_directory_app/ui/services/widgets/list_services.dart';
import 'package:craftsmen_directory_app/ui/shared_widgets/map_widget.dart';
import 'package:flutter/material.dart';

import '../../../data/models/craftsmen.dart';
import 'online_indictor.dart';

class CraftsmanCard extends StatelessWidget {

  // Craftsman data 
  final Craftsman? craftsman;

  const CraftsmanCard({super.key, required this.craftsman});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: [
        
          // Header
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
              
                 Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                  //backgroundImage: NetworkImage(craftsman.imageUrl),
                  //child: Icon(Icons.account_circle, color: Colors.blueGrey,),
                  child: Image.asset("assets/images/services/1.png"),
                ),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: CraftsmanOnlineIndicator(isOnline: true,))
                  ],
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Abdelaziz Hanzaz", style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900]
                )
                ),

                      // const Row(
                      //   children: [
                      //     Icon(Icons.location_on, size: 14),
                      //     SizedBox(width: 4),
                      //     Text("Home, Freelance")
                      //   ],
                      // )
                      const Text("Plumber")
                    ],
                  ),
                ),


                const Text("5\$/D")
              ],
            ),
          ),
          const Divider(),
          // Content
          //const ListServicesWidget(),
          //IntrinsicWidth(child: Image.asset("assets/images/map.png", fit: BoxFit.cover,)),
          const SizedBox(
            height: 200,
            child: MapWidget(),
          ),
          // Actions
          Row(
            children: [
              Expanded(child: IconButton(
                  icon: const Icon(Icons.favorite_border_outlined, color: Colors.teal,),
                  onPressed: () {
                    // Save favorite
                  },
                )),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.message_outlined, color: Colors.teal,), 
                  onPressed: () {}
                ),  
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.teal),
                  onPressed: () {}
                ) 
              ),
            ],
          )

        ],
      ),
    );
  }

}