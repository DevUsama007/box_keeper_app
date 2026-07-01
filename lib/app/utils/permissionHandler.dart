import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestStoragePermissions() async {
    PermissionStatus storageStatus = await Permission.storage.status;
    PermissionStatus photosStatus = await Permission.photos.status;

    if (photosStatus.isGranted) {
      return true;
    }

    // storageStatus = await Permission.storage.request();
    photosStatus = await Permission.photos.request();

    return photosStatus.isGranted;
  }

  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
}
