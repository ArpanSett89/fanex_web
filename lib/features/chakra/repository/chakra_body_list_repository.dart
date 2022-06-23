import 'dart:convert';
import '../../../api/urls.dart';
import '../model/chakra_body_list_model.dart';
import 'package:http/http.dart' as http;

class ChakraBodyListRepository {
  Future<ChakraBodyListModel> getData() async {
    final response = await http.Client().get(Uri.parse(FanexURLs.chakraList));
    if (response.statusCode == 200) {
      print(response.body);
      return ChakraBodyListModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('error');
    }
  }
}