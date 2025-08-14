import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../utils/log_utils.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool _isConnected = true.obs;
  final RxString _connectionType = ''.obs;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  bool get isConnected => _isConnected.value;

  String get connectionType => _connectionType.value;

  Stream<bool> get connectivityStream => _isConnected.stream;

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

  Future<void> _initializeConnectivity() async {
    try {
      // Check initial connectivity status
      final connectivityResult = await _connectivity.checkConnectivity();
      _updateConnectionStatus(connectivityResult);

      // Listen to connectivity changes
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        (List<ConnectivityResult> results) {
          _updateConnectionStatus(results);
        },
        onError: (error) {
          LogUtil.debug('Connectivity error: $error');
          _isConnected.value = false;
          _connectionType.value = 'none';
        },
      );
    } catch (e) {
      LogUtil.debug('Failed to initialize connectivity: $e');
      _isConnected.value = false;
      _connectionType.value = 'none';
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    bool hasConnection = results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );

    String connectionType = 'none';
    if (results.contains(ConnectivityResult.wifi)) {
      connectionType = 'wifi';
    } else if (results.contains(ConnectivityResult.mobile)) {
      connectionType = 'mobile';
    } else if (results.contains(ConnectivityResult.ethernet)) {
      connectionType = 'ethernet';
    }

    _isConnected.value = hasConnection;
    _connectionType.value = connectionType;

    LogUtil.debug(
      'Network connectivity changed: $connectionType, Has network: $hasConnection',
    );

    // Note: This only checks network connectivity, not actual internet access
    // Use isInternetAvailable() for real internet connectivity test
  }
}
