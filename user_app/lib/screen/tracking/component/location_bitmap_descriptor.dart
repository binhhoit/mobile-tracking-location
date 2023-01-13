import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LocationBitmapDescriptor on BitmapDescriptor {
  static Future<BitmapDescriptor> makeMarkerIcon({
    required String imageUrl,
    Size size = const Size(150, 150),
    required int? badge,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = Colors.green;
    const double tagWidth = 50.0;

    final Paint shadowPaint = Paint()..color = Colors.green.withAlpha(100);
    const double shadowWidth = 20.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    const double borderWidth = 3.0;

    const double imageOffset = shadowWidth + borderWidth;

    // Add shadow circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth, size.width - (shadowWidth * 2),
              size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);
    if (badge != null) {
      // Add tag circle
      canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width - tagWidth, 0.0, tagWidth, tagWidth),
            topLeft: radius,
            topRight: radius,
            bottomLeft: radius,
            bottomRight: radius,
          ),
          tagPaint);

      // Add tag text

      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: '$badge',
        style: const TextStyle(fontSize: 30.0, color: Colors.white),
      );

      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(size.width - tagWidth / 2 - textPainter.width / 2,
              tagWidth / 2 - textPainter.height / 2));
    }

    // Oval for the image
    Rect oval = Rect.fromLTWH(
        imageOffset, imageOffset, size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await _loadAndCacheImage(imageUrl);
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.cover);

    // Convert canvas to image
    final ui.Image markerAsImage =
        await pictureRecorder.endRecording().toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? uint8List = byteData?.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List!);
  }

  static Future<ui.Image> _loadAndCacheImage(String imageURL) async {
    File imageFile = await DefaultCacheManager().getSingleFile(imageURL);
    Uint8List imageBytes = imageFile.readAsBytesSync();
    return decodeImageFromList(imageBytes);
  }
}
