import 'dart:developer';

import '../model/firm_data_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class FetchApi {
  Future<List<FirmDataModel>?> fetchApi() async {
    List<FirmDataModel> _model = [];
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=8jdb2m1namg690v3hhvmmg0hjj'
    };
    var request = http.Request(
        'GET', Uri.parse('https://mapi.omunim.in/firm/get_all_firm_details'));
    request.body = convert.json.encode({
      "api_request_type": "MOB_APP",
      "ecom_own_id": "101010",
      "ecom_login_id": "lrearth",
      "system_onoff": "ON",
      "GB_DB_HOST": "43.205.122.41",
      "user_login_id": "lrearth",
      "ecom_domain_name": "omunim.com",
      "ecom_api_key": "",
      "api_login_token": "abc12313",
      "api_prod_key": "123123",
      "api_request_id": "lrearth",
      "api_folder": "",
      "mapi_folder": "",
      "remote_login": "HTTP_REMOTE_LOGIN",
      "GB_DB_PORT": "3306",
      "GB_DB_USER": "",
      "USER_DB_HOST": "",
      "USER_DB_PORT": "",
      "USER_DB_USER": "",
      "owner_login_id": "lrearth",
      "owner_user_password": ""
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      _model = firmDataModelFromJson(await response.stream.bytesToString());
      return _model;
    } else {
      // response.
      return _model;
    }
  }
}
