import 'dart:convert';
import '../../../api/urls.dart';
import '../model/chakra_end_date_list_response_model.dart';
import 'package:http/http.dart' as http;

class ChakraEndListRepository {
  Future<ChakraEndDateListResponseModel> getData() async {
    print(FanexURLs.endDateList);
    final response = await http.Client().get(Uri.parse(FanexURLs.endDateList));
    if (response.statusCode == 200) {
      print(response.body);
      return ChakraEndDateListResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('error');
    }
  }
}
