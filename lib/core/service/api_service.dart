import 'dart:convert';

import'package:http/http.dart'as http;
class ApiService {
  Future<void> fetchData() async {
    final url = 'https://task.focal-x.com/api/products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Successful response
        var data = json.decode(response.body);
        print(data); // Do something with the data
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception: $e');
    }
  }
}