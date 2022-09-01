import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:trofira/core/services/storage/storage.dart';
import 'package:trofira/core/services/storage/storage_keys.dart';
import 'dart:convert';
import 'endpoints.dart';
import 'package:trofira/core/models/error.dart';

class ApiService {
  final StorageService storageService = Get.find<StorageService>();
  final api = Dio.Dio();

  String getToken() {
    return storageService.read(TrofiraStorageKeys.token);
  }

  ///[Put] call with user token
  secureHttpPutCall(String endpoint, Map<String, dynamic> params) async {
    return await checkInternetConnection(() async {
      String token = getToken();
      var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";
      Map<String, String> headers = {
        "authorization": token,
      };
      try {
        var response = await api.put(
          url,
          data: params,
          options: Dio.Options(
            headers: headers,
          ),
        );
        final body = json.decode(response.data);
        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///[Post] call with user token
  secureHttpPostCall({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic> extraParams = const {},
  }) async {
    return await checkInternetConnection(() async {
      String token = getToken();
      // print(token);
      // print(params);
      var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";
      Map<String, String> headers = {
        "authorization": token,
      };
      try {
        var response = await api.post(
          url,
          data: data,
          queryParameters: extraParams,
          options: Dio.Options(
            headers: headers,
          ),
        );
        final body = response.data;

        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///[Post] call with user token
  sendVerifyEmailOTP(String token) async {
    return await checkInternetConnection(() async {
      // print(token);
      var url =
          "${Endpoints.apiURL.trim()}${Endpoints.sendVerifyEmailOTP.trim()}";
      Map<String, String> headers = {
        "authorization": token,
      };

      try {
        var response = await api.get(
          url,
          options: Dio.Options(
            headers: headers,
          ),
        );

        // await checkForExceptions(response, url);
        final body = response.data;
        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///[Post] call without with user token
  Future httpPostCall({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic> extraParams = const {},
  }) async {
    return await checkInternetConnection(() async {
      var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";
      // print(Endpoints.apiURL.trim());
      Map<String, String> headers = {};

      try {
        var response = await api.post(url,
            data: data,
            queryParameters: extraParams,
            options: Dio.Options(
              headers: headers,
            ));

        final body = response.data;

        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///[Get] call with with user token
  secureHttpGetCall({
    required String endpoint,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    return await checkInternetConnection(() async {
      var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";
      String token = getToken();

      Map<String, String> headers = {
        "authorization": token,
      };

      try {
        var response = await api.get(
          url,
          queryParameters: queryParameters,
          options: Dio.Options(
            headers: headers,
          ),
        );

        final body = response.data;

        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///[Get] call without with user token
  httpGetCall(
      {required String endpoint,
      Map<String, dynamic> extraParams = const {}}) async {
    var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";

    Map<String, String> headers = {};
    return await checkInternetConnection(() async {
      try {
        var response = await api.get(
          url,
          queryParameters: extraParams,
          options: Dio.Options(
            headers: headers,
          ),
        );
        final body = json.decode(response.data);
        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  ///secure [delete] api call with user token
  Future secureDeleteRequest({
    required String endpoint,
    required Map params,
    Map<String, dynamic> extraParams = const {},
  }) async {
    return await checkInternetConnection(() async {
      String token = getToken();

      var url = "${Endpoints.apiURL.trim()}${endpoint.trim()}";
      try {
        HttpClient httpClient = HttpClient();
        HttpClientRequest request = await httpClient.deleteUrl(Uri.parse(url));
        request.headers.set('content-type', 'application/json');

        request.headers.add(
          "x-auth-token ",
          token,
        );
        request.add(utf8.encode(json.encode(params)));
        HttpClientResponse response = await request.close();
        String reply = await response.transform(utf8.decoder).join();
        httpClient.close();

        final Map<String, dynamic> responseData = json.decode(reply);
        return responseData;
      } on Dio.DioError catch (e) {
        ////print(e.toString());
        throw await checkForExceptions(e, url);
      }
    });
  }

  Future checkInternetConnection(Function apiCall) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result) {
      return await apiCall();
    } else {
      throw const Error(
          statusCode: 500, message: "No Internet connection found");
    }
  }

  verifyEmailOTP(String code) async {
    return await checkInternetConnection(() async {
      String token = storageService.read(TrofiraStorageKeys.authToken);
      // print(token);
      // print(params);
      var url =
          "${Endpoints.apiURL.trim()}${Endpoints.sendVerifyEmailOTP.trim()}";
      Map<String, String> headers = {
        "authorization": token,
      };
      try {
        var response = await api.post(
          url,
          data: {"code": code},
          options: Dio.Options(
            headers: headers,
          ),
        );
        final body = response.data;
        return body;
      } on Dio.DioError catch (e) {
        throw await checkForExceptions(e, url);
      }
    });
  }

  Future logout() async {
    storageService.clear();
    storageService.write(TrofiraStorageKeys.hasSeenOnboarding, true);
  }

  Future checkForExceptions(dynamic error, String endpoint) async {
    if (error is Dio.DioError) {
      if (error.response!.statusCode == 401) {
        // token has expired
        logout();
        Get.offAllNamed("/");
        throw Error(
              statusCode: error.error.statusCode, message: 'Token expired');
      }
      print("Endpoint: ${endpoint}");
      print("Status Code: ${error.response!.statusCode}");
      print("Error response data: ${error.response!.data ?? error.error.data}");
      if (error.response!.statusCode != 200 &&
          error.response!.statusCode != 201) {
        final errorResponseBody = error.response!.data;

        if (errorResponseBody != null) {
          throw Error(
              message: errorResponseBody['message'],
              statusCode: error.response!.statusCode,
              data: errorResponseBody);
        }
        if (error.response!.statusCode == 500 ||
            error.response!.statusCode == 503) {
          throw Error(
              statusCode: error.error.statusCode, message: 'Server Error');
        }
      }
      throw Error(
          message: "Error!!! Try again", statusCode: error.error.statusCode);
    }

    // if (error is Dio.Response) {
    //   if (error.data.statusCode != 200 && error.data.statusCode != 201) {
    //     final errorResponseBody = error.data;

    //     print(errorResponseBody);
    //     if (errorResponseBody != null) {
    //       throw Error(
    //           message: errorResponseBody['message'],
    //           statusCode: error.data.statusCode,
    //           data: errorResponseBody);
    //     }
    //     if (error.data!.statusCode == 500 || error.data!.statusCode == 503) {
    //       throw Error(
    //           statusCode: error.data.statusCode, message: 'Server Error');
    //     }
    //   }
    // }
  }

  // static Future<Map> updateProfilePic(File image) async {
  //   String url = Endpoints.apiURL + Endpoints.profilePicChange;
  //   String token =  getToken();

  //   var uri = Uri.parse(url);

  //   final mimeTypeData =
  //       lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');

  //   final profilePicChange = http.MultipartRequest('POST', uri);

  //   if (image != null) {
  //     final file = await http.MultipartFile.fromPath(
  //       'image',
  //       image.path,
  //       contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
  //     );
  //     profilePicChange.files.add(file);
  //   }

  //   profilePicChange.headers.addAll({"TrofiraToken": "Trofira Token " + token});

  //   // try {
  //   final streamedResponse = await profilePicChange.send();
  //   final response = await http.Response.fromStream(streamedResponse);
  //   print(response);
  //   if (response.statusCode != 200){ throw
  // ['msg']} response.statusCode;
  //   }
  //   final Map<String, dynamic> responseData = json.decode(response.body);

  //   if (responseData["type"] == ApiResponseType.error) {
  //     throw responseData["msg"];
  //   }
  //   if (responseData["type"] == ApiResponseType.success) {
  //     return {"status": true, "msg": responseData["msg"]};
  //   }

  //   if (responseData["type"] == ApiResponseType.logout) {
  //     throw ApiResponseType.logout;
  //   }

  //   return {"status": true, "msg": responseData["msg"]};
  // }
}
