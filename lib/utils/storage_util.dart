import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_routes.dart';
import '../utils/file_storage_util.dart';

abstract class StorageUtil {
  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refreshTokenKey';
  static const String _userIdKey = 'userID';
  static const String _onboardingScreenIdKey = 'onBoardingID';
  static const String _profileScreenIdKey = 'profileID';
  static GetStorage storage = GetStorage();

  static String? getToken() {
    if (storage.hasData(_tokenKey)) {
      return storage.read(_tokenKey);
    }
    return null;
  }

  static String? getRefreshToken() {
    if (storage.hasData(_refreshTokenKey)) {
      return storage.read(_refreshTokenKey);
    }
    return null;
  }

  static String? getUserId() {
    if (storage.hasData(_userIdKey)) {
      return storage.read(_userIdKey).toString();
    }
    return null;
  }

  static bool? getOnboardingScreenId() {
    if (storage.hasData(_onboardingScreenIdKey)) {
      return storage.read(_onboardingScreenIdKey);
    }
    return null;
  }

  static bool? getProfileScreenId() {
    if (storage.hasData(_profileScreenIdKey)) {
      return storage.read(_profileScreenIdKey);
    }
    return null;
  }

  static writeOnboardingScreenId(bool value) {
    storage.write(_onboardingScreenIdKey, value);
  }

  static writeProfileScreenId(bool value) {
    storage.write(_profileScreenIdKey, value);
  }

  static writeUserId(String value) {
    storage.write(_userIdKey, value);
  }

  static writeToken(String value) {
    storage.write(_tokenKey, value);
  }

  static writeRefreshToken(String value) {
    storage.write(_refreshTokenKey, value);
  }

  static deleteUserId() {
    storage.remove(_userIdKey);
  }

  static deleteProfileId() {
    storage.remove(_profileScreenIdKey);
  }

  static deleteToken() {
    storage.remove(_tokenKey);
  }

  static deleteRefreshToken() {
    storage.remove(_refreshTokenKey);
  }

  static deleteOnboardingData() {
    storage.remove(_onboardingScreenIdKey);
  }

  static Future<void> logoutUser() async {
    // Clear all stored data
    deleteToken();
    deleteUserId();
    deleteRefreshToken();
    deleteOnboardingData();
    deleteProfileId();

    // Navigate to login
    Get.offAllNamed(AppRoutes.login);
  }
}
