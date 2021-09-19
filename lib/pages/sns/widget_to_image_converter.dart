import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class WidgetToImageConverter {
  Future<ByteData?> exportToImage(GlobalKey globalKey) async {
    ui.Image image;
    bool catched = false;
    final RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    try {
      final image = await boundary.toImage(
        pixelRatio: 3,
      );
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      catched = true;
      return byteData;
    } catch (exception) {
      catched = false;

      await Future.delayed(
        const Duration(milliseconds: 1),
      );
      return await exportToImage(globalKey);
    }
  }
}
