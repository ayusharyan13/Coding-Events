import 'package:eventmanagement/constants/global_variables.dart';
import 'package:flutter/material.dart';
import '../widgets/dateTimeInfo.dart';
import '../widgets/eventAddress.dart';
import '../widgets/eventinfo.dart';

class eventDescription extends StatelessWidget {

  final String title;
  final String bannerImage;
  final String description;
  final String organiser_icon;
  final String organiser_name;
  final String date_time;
  final String venue_name;
  final String venue_city;
  final String venue_country;

  const eventDescription({ Key? key,
    required this.title, required this.bannerImage, required this.description,
    required this.organiser_icon, required this.organiser_name,
    required this.date_time, required this.venue_name, required this.venue_city, required this.venue_country,   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  children: [
                    Image.network(
                      bannerImage,
                      height: 244,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 79),
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: GlobalVariables.primaryColor, size: 22,),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Text("Event Details", style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                        IconButton(
                          icon: const Icon(Icons.bookmark, color: Colors.white, size: 22,),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]
                    )
                   ]),
              const SizedBox(height:21),
               Column(
                    children: [
                      // now all the event description:

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title, style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w400,
                              color: GlobalVariables.primaryColor,
                            ))
                          ]
                      ),
                      const SizedBox(height:21),

                      EventInfo( organiser_icon:organiser_icon, organiser_name: organiser_name,),
                      const SizedBox(height: 28),
                      DateTimeInfo(date_time: date_time,),
                      const SizedBox(height: 28),
                      EventAddress(venue_name: venue_name, venue_city: venue_city, venue_country: venue_country,),
                      const SizedBox(height: 35),

                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:20.0),
                            child: Text("About event", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: GlobalVariables.primaryColor,)),
                          ),
                        ],),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                description,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: GlobalVariables.primaryColor,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                          width: 271,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: GlobalVariables.secondaryColor,
                              elevation: 4,
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ]
              )])
          ),
    );
  }
}
