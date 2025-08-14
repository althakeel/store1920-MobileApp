import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../screens/features/auth/controller/loader_controller.dart';
import '../services/error_type.dart';
import '../services/http_service.dart';
import '../utils/log_utils.dart';
import '../utils/snackbar_util.dart';
import 'apis.dart';

class ConstantValue extends LoaderController {
  Future<String?> uploadImage({
    int? id,
    String? imageType,
    String? imageData,
  }) async {
    setError(errorType: ErrorType.none);
    Map<String, dynamic> data = {
      'imagetype': imageType,
      'filename': '$id${DateTime.now()}.png',
      'id': id.toString(),
      'unique_id': id.toString(), // Add unique_id as used in fmbjms
      'uploadedfile': 'data:image/png;base64,$imageData',
      'image_date': DateTime.now(),
    };
    LogUtil.debug('[UPLOAD] Image type: $imageType, ID: $id');
    String? imageUrl;
    var formData = FormData.fromMap(data);
    LogUtil.debug('Params ==> $data');

    // Use Completer to properly handle async response
    final completer = Completer<String?>();

    // await ApiService.postRequest(
    //   url: ApiUrl.imageUpload,
    //   formData: formData,
    //   onSuccess: (Map<String, dynamic> data) {
    //     LogUtil.debug('[UPLOAD] Server response: ${data['response']}');
    //     if (data['response'] != null && data['response']['success'] == true) {
    //       // Try both possible response fields
    //       imageUrl =
    //           data['response']['file_name'] ?? data['response']['imageurl'];
    //       LogUtil.debug('[UPLOAD] Image uploaded successfully: $imageUrl');
    //       completer.complete(imageUrl);
    //     } else {
    //       LogUtil.error('[UPLOAD] Upload failed: ${data['response']}');
    //       completer.complete(null);
    //     }
    //   },
    //   onError: (ErrorType errorType, String msg) {
    //     setError(errorType: errorType);
    //
    //     // Check for 403 access denied error by message content
    //     if (msg.contains('You do not have access to survey this sarpanch') ||
    //         msg.contains('403') ||
    //         msg.contains('Access Denied')) {
    //       SnackBarUtil.showAlertError(
    //         title: 'Access Denied',
    //         msg:
    //             'You do not have access to survey this sarpanch. Please contact your administrator.',
    //       );
    //     } else {
    //       showError(msg: msg);
    //     }
    //
    //     LogUtil.error('[UPLOAD] Upload error: $msg');
    //     completer.complete(null);
    //   },
    // );

    return await completer.future;
  }

  Future<Uint8List?> openDisplayImagePicker({
    required ImageSource imageSource,
    double maxWidth = 1920,
    double maxHeight = 1080,
    int imageQuality = 85,
  }) async {
    final pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );

    try {
      // Read the XFile's bytes
      final originalBytes = await pickedFile?.readAsBytes();

      // Decode the image using the image package
      final img.Image? image = img.decodeImage(originalBytes!);
      if (image == null) return null;

      // Compress the image
      final compressedBytes = img.encodeJpg(
        image,
        quality: imageQuality,
      ); // Adjust quality as needed

      return compressedBytes;
    } catch (e) {
      LogUtil.error('Error compressing image: $e');
      return null;
    }
  }

  @override
  Future<bool> isConnectedToInternet() async {
    // Use the enhanced method from LoaderController
    return await super.isConnectedToInternet();
  }
}
