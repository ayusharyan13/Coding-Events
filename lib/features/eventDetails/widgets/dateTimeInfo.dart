import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class DateTimeInfo extends StatelessWidget {
  final String date_time;


  const DateTimeInfo ({
    Key? key,
    required this.date_time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // Parse the string into a DateTime object
      DateTime parsedDateTime = DateTime.parse(date_time);


      String date = '${parsedDateTime.year}-${parsedDateTime.month.toString().padLeft(2, '0')}-${parsedDateTime.day.toString().padLeft(2, '0')}';
      String time = '${parsedDateTime.hour.toString().padLeft(2, '0')}:${parsedDateTime.minute.toString().padLeft(2, '0')}:${parsedDateTime.second.toString().padLeft(2, '0')}';

      String timeWithOffset =
          '${parsedDateTime.hour.toString().padLeft(2, '0')}:${parsedDateTime.minute.toString().padLeft(2, '0')}:${parsedDateTime.second.toString().padLeft(2, '0')}${parsedDateTime.timeZoneOffset}';


      String getDayOfWeek(int day) {
        switch (day) {
          case 1:
            return 'Monday';
          case 2:
            return 'Tuesday';
          case 3:
            return 'Wednesday';
          case 4:
            return 'Thursday';
          case 5:
            return 'Friday';
          case 6:
            return 'Saturday';
          case 7:
            return 'Sunday';
          default:
            return '';
        }
      }
      String dayOfWeek = getDayOfWeek(parsedDateTime.weekday);


    return Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.calendar_month_sharp,
                size: 44,
                color: GlobalVariables.secondaryColor,
              ),
            ),
          ),
           const SizedBox(width: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.primaryColor,
              )),

              const SizedBox(height: 12),

               Row(

                 children: [
                   Text("$dayOfWeek $timeWithOffset", style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: GlobalVariables.greTextColor,
              )),
                 ],
               ),
            ],
          )
        ]
    );
  }
}