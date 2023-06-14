import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/model/data_model.dart';

Future<ResumeDataResponse> loadadress() async {
  String jsonAddress = await rootBundle.loadString('assets/json/data.json');
  final jsonResponse = json.decode(jsonAddress);
  ResumeDataResponse address = ResumeDataResponse.fromJson(jsonResponse);

  return address;
}

final resumeDataProvider = FutureProvider<ResumeDataResponse>((ref) async {
  final data = await loadadress();
  return data;
});
