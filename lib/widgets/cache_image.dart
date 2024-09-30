// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/images.dart';
import 'package:shimmer/shimmer.dart';

Widget cachedImage(String? image, double width, double height,
    {bool? circle_shape, String? badimage}) {
  return CachedNetworkImage(
    imageUrl: image.toString(),
    imageBuilder: (context, imageProvider) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: circle_shape == true ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              shape:
                  circle_shape == true ? BoxShape.circle : BoxShape.rectangle,
              color: Colors.grey[100]),
          width: width,
          height: height,
        )),
    errorWidget: (context, url, error) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: circle_shape == true ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(badimage ?? badImage),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
