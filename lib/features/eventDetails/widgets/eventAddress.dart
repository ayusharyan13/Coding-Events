import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class EventAddress extends StatelessWidget {
  final String venue_name;
  final String venue_city;
  final String venue_country;

  const EventAddress({
    Key? key,
    required this.venue_name,
    required this.venue_city,
    required this.venue_country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              height: 54,
              width: 54,
              child: Icon(
                Icons.location_on_rounded,
                size: 30,
                color: GlobalVariables.secondaryColor
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(venue_name, style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.primaryColor,
              )),

              const SizedBox(width: 30,height:5),

              Text("$venue_city,$venue_country", style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.greTextColor,
              )),
            ],
          )
        ]
    );
  }
}