import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/config/functions/navigator_widgets_function.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/detail_cat_page/detail_cat_page.dart';
import 'package:catbreeds/src/widgets/image_content_widget.dart';
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
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (cat == null) return;
                        pushWidget(DetailCat(cat: cat!), context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: appBarColorTheme),
                            borderRadius:const 
                                BorderRadius.all(Radius.circular(rounded28))),
                        child: const Row(
                          children: [
                            Text(
                              "Mas",
                              style: TextStyle(
                                  fontFamily: fontFamilyHind,
                                  fontSize: messageSize,
                                  color: appBarColorTheme),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14,
                              color: appBarColorTheme,
                            )
                          ],
                        ),
                      ),
                    ),
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
                  const Spacer(),
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
    return ImageContent(
        height: height * 0.56,
        width: width * 0.9,
        reference: cat!.referenceImageId ?? "");
  }
}
