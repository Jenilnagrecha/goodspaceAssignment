import 'dart:convert';

import 'package:goodspace/Models/inactive_products.dart';
import 'package:goodspace/Models/jobs_feed.dart';
import 'package:goodspace/Models/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserObtainedData? userInfo;
Future<String> _getToken() async {
  // Create an instance of TestApis to access the prefs variable
  TestApis testApis = TestApis();

  // Initialize prefs if it is not already initialized
  if (testApis.prefs == null) {
    testApis.prefs = await SharedPreferences.getInstance();
  }

  // Get the token from SharedPreferences
  return testApis.prefs?.getString('token') ?? "";
}

class TestApis {
  SharedPreferences? prefs;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  static const String baseUrl = 'https://api.ourgoodspace.com';

  Future<String> getOtp(String phone) async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print(phone);
    final response = await http.post(
      Uri.parse('$baseUrl/api/d2/auth/v2/login'),
      headers: {
        'Content-Type': 'application/json',
        'device-id': androidInfo.id,
        'device-type': 'android',
      },
      body: jsonEncode({
        'number': phone,
        'countryCode': '91',
      }),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      return "success";
    }
    return "success";
  }

  Future<bool> verifyOtp(String otp) async {
    prefs = await SharedPreferences.getInstance();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final response = await http.post(
      Uri.parse('$baseUrl/api/d2/auth/verifyotp'),
      headers: {
        'Content-Type': 'application/json',
        'device-id': androidInfo.id,
        'device-type': 'android',
      },
      body: jsonEncode({
        'number': '8000562095',
        'otp': otp,
        'inviteId': null,
        'utmTracking': null,
      }),
    );
    print(response.body);

    if (jsonDecode(response.body)['data']['token'] != null) {
      prefs
          ?.setString('token', jsonDecode(response.body)['data']['token'])
          .then((value) => {
                userInfo = UserObtainedData.fromJson(jsonDecode(response.body))
              });
      return true;
    }
    return false;
  }

  Future<List<JobElementData>> getJobs() async {
    String token = await _getToken();
    print(token);
    if (token == null) {
      return [];
    }
    final response = await http.get(
      Uri.parse(
        '$baseUrl/api/d2/member/dashboard/feed',
      ),
      headers: {
        'Content-Type': 'application/json',
        //'Authorization': userInfo!.data!.token!,
        'Authorization': token
      },
    );

    if (response.statusCode == 200) {
      final List<JobElementData> jobs = [];
      final List<dynamic> jobList = jsonDecode(response.body)['data'];
      for (var element in jobList) {
        jobs.add(JobElementData.fromJson(element));
      }
      return jobs;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<List<ProductElement>> getInactiveProducts() async {
    String token = await _getToken();
    print(token);
    if (token == null) {
      return [];
    }
    final response = await http.get(
      Uri.parse(
        '$baseUrl/api/d2/manage_products/getInActiveProducts',
      ),
      headers: {
        'Content-Type': 'application/json',
        //'Authorization': userInfo!.data!.token!,
        'Authorization': token
      },
    );

    if (response.statusCode == 200) {
      final List<ProductElement> products = [];
      final List<dynamic> productList = jsonDecode(response.body)['data'];
      for (var element in productList) {
        products.add(ProductElement.fromJson(element));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
