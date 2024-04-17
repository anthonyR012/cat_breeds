import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/end_point_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardCat extends StatelessWidget {
  const CardCat(
      {super.key,
      required this.cat,
      required this.isLoading,
      required this.width,
      required this.height});
  final CatModel? cat;
  final bool isLoading;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        padding: const EdgeInsets.all(paddingInput15),
        width: width * 0.85,
        height: height,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(paddingInput15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(isLoading ? (loadingData * 2) : cat!.name),
                    Spacer(),
                    Text("Mas..."),
                  ],
                ),
                const SizedBox(
                  height: spaceBetween10,
                ),
                _getImageCard(height: height, width: width),
                const SizedBox(
                  height: spaceBetween10,
                ),
                Row(children: [
                  Text(isLoading ? (loadingData * 2) : cat!.origin),
                  Spacer(),
                  Text(isLoading
                      ? (loadingData * 2)
                      : cat!.intelligence.toString()),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getImageCard({required double width, required double height}) {
    if (cat == null) {
      return const SizedBox();
    }
    return SizedBox(
      height: height * 0.6,
      width: width,
      child: Image.network(
          getImageUrl.replaceAll(
              "[referenceImage]", cat!.referenceImageId ?? ""),
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress != null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : child;
      }, errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          '$pathManagementImages$imageNoFound',
          fit: BoxFit.scaleDown,
        );
      }),
    );
  }
}
