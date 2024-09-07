import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureCustom extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const SvgPictureCustom({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      package: "{{name}}",
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}

class ImagePictureCustom extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImagePictureCustom({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      key: key,
      path,
      package: "{{name}}",
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
