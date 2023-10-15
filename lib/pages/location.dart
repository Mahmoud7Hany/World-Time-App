// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'models/get_data_model.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
// ListTile دي البيانات اللي هتتعرض لما اجي اختار توقيت اي بلد لما اضغط عليه
  List<AllCountries> allCountries = [
    AllCountries(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    AllCountries(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    AllCountries(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        countryName: 'Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // AppBar بيلغي زر الرجوع في automaticallyImplyLeading
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(146, 12, 16, 49),
        title: const Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: allCountries.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () async {
                // class بيستخدم لاستدعاء ال
                AllCountries clickedCountry = allCountries[index];
                // علشان اقدر استدعيه بشكل ده واقدر استخدمه clickedCountry في class بروح اخزن ال class بعد ما استدعيت البيانات من ال
                await clickedCountry.getData();
                Navigator.pop(context, {
                  'time': allCountries[index].timeNow,
                  'location': allCountries[index].timeZone,
                  'isDayTime': allCountries[index].isDayTime
                });
              },
              title: Text(
                allCountries[index].countryName,
                style: const TextStyle(fontSize: 22),
              ),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/${allCountries[index].flag}"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
