import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:profile/model/model.dart';

class ProfileRepository {
  Future<Profile> loadProfile() async {
    final String response =
        await rootBundle.loadString('assets/data/datafile.json');
    final data = json.decode(response);
    return Profile.fromJson(data);
  }
}
