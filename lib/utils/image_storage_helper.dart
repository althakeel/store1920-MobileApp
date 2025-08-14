import 'dart:convert';
import 'dart:typed_data';

import 'file_storage_util.dart';
import 'log_utils.dart';

class ImageStorageHelper {
  static ImageStorageHelper? _instance;

  static ImageStorageHelper get instance =>
      _instance ??= ImageStorageHelper._();

  ImageStorageHelper._();

  /// Convert Base64 images to file paths and save them
  /// Returns a list of file paths
  Future<List<String>> convertBase64ImagesToFiles({
    required List<Map<String, dynamic>> offlineImages,
    required String imageType, // 'sarpanch', 'cement', 'award', 'photos'
    required String identifier, // sarpanch_id, survey_id, etc.
  }) async {
    final filePaths = <String>[];

    try {
      for (int i = 0; i < offlineImages.length; i++) {
        final imageData = offlineImages[i];
        final base64String = imageData['data'] as String?;

        if (base64String != null && base64String.isNotEmpty) {
          // Remove data URL prefix if present
          String cleanBase64 = base64String;
          if (base64String.contains(',')) {
            cleanBase64 = base64String.split(',').last;
          }

          try {
            // Decode Base64 to bytes
            final bytes = base64Decode(cleanBase64);

            // Save to file
            final filePath = await FileStorageUtil.instance.saveImageToFile(
              imageBytes: bytes,
              imageType: imageType,
              identifier: identifier,
              imageName: 'image_$i',
            );

            if (filePath != null) {
              filePaths.add(filePath);
              LogUtil.debug('[IMG] Converted Base64 to file: $filePath');
            }
          } catch (e) {
            LogUtil.error('[IMG] Error converting Base64 image $i: $e');
          }
        }
      }

      LogUtil.debug(
        '[IMG] Converted ${filePaths.length} images to files for $imageType/$identifier',
      );
      return filePaths;
    } catch (e) {
      LogUtil.error('[IMG] Error converting Base64 images to files: $e');
      return filePaths;
    }
  }

  /// Convert file paths back to Base64 for display/upload
  /// Returns Base64 strings
  Future<List<String>> convertFilePathsToBase64(List<String> filePaths) async {
    final base64List = <String>[];

    try {
      for (final filePath in filePaths) {
        final bytes = await FileStorageUtil.instance.loadImageFromFile(
          filePath,
        );
        if (bytes != null) {
          final base64String = base64Encode(bytes);
          base64List.add(base64String);
          LogUtil.debug('[IMG] Converted file to Base64: $filePath');
        }
      }

      LogUtil.debug('[IMG] Converted ${base64List.length} files to Base64');
      return base64List;
    } catch (e) {
      LogUtil.error('[IMG] Error converting files to Base64: $e');
      return base64List;
    }
  }

  /// Convert file paths to Uint8List for display
  Future<List<Uint8List>> convertFilePathsToBytes(
    List<String> filePaths,
  ) async {
    final bytesList = <Uint8List>[];

    try {
      for (final filePath in filePaths) {
        final bytes = await FileStorageUtil.instance.loadImageFromFile(
          filePath,
        );
        if (bytes != null) {
          bytesList.add(bytes);
          LogUtil.debug('[IMG] Loaded file bytes: $filePath');
        }
      }

      LogUtil.debug('[IMG] Loaded ${bytesList.length} images as bytes');
      return bytesList;
    } catch (e) {
      LogUtil.error('[IMG] Error loading files as bytes: $e');
      return bytesList;
    }
  }

  /// Save new images directly as files (for new uploads)
  Future<List<String>> saveNewImagesToFiles({
    required List<Uint8List> imageBytes,
    required String imageType,
    required String identifier,
  }) async {
    final filePaths = <String>[];

    try {
      for (int i = 0; i < imageBytes.length; i++) {
        final filePath = await FileStorageUtil.instance.saveImageToFile(
          imageBytes: imageBytes[i],
          imageType: imageType,
          identifier: identifier,
          imageName: 'image_$i',
        );

        if (filePath != null) {
          filePaths.add(filePath);
          LogUtil.debug('[IMG] Saved new image to file: $filePath');
        }
      }

      LogUtil.debug(
        '[IMG] Saved ${filePaths.length} new images for $imageType/$identifier',
      );
      return filePaths;
    } catch (e) {
      LogUtil.error('[IMG] Error saving new images to files: $e');
      return filePaths;
    }
  }

  /// Clean up old image files for a specific item
  Future<void> cleanupImagesForItem({
    required String imageType,
    required String identifier,
  }) async {
    try {
      // This would require maintaining a mapping of items to their files
      // For now, we'll rely on the periodic cleanup in FileStorageUtil
      LogUtil.debug('[IMG] Cleanup requested for $imageType/$identifier');
    } catch (e) {
      LogUtil.error('[IMG] Error during cleanup: $e');
    }
  }

  /// Check if we have local files for an item
  Future<bool> hasLocalFiles(List<String>? filePaths) async {
    if (filePaths == null || filePaths.isEmpty) return false;

    try {
      for (final filePath in filePaths) {
        if (await FileStorageUtil.instance.fileExists(filePath)) {
          return true;
        }
      }
      return false;
    } catch (e) {
      LogUtil.error('[IMG] Error checking local files: $e');
      return false;
    }
  }

  /// Get total size of images for an item
  Future<int> getTotalImageSize(List<String> filePaths) async {
    int totalSize = 0;

    try {
      for (final filePath in filePaths) {
        final size = await FileStorageUtil.instance.getFileSize(filePath);
        if (size != null) {
          totalSize += size;
        }
      }

      LogUtil.debug('[IMG] Total image size: ${totalSize / 1024} KB');
      return totalSize;
    } catch (e) {
      LogUtil.error('[IMG] Error calculating image size: $e');
      return 0;
    }
  }
}
