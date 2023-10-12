import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(146, 12, 16, 49),
        title: const Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    "Egypt - Cairo",
                    style: TextStyle(fontSize: 22),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/egypt.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
