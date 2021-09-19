/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habituation_coationg_app/pages/sns/widget_to_image_converter.dart';

class ShareProvider {
  Future<void> shareImageAndText(String text, GlobalKey globalKey) async {
    final ByteData? bytes =
        await WidgetToImageConverter().exportToImage(globalKey);
    await Share.file(
        'shared image', 'share.png', bytes?.buffer.asUint8List(), 'image/png',
        text: text);
  }
}
*/
