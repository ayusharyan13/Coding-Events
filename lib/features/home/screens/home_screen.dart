import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../../../model/EventsModel.dart';
import '../../../services/eventServices.dart';
import '../../eventDetails/screens/eventDescription.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  bool isSearchFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    EventServices eventServices = EventServices();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left:8.0, top: 15),
            child: Text(
              'Events',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.blue),
              onPressed: () {
                setState(() {
                  isSearchFieldVisible = !isSearchFieldVisible;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: GlobalVariables.primaryColor),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          Visibility(
            visible: isSearchFieldVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Type Event Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),


          Expanded(
            child: FutureBuilder<EventsModel>(
              future: eventServices.fetchAllEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.content == null || snapshot.data!.content!.data == null) {
                  return const Center(child: Text("No Events Found"));
                } else {
                  List<Data>? events = snapshot.data!.content!.data;
                  return ListView.builder(
                    itemCount: events!.length,
                    itemBuilder: (context, index) {
                      Data event = events[index];

                      if (searchController.text.isEmpty ||
                          event.venueCountry!.toLowerCase().contains(searchController.text.toLowerCase())) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => eventDescription(
                                  title: event.title ?? '',
                                  bannerImage: event.bannerImage ?? '',
                                  description: event.description ?? '',
                                  organiser_icon: event.organiserIcon ?? '',
                                  organiser_name: event.organiserName ?? '',
                                  date_time: event.dateTime ?? '',
                                  venue_name: event.venueName ?? '',
                                  venue_city: event.venueCity ?? '',
                                  venue_country: event.venueCountry ?? '',
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:17.0),
                            child: ListTile(
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(event.dateTime!, style: const TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.w400,
                                          color: GlobalVariables.secondaryColor,
                              )
                                      ),
                                    ],
                                  ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(event.title ?? '', style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500,
                                    color: GlobalVariables.primaryColor,
                                  )),
                                ],
                              ),

                              const SizedBox(height: 11),
                                ]
                              ),



                              subtitle:  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      size: 14,
                                      color: Color.fromRGBO(176, 177, 188, 1),
                                    ),
                                    const SizedBox(width: 1),

                                    Text(event.venueName!,
                                        style: const TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.w400,
                                          color: GlobalVariables.greTextColor,
                                        )),

                                    const Text(' •',style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w400,
                                      color: GlobalVariables.greTextColor,
                                    )),

                                    Text(event.venueCity ?? '',style: const TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w400,
                                      color: GlobalVariables.greTextColor,
                                    )),
                                    const Text(' ,',style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w400,
                                      color: GlobalVariables.greTextColor,
                                    )),

                                    Text(event.venueCountry ?? '',style: const TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w400,
                                      color: GlobalVariables.greTextColor,
                                    )),
                                    // event.venueCity, + ''+ event.venueCountry,
                                  ],
                                ),
                              ),


                              leading: Image.network(
                                event.bannerImage ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

