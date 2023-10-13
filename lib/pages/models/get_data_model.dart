// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class allCountries {
  // بقول له هضيف القيمه بعد كده late
  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  getData() async {
    // api الحصول علي البيانات من
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
    // Map الي json لتحويل الوقت من
    Map receivedData = jsonDecode(response.body);
    // لي وقت حقيقي اقدر اتعامل معه api لتحويل الوقت الحاصل عليه من
    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
    int offset = int.parse(receivedData['utc_offset'].substring(0, 3));
    DateTime realTime = datetime.add(Duration(hours: offset));
    // print(realTime);
    //  اضافه شرط لو بالنهار يعرض صوره ولو بليل يعرض صوره تانيه
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    // اللي وقت حقيقي اقدر استخدمه api لتنسيق الوقت ولتحويل  intl الحاصل عليه من مكتبه DateFormat بيتم استخدام
    timeNow = DateFormat('h:mm a').format(realTime);

    // يكتب ص او م يعني صباح او مساءPM او AM الكود ده الاضافه شرط بدل ما يكتب
    // if (timeNow.endsWith('AM')) {
    //   timeNow = timeNow.replaceAll('AM', 'ص');
    // } else if (timeNow.endsWith('PM')) {
    //   timeNow = timeNow.replaceAll('PM', 'م');
    // }

    //  لعرض مكان التوقيت مثلا الساعه كام في القاهره [يظهر اسم المنطقه]
    timeZone = receivedData['timezone'];

    // خاص بتغير اسم البلد بالعربي بدل الانجليزي
    // if (timeZone == 'Africa/Cairo') {
    //   timeZone = 'أفريقيا/القاهرة';
    // }
  }
}
