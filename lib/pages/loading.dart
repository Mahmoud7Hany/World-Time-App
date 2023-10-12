import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getData() async {
    // api الحصول علي البيانات من
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
    // Map الي json لتحويل الوقت من
    Map receivedData = jsonDecode(response.body);
    // للوقت علشان اقدر اتعمل معه DateTime و int الي string بعد التحويل فعوز احوله لي وقت بدل من Map عباره عن api لتحويل الوقت من نص الي وقت ليه لان البيانات بتجي من
    // ملحوظه هو موجود بالتوقيت العالمي نقص 3 ساعات
    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
    // print(datetime);

    int offset = int.parse(receivedData['utc_offset'].substring(0, 3));
    // print(offset);

    DateTime realTime = datetime.add(Duration(hours: offset));
    // print(realTime);

    // علشان احول الوقت لساعه طبعيه وعلشان يكون سهل عليا اعرض الوقت في الابلكيشن بتاعيintl الي هيا DateFormat بنستخدم المكتبه
    print(DateFormat('h:mm a').format(realTime));

    //  لعرض مكان التوقيت مثلا الساعه كام في القاهره [يظهر اسم المنطقه]
    print(receivedData['timezone']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                getData();
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
            // SpinKitWaveSpinner(
            //   duration: Duration(seconds: 5),
            //   waveColor: Colors.redAccent,
            //   trackColor: Colors.amber,
            //   color: Colors.black38,
            //   size: 125.0,
            // ),
            // SizedBox(height: 16),
            // Text(
            //   "...جاري التحميل",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 22,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
