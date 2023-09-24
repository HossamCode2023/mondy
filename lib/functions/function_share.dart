 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareScreenShot ({
    required BuildContext context , 
    required Widget shareWidget})async {
      final box = context.findRenderObject() as RenderBox?; 
      ScreenshotController().captureFromWidget(shareWidget).then((Uint8List bytes)async {
        final Directory dir =  await getApplicationSupportDirectory();
        final String ts = DateTime.now().millisecondsSinceEpoch.toString();
        final String filePath = "${dir.path}/$ts.png";
        await XFile.fromData(bytes).saveTo(filePath);
        await Share.shareXFiles(
          [XFile(filePath)],
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
        );

      });
  }