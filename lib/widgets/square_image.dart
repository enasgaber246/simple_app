import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SquareImage extends StatelessWidget {
  final String imgPath;
  double width = 96;
  double height = 96;
  double margin = 10.0;
  double radius = 8.0;
  final BoxFit? fit;
  final Color? color;

  SquareImage(
    this.imgPath, {
    super.key,
    this.width = 96,
    this.height = 96,
    this.margin = 10.0,
    this.radius = 8.0,
    this.fit = BoxFit.cover,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: (imgPath.contains('http'))
          ? ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                imgPath,
                fit: fit,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    imgPath,
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.asset(
                imgPath,
                fit: fit,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    imgPath,
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
    );
  }
}
