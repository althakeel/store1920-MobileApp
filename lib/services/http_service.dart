// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart';
//
// import '../global/apis.dart';
// import '../utils/log_utils.dart';
// import '../utils/storage_util.dart';
// import 'auth_interceptor.dart';
// import 'error_type.dart';
// import 'connectivity_service.dart';
//
// class ApiService extends HttpOverrides {
//   static dio.Dio _dio = dio.Dio();
//
//   ApiService._internal();
//
//   static final ApiService instance = ApiService._internal();
//   static const environment = ApiEnvironment.prod;
//   static String baseUrl = environment.baseUrl;
//
//   // Connectivity and queue services
//   static late ConnectivityService _connectivityService;
//   final dio.BaseOptions _baseOptions = dio.BaseOptions(
//     baseUrl: baseUrl,
//     validateStatus: (int? status) {
//       return true;
//     },
//     headers: {
//       'Content-Type': 'application/json',
//       'Authtoken':
//           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWRtaW4iLCJleHAiOjE3MDcxMTM4MDd9.81c8uR-Vl_kZkCCPZBKT5uJ_lQe8L0zoad_WVsAES2M',
//     },
//   );
//
//   ApiService.initialize() {
//     _dio = dio.Dio(_baseOptions);
//
//     // Initialize connectivity and queue services
//     try {
//       _connectivityService = Get.find<ConnectivityService>();
//       LogUtil.debug('ConnectivityService found and initialized');
//     } catch (e) {
//       LogUtil.debug(
//         'Warning: ConnectivityService not found during HTTP service initialization: $e',
//       );
//       // This is OK during early app startup - connectivity will be checked later
//     }
//
//     try {
//       LogUtil.debug('RequestQueueService found and initialized');
//     } catch (e) {
//       LogUtil.debug(
//         'Warning: RequestQueueService not found during HTTP service initialization: $e',
//       );
//     }
//   }
//
//   static Future<void> refreshAuthToken({
//     required String url,
//     required Map<String, dynamic> params,
//     required Function(ErrorType, String) onError,
//     required Function(Map<String, dynamic>) onSuccess,
//   }) async {
//     final dio.Response response = await _dio.post(
//       url,
//       data: params,
//       options: dio.Options(
//         headers: {'Apitoken': 'Bearer ${StorageUtil.getToken().toString()}'},
//       ),
//     );
//
//     Map<String, dynamic> map = {};
//     map['response'] = response.data;
//
//     if (response.statusCode != 200) {
//       onError(ErrorType.none, map['response']['message']);
//       return;
//     }
//     if (map['response']['status'] != 200 || !map['response']['success']) {
//       onError(ErrorType.none, map['response']['message']);
//       return;
//     }
//     onSuccess(map);
//   }
//
//   static Future<void> postRequest({
//     dio.FormData? formData,
//     required String url,
//     Map<String, dynamic>? params,
//     required Function(ErrorType, String) onError,
//     required Function(Map<String, dynamic>) onSuccess,
//     bool bypassInterceptor = false,
//     bool queueOnOffline = true,
//   }) async {
//     // Check connectivity first
//     if (!await _checkConnectivityAndQueue(
//       url,
//       params,
//       onError,
//       onSuccess,
//       queueOnOffline,
//     )) {
//       return;
//     }
//
//     try {
//       _dio.interceptors.clear();
//       if (!bypassInterceptor) {
//         attachInterceptor();
//       }
//       LogUtil.debug('Method => POST , API URL ==> $url');
//       LogUtil.debug('Params ==> $params');
//       final dio.Response response = await _dio.post(
//         url,
//         data: params ?? formData,
//         options: dio.Options(
//           headers: {'Apitoken': StorageUtil.getToken().toString()},
//         ),
//       );
//       Map<String, dynamic> map = {};
//       map['response'] = response.data;
//       if (response.statusCode != 200) {
//         LogUtil.debug('Error ${response.statusCode} ===>  $response');
//         onError(ErrorType.none, map['response']['message']);
//       } else {
//         LogUtil.debug(
//           "response  type ===>   ${map["response"].runtimeType} ${map["response"].runtimeType.toString() == 'List<dynamic>'}",
//         );
//         LogUtil.debug('response   ===>   $response  ');
//         if (map['response'].runtimeType.toString() == 'List<dynamic>') {
//           onSuccess(map);
//         } else {
//           if (map['response']['status'] != null) {
//             if (map['response']['status'] != 200) {
//               LogUtil.debug('Error ${response.statusCode} ===>  $response');
//               if (map['response']['status'] == 1 ||
//                   map['response']['status'] == true) {
//                 onSuccess(map);
//               } else {
//                 onError(ErrorType.none, map['response']['message']);
//               }
//             } else {
//               onSuccess(map);
//             }
//           } else {
//             onSuccess(map);
//           }
//         }
//       }
//     } on dio.DioException catch (e) {
//       LogUtil.debug('Error 12 ===>  $e    ${e.message}');
//       if (e.type == dio.DioExceptionType.connectionTimeout) {
//         onError(ErrorType.internet, '');
//       }
//       if (e.response != null) {
//         LogUtil.debug('Error12  ===>  ${e.response?.data}');
//         onError(ErrorType.none, e.response?.data['message']);
//       }
//     }
//     return;
//   }
//
//   static Future<void> postFileRequest({
//     required String url,
//     required Function(ErrorType, String) onError,
//     String contentType = 'application/json',
//     required Function(Map<String, dynamic>) onSuccess,
//     required Map<String, dynamic> params,
//   }) async {
//     try {
//       attachInterceptor();
//       LogUtil.debug('Method => POST , API URL ==> $url');
//       LogUtil.debug('Params ==> $params');
//       final dio.Response response = await _dio.post(
//         url,
//         data: dio.FormData.fromMap(params),
//         options: dio.Options(
//           headers: {'Apitoken': StorageUtil.getToken().toString()},
//         ),
//       );
//       LogUtil.debug('response ==>   $response');
//       Map<String, dynamic> map = {};
//       map['response'] = response.data;
//       if (response.statusCode != 200) {
//         LogUtil.debug('Error ${response.statusCode} ===>  $response');
//         onError(ErrorType.none, map['response']['message']);
//       } else {
//         LogUtil.debug(
//           "response  type ===>   ${map["response"].runtimeType} ${map["response"].runtimeType.toString() == 'List<dynamic>'}",
//         );
//         LogUtil.debug('response   ===>   $response  ');
//         onSuccess(map);
//       }
//     } on dio.DioException catch (e) {
//       LogUtil.debug('Error 12 ===>  $e    ${e.type}');
//       if (e.type == dio.DioExceptionType.connectionTimeout) {
//         onError(ErrorType.internet, '');
//       }
//       if (e.response != null) {
//         LogUtil.debug('Error12  ===>  ${e.response?.data}');
//         onError(ErrorType.none, e.response?.data['message']);
//       }
//     }
//     return;
//   }
//
//   static attachInterceptor() {
//     _dio.interceptors.add(AuthInterceptor());
//   }
//
//   /// Check connectivity and queue request if offline
//   static Future<bool> _checkConnectivityAndQueue(
//     String url,
//     Map<String, dynamic>? params,
//     Function(ErrorType, String) onError,
//     Function(Map<String, dynamic>) onSuccess,
//     bool queueOnOffline,
//   ) async {
//     try {
//       // Simple connectivity check before API call
//       if (!await _hasInternetConnection()) {
//         if (queueOnOffline && _isQueueServiceAvailable()) {
//           // Queue the request for later
//           final requestId = _generateRequestId();
//           final queuedRequest = QueuedRequest(
//             id: requestId,
//             method: 'POST',
//             url: url,
//             params: params,
//             headers: {'Apitoken': StorageUtil.getToken().toString()},
//             timestamp: DateTime.now(),
//             onSuccess: (data) => onSuccess(data as Map<String, dynamic>),
//             onError: (error) => onError(ErrorType.internet, error),
//           );
//
//           _queueService.addToQueue(queuedRequest);
//           LogUtil.debug('Request queued for offline: $url');
//
//           // Show user-friendly message
//           onError(
//             ErrorType.internet,
//             'Request queued. Will be sent when connection is restored.',
//           );
//         } else {
//           onError(ErrorType.internet, 'No internet connection available.');
//         }
//         return false;
//       }
//       return true;
//     } catch (e) {
//       LogUtil.debug('Error checking connectivity: $e');
//       onError(ErrorType.internet, 'Unable to check connectivity.');
//       return false;
//     }
//   }
//
//   /// Simple connectivity check before API calls
//   static Future<bool> _hasInternetConnection() async {
//     try {
//       final connectivity = Connectivity();
//       final connectivityResult = await connectivity.checkConnectivity();
//
//       return connectivityResult.any(
//         (result) =>
//             result == ConnectivityResult.wifi ||
//             result == ConnectivityResult.mobile ||
//             result == ConnectivityResult.ethernet,
//       );
//     } catch (e) {
//       LogUtil.debug('Error checking connectivity: $e');
//       return true; // Default to connected if can't check
//     }
//   }
//
//   /// Check if queue service is available
//   static bool _isQueueServiceAvailable() {
//     try {
//       return _queueService != null;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   /// Generate unique request ID
//   static String _generateRequestId() {
//     return 'req_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
//   }
// }
