import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'log_utils.dart';

class FileStorageUtil {
  static FileStorageUtil? _instance;
  static FileStorageUtil get instance => _instance ??= FileStorageUtil._();
  FileStorageUtil._();

  static const String _sarpanchImagesDir = 'sarpanch_images';
  static const String _surveyImagesDir = 'survey_images';
  static const String _photoSectionDir = 'photo_section';

  /// Get the app's document directory for storing images
  Future<Directory> get _appDocDir async {
    final directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  /// Create directory if it doesn't exist
  Future<Directory> _createDirectory(String dirName) async {
    final appDir = await _appDocDir;
    final dir = Directory(path.join(appDir.path, dirName));
    
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      LogUtil.debug('[FILE] Created directory: ${dir.path}');
    }
    
    return dir;
  }

  /// Save image bytes to file and return the file path
  Future<String?> saveImageToFile({
    required Uint8List imageBytes,
    required String imageType, // 'sarpanch', 'cement', 'award', 'photos'
    required String identifier, // sarpanch_id, survey_id, etc.
    required String imageName, // unique image identifier
  }) async {
    try {
      String dirName;
      switch (imageType) {
        case 'sarpanch':
          dirName = _sarpanchImagesDir;
          break;
        case 'cement':
        case 'award':
          dirName = _surveyImagesDir;
          break;
        case 'photos':
          dirName = _photoSectionDir;
          break;
        default:
          dirName = 'other_images';
      }

      final directory = await _createDirectory(dirName);
      
      // Create unique filename
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${imageType}_${identifier}_${imageName}_$timestamp.jpg';
      final filePath = path.join(directory.path, fileName);
      
      // Write file
      final file = File(filePath);
      await file.writeAsBytes(imageBytes);
      
      LogUtil.debug('[FILE] Image saved: $filePath (${imageBytes.length} bytes)');
      return filePath;
      
    } catch (e) {
      LogUtil.error('[FILE] Error saving image: $e');
      return null;
    }
  }

  /// Load image bytes from file path
  Future<Uint8List?> loadImageFromFile(String filePath) async {
    try {
      final file = File(filePath);
      
      if (!await file.exists()) {
        LogUtil.error('[FILE] Image file not found: $filePath');
        return null;
      }
      
      final bytes = await file.readAsBytes();
      LogUtil.debug('[FILE] Image loaded: $filePath (${bytes.length} bytes)');
      return bytes;
      
    } catch (e) {
      LogUtil.error('[FILE] Error loading image: $e');
      return null;
    }
  }

  /// Delete image file
  Future<bool> deleteImageFile(String filePath) async {
    try {
      final file = File(filePath);
      
      if (await file.exists()) {
        await file.delete();
        LogUtil.debug('[FILE] Image deleted: $filePath');
        return true;
      }
      
      return false;
      
    } catch (e) {
      LogUtil.error('[FILE] Error deleting image: $e');
      return false;
    }
  }

  /// Delete multiple image files
  Future<void> deleteImageFiles(List<String> filePaths) async {
    for (final filePath in filePaths) {
      await deleteImageFile(filePath);
    }
  }

  /// Check if file exists
  Future<bool> fileExists(String filePath) async {
    try {
      return await File(filePath).exists();
    } catch (e) {
      LogUtil.error('[FILE] Error checking file existence: $e');
      return false;
    }
  }

  /// Get file size in bytes
  Future<int?> getFileSize(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        return await file.length();
      }
      return null;
    } catch (e) {
      LogUtil.error('[FILE] Error getting file size: $e');
      return null;
    }
  }

  /// Clean up old/orphaned image files
  Future<void> cleanupOldImages({int daysOld = 30}) async {
    try {
      final directories = [_sarpanchImagesDir, _surveyImagesDir, _photoSectionDir];
      final cutoffDate = DateTime.now().subtract(Duration(days: daysOld));
      
      for (final dirName in directories) {
        final dir = await _createDirectory(dirName);
        final files = await dir.list().toList();
        
        for (final file in files) {
          if (file is File) {
            final stat = await file.stat();
            if (stat.modified.isBefore(cutoffDate)) {
              await file.delete();
              LogUtil.debug('[FILE] Cleaned up old image: ${file.path}');
            }
          }
        }
      }
      
    } catch (e) {
      LogUtil.error('[FILE] Error during cleanup: $e');
    }
  }

  /// Get total storage usage for images
  Future<int> getTotalStorageUsage() async {
    try {
      int totalSize = 0;
      final directories = [_sarpanchImagesDir, _surveyImagesDir, _photoSectionDir];
      
      for (final dirName in directories) {
        final dir = await _createDirectory(dirName);
        final files = await dir.list().toList();
        
        for (final file in files) {
          if (file is File) {
            final stat = await file.stat();
            totalSize += stat.size;
          }
        }
      }
      
      LogUtil.debug('[FILE] Total image storage usage: ${totalSize / (1024 * 1024)} MB');
      return totalSize;
      
    } catch (e) {
      LogUtil.error('[FILE] Error calculating storage usage: $e');
      return 0;
    }
  }

  /// Clear all offline image files when user logs out
  Future<void> clearAllOfflineFiles() async {
    try {
      final directories = [_sarpanchImagesDir, _surveyImagesDir, _photoSectionDir];
      
      for (final dirName in directories) {
        final dir = await _createDirectory(dirName);
        final files = await dir.list().toList();
        
        for (final file in files) {
          if (file is File) {
            await file.delete();
            LogUtil.debug('[FILE] Deleted offline file: ${file.path}');
          }
        }
      }
      
      LogUtil.debug('[FILE] All offline image files cleared successfully');
    } catch (e) {
      LogUtil.error('[FILE] Error clearing offline files: $e');
    }
  }
}

