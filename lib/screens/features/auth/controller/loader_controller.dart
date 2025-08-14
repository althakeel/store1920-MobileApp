import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

import '../../../../services/error_type.dart';
import '../../../../services/connectivity_service.dart';
import '../../../../utils/log_utils.dart';
import '../../../../utils/snackbar_util.dart';

class LoaderController extends GetxController {
  static LoaderController get instance => Get.find<LoaderController>();
  static bool isLoaderShow = false;
  Rx<Error> error = Error().obs;

  // Connectivity management
  ConnectivityService? _connectivityService;
  final RxBool isConnected = true.obs;
  final RxString connectionType = ''.obs;
  StreamSubscription<bool>? _connectivitySubscription;

  void showLoader() {
    if (isLoaderShow) return;
    isLoaderShow = true;
    // Do not await here; we want the caller to proceed while the dialog is visible
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  void dismissLoader() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    isLoaderShow = false;
  }

  void showError({String title = 'Alert!', String? msg}) {
    if (isLoaderShow) {
      dismissLoader();
    }
    if (msg != null) SnackBarUtil.showError(title: title, message: msg);
  }

  void setError({ErrorType? errorType}) {
    error.value.errorType = errorType!;
    error.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeConnectivity();
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }

  /// Initialize services and listen for connectivity changes
  void _initializeConnectivity() {
    try {
      LogUtil.debug('Initializing services...');

      try {
        _connectivityService = Get.find<ConnectivityService>();
      } catch (e) {
        _connectivityService = null;
      }

      // Default values
      isConnected.value = true;
      connectionType.value = 'wifi';

      // Subscribe to connectivity stream if available
      if (_connectivityService != null) {
        _connectivitySubscription = _connectivityService!.connectivityStream
            .listen((hasInternet) {
              final bool wasConnected = isConnected.value;
              isConnected.value = hasInternet;
              if (!wasConnected && hasInternet) {
                LogUtil.debug(
                  'Connection restored -> processing queued and notifying controllers',
                );
                onConnectionRestored();
              }
            });
      }

      LogUtil.debug('Services initialized');
    } catch (e) {
      LogUtil.error('Error initializing services: $e');
      isConnected.value = true;
      connectionType.value = 'wifi';
    }
  }

  /// Called when internet connection is restored
  /// Override this method in child classes to handle connection restored events
  void onConnectionRestored() {
    // Manual sync model: do nothing automatically
  }

  /// Simple internet check - only when explicitly needed
  Future<bool> checkInternetConnection({bool showMessage = true}) async {
    try {
      // Simple connectivity check using basic approach
      final connectivity = Connectivity();
      final connectivityResult = await connectivity.checkConnectivity();
      bool hasConnection = connectivityResult.any((result) {
        return (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.ethernet);
      });

      if (!hasConnection && showMessage) {
        showNoInternetMessage();
      }

      return hasConnection;
    } catch (e) {
      LogUtil.error('Error checking internet connection: $e');
      if (showMessage) {
        showNoInternetMessage();
      }
      return false;
    }
  }

  /// Show no internet message
  void showNoInternetMessage() {
    showError(
      title: 'No Internet Connection',
      msg: 'Please check your internet connection and try again',
    );
  }

  /// Safe API call with connectivity check
  Future<T?> safeApiCall<T>(
    Future<T> Function() apiCall, {
    bool showLoading = true,
    bool checkConnectivity = true,
  }) async {
    try {
      if (checkConnectivity && !await checkInternetConnection()) {
        return null;
      }

      if (showLoading) {
        showLoader();
      }

      final result = await apiCall();

      if (showLoading) {
        dismissLoader();
      }

      return result;
    } catch (e) {
      dismissLoader();
      showError(msg: 'Something went wrong. Please try again.');
      return null;
    }
  }

  /// Legacy method for backward compatibility
  Future<bool> isConnectedToInternet() async {
    return await checkInternetConnection(showMessage: false);
  }
}
