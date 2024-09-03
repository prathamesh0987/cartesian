import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AccuracyProvider with ChangeNotifier {
  double x = 0.0;
  double y = 0.0;

  bool started = false;

  double get liveXAxis => x;
  double get liveYAxis => y;

  bool get isStarted => started;

  double pulse = 0.0;
  double mm = 0.0;

  double get getPulse => pulse;
  double get getMM => mm;

  String one = "";
  String get getOne => one;

  String two = "";
  String get getTwo => two;

  fetchOneTwo() async {
    int count = 0;

    while (count != 20) {
      http.Response response =
          await http.get(Uri.parse('http://localhost:5000/callBoth'));

      // Map<String, dynamic> map = jsonDecode(response.body);
      print(jsonDecode(response.body));

      count += 1;
    }
  }

  fetchXYPosition(BuildContext context) async {
    while (context.read<AccuracyProvider>().isStarted) {
      // x = double.parse(await ModbusCommunication.read(40001, 1));
      // y = double.parse(await ModbusCommunication.read(40002, 1));
      notifyListeners();
    }
  }

  printData() async {
    bool flag = true;
    http.Response response =
        await http.get(Uri.parse('http://localhost:5000/fetch'));

    Map<String, dynamic> map = jsonDecode(response.body);
    print(map['i']);
    flag = map['status'];
    print(flag);
  }

  void changeStartedStatus(bool status) {
    started = status;
    notifyListeners();
  }

  void pulseCall() async {
    bool flag = true;
    double oldPulse = 0.0;
    while (flag) {
      http.Response response =
          await http.get(Uri.parse('http://localhost:5000/pulse'));
      Map<String, dynamic> map = jsonDecode(response.body);
      pulse = map['pulse'];
      print("$pulse $oldPulse");
      if (oldPulse != pulse) {
        oldPulse = pulse;
      } else {
        flag = false;
      }
      notifyListeners();
    }
  }

  void mmCall() async {
    bool flag = true;
    double oldMM = 0.0;
    while (flag) {
      http.Response response =
          await http.get(Uri.parse('http://localhost:5000/mm'));
      Map<String, dynamic> map = jsonDecode(response.body);
      mm = map['mm'];
      print("$mm $oldMM");
      if (oldMM != mm) {
        oldMM = mm;
      } else {
        flag = false;
      }
      notifyListeners();
    }
  }
}
