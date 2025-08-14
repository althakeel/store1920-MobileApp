import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  // Private constructor to prevent instantiation
  SnackBarUtil._();

  // Success snackbar - Green theme
  static void showSuccess({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withValues(alpha: 0.1),
      colorText: Colors.black,
      borderColor: Colors.green.shade300,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: Icon(
        Icons.check_circle_outline,
        color: Colors.green.shade700,
        size: 28,
      ),
      duration: duration ?? const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Error snackbar - Red theme
  static void showError({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withValues(alpha: 0.1),
      colorText: Colors.red.shade700,
      borderColor: Colors.red.shade300,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: Icon(Icons.error_outline, color: Colors.red.shade700, size: 28),
      duration: duration ?? const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Warning snackbar - Orange theme
  static void showWarning({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.withValues(alpha: 0.1),
      colorText: Colors.black,
      borderColor: Colors.orange.shade300,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: Icon(
        Icons.warning_amber_outlined,
        color: Colors.orange.shade700,
        size: 28,
      ),
      duration: duration ?? const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Info snackbar - Blue theme
  static void showInfo({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withValues(alpha: 0.1),
      colorText: Colors.blue.shade700,
      borderColor: Colors.blue.shade300,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 28),
      duration: duration ?? const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Loading snackbar - Purple theme (for sync operations)
  static void showLoading({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.purple.withValues(alpha: 0.1),
      colorText: Colors.purple.shade700,
      borderColor: Colors.purple.shade300,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple.shade700),
        ),
      ),
      duration: duration ?? const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Custom snackbar with full control
  static void showCustom({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required Color borderColor,
    required IconData iconData,
    Duration? duration,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position ?? SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: textColor,
      borderColor: borderColor,
      borderWidth: 1,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: Icon(iconData, color: textColor, size: 28),
      duration: duration ?? const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  // Convenience methods for common scenarios
  static void showNetworkError() {
    showError(
      title: 'Network Error',
      message: 'Please check your internet connection and try again',
    );
  }

  static void showSyncError() {
    showError(
      title: 'Sync Failed',
      message: 'Failed to synchronize data. Please try again',
    );
  }

  static void showAlertError({
    String title = 'Location Error',
    String msg = 'Unable to get location. Please check GPS settings',
  }) {
    showError(title: title, message: msg);
  }

  static void showAlertWarning({
    String title = 'Location Retrieved',
    String msg = 'Using last known location (GPS signal weak)',
  }) {
    showWarning(title: title, message: msg);
  }

  static void showSaveSuccess({
    String title = 'Saved Successfully',
    String msg = 'Data saved locally and will sync when online',
  }) {
    showSuccess(title: title, message: msg);
  }

  static void showValidationError(String field) {
    showError(
      title: 'Validation Error',
      message: 'Please fill in the $field field',
    );
  }
}

