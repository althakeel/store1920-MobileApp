// import 'package:dio/dio.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import '../utils/data_utils.dart';
// import '../utils/log_utils.dart';
// import '../utils/storage_util.dart';
//
// class AuthInterceptor implements InterceptorsWrapper {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     handler.next(err);
//   }
//
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (UserController.instance.isRefreshingAccessToken) {
//       handler.next(options);
//       return;
//     }
//
//     /// Get Tokens
//     String accessToken = StorageUtil.getToken() ?? '';
//     String refreshToken = StorageUtil.getRefreshToken() ?? '';
//     if (!isStringValid(accessToken) || !isStringValid(refreshToken)) {
//       LogUtil.debug('logout from interceptor-1');
//       await StorageUtil.logoutUser();
//       return;
//     }
//
//     /// Validate Access Token
//     LogUtil.debug(accessToken);
//     Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
//     int expiry = decodedToken['exp'] * 1000;
//     int now = DateTime.now().millisecondsSinceEpoch;
//     bool hasExpired = expiry <= now;
//     LogUtil.debug(
//       'ACCESS TOKEN: Exp:$expiry : Now: $now :: Expired: $hasExpired',
//     );
//     if (!hasExpired) {
//       handler.next(options);
//       return;
//     }
//
//     /// Validate Refresh Token
//     Map<String, dynamic> decodedRefreshToken = JwtDecoder.decode(refreshToken);
//     int refreshExp = decodedRefreshToken['exp'] * 1000;
//     bool hasRefreshExpired = refreshExp <= now;
//     LogUtil.debug(
//       'REFRESH TOKEN: Exp:$expiry : Now: $now :: Expired: $hasRefreshExpired',
//     );
//     if (!hasRefreshExpired) {
//       UserController.instance.isRefreshingAccessToken = true;
//       await UserController.instance.getUserData();
//       UserController.instance.isRefreshingAccessToken = false;
//       options.headers['Authtoken'] = StorageUtil.getToken();
//       handler.next(options);
//       return;
//     }
//     LogUtil.debug('logout from interceptor-2');
//     await StorageUtil.logoutUser();
//     return;
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   }
// }
