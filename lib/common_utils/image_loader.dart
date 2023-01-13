import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageLoader {
  static CachedNetworkImage loadCachedNetworkImage(String url,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(12),
        child: Opacity(
          opacity: 0.6,
          child: FlutterLogo(),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: EdgeInsets.all(3.w),
        child: const Opacity(
          opacity: 0.6,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
