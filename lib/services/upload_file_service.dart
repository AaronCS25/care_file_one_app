import 'dart:io';

import 'package:care_file_one/services/crypto_name_services.dart';
import 'package:care_file_one/services/s3_service.dart';
import 'package:path/path.dart' as path;

class UploadFileService {
  Future<String> uploadFile(File file) async {
    final S3UploadService s3uploadService = S3UploadService();
    final CryptoNameService cryptoNameService = CryptoNameService();

    try {
      String fileName = path.basename(file.path);
      String fileExtension = path.extension(file.path);
      String fileNameCrypto =
          cryptoNameService.encryptName(fileName, fileExtension, '1');
      await s3uploadService.uploadFile(file, fileNameCrypto);
      return fileNameCrypto;
    } catch (error) {
      throw AssertionError('Upload File Failed!');
    }
  }
}
