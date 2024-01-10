import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  final String url = "https://tmiteam.shop";

  Future<dynamic> registerUser(Map<String, dynamic>? userData) async {
    // Implement user registration
    try {
      Response response = await _dio.post(
        '$url/api/v1/sign-up', // ENDPOINT URL
        data: userData, // REQUEST BODY
        // register 할 때, id, password, email, nickname 이렇게 필요함.
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String loginId, String password) async {
    // Implement user login
    try {
      Response response = await _dio.post(
        '$url/api/v1/sign-in',
        data: {
          'loginId' : loginId,
          'password' : password,
        }
      );
      print(response);
      return response.data;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    // Implement user logout
    try {
      Response response = await _dio.get(
        '$url/api/v1/member/logout',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

}