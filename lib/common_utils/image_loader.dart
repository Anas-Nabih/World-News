import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

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
      placeholder: (context, url) => Padding(
        padding: const EdgeInsets.all(12),
        child: Opacity(
          opacity: 0.6,
          child: SvgPicture.asset("assets/svg/logo.svg"),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: EdgeInsets.all(3.w),
        child:Opacity(
          opacity: 0.6,
          child: SvgPicture.asset("assets/svg/logo.svg"),
        ),
      ),
    );
  }

  static loadImage(String img){
    return Image.asset(img,fit: BoxFit.cover,height: double.infinity,);
  }
}
