import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // api بعد الاستلام من Loading من الشاشة السابقة اللي هستقبلها من DATA استقبال الـ
    Map receivedData = ModalRoute.of(context)!.settings.arguments as Map;
//  {    'time': timeNow, 'location': timeZone, 'isDayTime': false }
    String bgimg = receivedData['isDayTime'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage("assets/$bgimg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
              },
              icon: const Icon(
                Icons.edit_location,
                color: Color.fromARGB(255, 255, 129, 129),
                size: 24.0,
              ),
              label: const Text(
                "Edit location",
                style: TextStyle(fontSize: 19),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(146, 90, 103, 223)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 33),
              color: const Color.fromARGB(111, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    receivedData['time'],
                    style: const TextStyle(fontSize: 55, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    receivedData['location'],
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
