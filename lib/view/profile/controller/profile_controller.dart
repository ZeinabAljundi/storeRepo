import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modle/register_modle.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emaildController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerUser() async {
    final url = Uri.parse('https://yourapiurl.com/register'); // Replace with your API endpoint
    try {
      // Get data from the TextFormFields
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emaildController.text,
          "password": passwordController.text,
          "name": nameController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final registerResponse = Register.fromJson(responseData);

        print("Registration successful: ${registerResponse.message}");
      } else {
        print("Registration failed: ${response.body}");

      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }
  void onClose() {
    nameController.dispose();
    emaildController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
