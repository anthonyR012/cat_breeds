import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageContent extends StatelessWidget {
  const ImageContent(
      {super.key,
      this.isLoading = false,
      required this.height,
      required this.width,
      required this.url});
  final double height;
  final double width;
  final String url;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Widget loadWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          "$pathManagementJson$animationLoad",
          width: 90,
          height: 90,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
          fit: BoxFit.fill,
        ),
      ],
    );
    Widget errorWidget = Image.asset(
      '$pathManagementImages$imageNoFound',
      fit: BoxFit.scaleDown,
    );
    return SizedBox(
        height: height,
        width: width,
        child: url.isNotEmpty
            ? Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress != null ? loadWidget : child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return errorWidget;
                },
              )
            : isLoading
                ? loadWidget
                : errorWidget);
  }
}
