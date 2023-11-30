import 'package:http/http.dart';

class NetworkService{

  static final String baseUrl = "6568a0d49927836bd9752ac3.mockapi.io";

  static final String apiUsers = "/users";

  static final String apiDeleteUsers = "/users";

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<String> getData(String baseUrl, String api) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);

    if (response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    } else {
      return "Something went wrong at ${response.statusCode}";
    }
  }

  static Future<String> postData(String baseUrl, String api, Map<String, dynamic> body) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await post(url, body: body, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201){
      return "Successfully posted: ${response.body}";
    } else {
      return "Something went wrong at ${response.statusCode}";
    }
  }

  static Future<String> deleteData(String baseUrl, String apiDeleteId, String id) async {
    Uri url = Uri.https(baseUrl, "$apiDeleteId/$id");
    Response response = await delete(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201){
      return "Successfully deleted: ${response.body}";
    } else {
      return "Something went wrong at ${response.statusCode}";
    }
  }
}