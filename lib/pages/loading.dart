// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'models/get_data_model.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    // class بيستخدم لاستدعاء ال
    allCountries oneCountry = allCountries();
    // علشان اقدر استدعيه بشكل ده واقدر استخدمه oneCountry في class بروح اخزن ال class بعد ما استدعيت البيانات من ال
    await oneCountry.getData();
    // وابعت معاك البيانات اللي مكتوبه فيه دي homePage بقول له بعد ما تحصل علي البيانات روح لصفحه
    Navigator.pushReplacementNamed(context, '/homePage', arguments: {
      'time': oneCountry.timeNow,
      'location': oneCountry.timeZone,
      'isDayTime': oneCountry.isDayTime
    });
  }

// يتم تفعيل هذا المثود كل مره بيتم فتح فيه التطبيق تلقائي
  @override
  void initState() {
    super.initState();
    // روح افتح الصفحه الرئسيه واعرض البيانات التي تم الحصول عليه api هنا بقول له بعد استلام البيانات من
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWaveSpinner(
              duration: Duration(seconds: 5),
              waveColor: Colors.redAccent,
              trackColor: Colors.amber,
              color: Colors.black38,
              size: 125.0,
            ),
            SizedBox(height: 16),
            Text(
              "...جاري التحميل",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
