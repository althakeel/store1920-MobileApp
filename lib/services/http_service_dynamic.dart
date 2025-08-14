// import 'dart:convert';
//
// import 'package:dio/dio.dart' as dio;
// import '../utils/log_utils.dart';
// import '../utils/storage_util.dart';
//
// class HttpServiceDynamic {
//   static dio.Dio _dio = dio.Dio();
//
//   HttpServiceDynamic.initialize(String baseUrl) {
//     _dio = dio.Dio(_baseOptions(baseUrl));
//   }
//
//   dio.BaseOptions _baseOptions(baseUrl) => dio.BaseOptions(
//     baseUrl: baseUrl,
//     headers: {
//       'Content-Type': 'application/json',
//       'Apitoken':
//           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWRtaW4iLCJleHAiOjE3MDcxMTM4MDd9.81c8uR-Vl_kZkCCPZBKT5uJ_lQe8L0zoad_WVsAES2M',
//     },
//   );
//
//   static Future<Map<String, dynamic>> get(
//     String path,
//     Map<String, dynamic> params, {
//     bool token = false,
//     bool showLoader = true,
//   }) async {
//     Map<String, dynamic> result = {};
//     try {
//       showLoader ? LoaderController.instance.showLoader() : null;
//       final dio.Response response = await _dio.get(
//         path,
//         queryParameters: params,
//         options: token
//             ? dio.Options(
//                 headers: {'Apitoken': StorageUtil.getToken().toString()},
//               )
//             : null,
//       );
//       showLoader ? LoaderController.instance.dismissLoader() : null;
//       if (response.statusCode == 200) {
//         result = response.data as Map<String, dynamic>;
//       } else {
//         LogUtil.error(response.data);
//         LogUtil.error(response.data['message']);
//       }
//     } catch (e) {
//       LogUtil.error(e);
//     }
//     return result;
//   }
//
//   static Future<Map<String, dynamic>> post(
//     String path,
//     Map<String, dynamic> data, {
//     bool token = true,
//     bool showLoader = true,
//   }) async {
//     Map<String, dynamic> result = {};
//     try {
//       showLoader ? LoaderController.instance.showLoader() : null;
//
//       final dio.Response response = await _dio.post(
//         path,
//         data: jsonEncode(data),
//         options: token
//             ? dio.Options(
//                 headers: {'Apitoken': StorageUtil.getToken().toString()},
//               )
//             : null,
//       );
//       showLoader ? LoaderController.instance.dismissLoader() : null;
//       if (response.statusCode == 200) {
//         result = response.data as Map<String, dynamic>;
//         return result;
//       }
//       LogUtil.error(response.statusCode);
//       throw Exception(response.statusMessage);
//     } catch (e) {
//       LogUtil.error(e);
//     }
//     return result;
//   }
//
//   static Future<Map<String, dynamic>> picPost(
//     String path,
//     dio.FormData data, {
//     bool token = true,
//     bool showLoader = true,
//   }) async {
//     Map<String, dynamic> result = {};
//     try {
//       LoaderController.instance.showLoader();
//       final dio.Response response = await _dio.post(
//         path,
//         data: data,
//         options: token
//             ? dio.Options(
//                 headers: {
//                   'Apitoken': StorageUtil.getToken().toString(),
//                   // Ensure tokenString is used here
//                   'Content-Type': 'multipart/form-data',
//                 },
//               )
//             : null,
//       );
//       LoaderController.instance.dismissLoader();
//       if (response.statusCode == 200) {
//         // Check if response data is a JSON map or a string
//         if (response.data is Map<String, dynamic>) {
//           result = response.data as Map<String, dynamic>;
//         } else if (response.data is String) {
//           // Parse the string to JSON if it's a JSON string
//           result = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//         } else {
//           LogUtil.error('Unexpected response format');
//         }
//       } else {
//         LogUtil.error("Request failed: ${response.data['message']}");
//       }
//     } catch (e) {
//       LogUtil.error('Error: $e');
//       rethrow;
//     }
//     return result;
//   }
// }
