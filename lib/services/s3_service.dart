import 'dart:io';

import 'package:aws_s3_upload/aws_s3_upload.dart';

class S3UploadService {
  Future<void> uploadFile(File file, String uploadFileName) async {
    await AwsS3.uploadFile(
      accessKey: 'AKIA2B4FUUWXMGIICD22',
      secretKey: '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',
      file: File(file.path),
      bucket: 'carefileone-recetas',
      region: 'us-east-1',
      key: uploadFileName,
    );
  }
}
