import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class EventInfo extends StatelessWidget {
  final String organiser_icon;
  final String organiser_name;

  const EventInfo({
    Key? key,
    required this.organiser_icon,
    required this.organiser_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: SizedBox(
              height: 54,
              width: 54,
              child: Image.network(
                organiser_icon,
                height: 54,
                width: 54,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(organiser_name, style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.primaryColor,
              )),

              const SizedBox(height: 3),

              const Text("Organizer", style: TextStyle(
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