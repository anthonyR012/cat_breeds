import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/config/functions/navigator_widgets_function.dart';
import 'package:catbreeds/cubit/cat_cubit/cat_cubit.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/detail_cat_page/detail_cat_page.dart';
import 'package:catbreeds/src/widgets/image_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardCat extends StatefulWidget {
  const CardCat(
      {super.key,
      required this.cat,
      required this.isLoading,
      required this.width,
      required this.focusFilter,
      required this.height});
  final CatModel? cat;
  final bool isLoading;
  final double height;
  final double width;
  final FocusNode focusFilter;

  @override
  State<CardCat> createState() => _CardCatState();
}

class _CardCatState extends State<CardCat> {
  String urlImage = "";
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.isLoading,
      child: Container(
        padding: const EdgeInsets.all(paddingInput15 - 5),
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: (widget.height * 0.7) - paddingInput15,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(rounded28),
                                  topRight: Radius.circular(rounded28))),
                          child: _getImageCard(
                              height: widget.height, width: widget.width))),
                  Positioned.fill(
                      child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(rounded28),
                            topRight: Radius.circular(rounded28))),
                  )),
                  Positioned(
                    top: 0,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(paddingInput5),
                      width: widget.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: widget.width / 2.2,
                            child: Text(
                              widget.isLoading
                                  ? (loadingData * 2)
                                  : widget.cat!.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: whiteColorTheme,
                                  fontFamily: fontFamilyMontserrat,
                                  fontSize: h2Size,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          _getLabelButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: secondaryColorTheme,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(rounded28),
                      bottomRight: Radius.circular(rounded28))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  SizedBox(
                    width: widget.width / 2,
                    child: Text(
                      widget.isLoading ? (loadingData * 2) : widget.cat!.origin,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: fontFamilyMontserrat,
                          fontWeight: FontWeight.bold,
                          fontSize: messageSize),
                    ),
                  ),
                  const Spacer(),
                  Text(
                      widget.isLoading
                          ? (loadingData * 2)
                          : "Inteligencia: ${widget.cat!.intelligence}",
                      style: const TextStyle(
                          fontFamily: fontFamilyMontserrat,
                          fontWeight: FontWeight.bold,
                          fontSize: messageSize)),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Skeleton _getLabelButton(BuildContext context) {
    return Skeleton.leaf(
      enabled: widget.isLoading,
      child: InkWell(
        onTap: () {
          if (widget.cat == null) return;
          widget.focusFilter.unfocus();
          pushWidget(DetailCat(cat: widget.cat!, urlImage: urlImage), context);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: whiteColorTheme),
              borderRadius: const BorderRadius.all(Radius.circular(rounded28))),
          child: const Row(
            children: [
              Text(
                "Mas",
                style: TextStyle(
                    fontFamily: fontFamilyHind,
                    fontSize: messageSize,
                    color: whiteColorTheme),
              ),
              SizedBox(width: 2),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: whiteColorTheme,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageCard({required double width, required double height}) {
    if (widget.cat == null) {
      return const SizedBox();
    }
    return FutureBuilder<String>(
        future: _getImageUrl(widget.cat!.referenceImageId ?? ""),
        builder: (context, snapshot) {
          bool isLoading = snapshot.connectionState == ConnectionState.waiting;
          if (snapshot.hasData) {
            urlImage = snapshot.data!;
          }
          return ImageContent(
            height: height,
            width: width,
            url: urlImage,
            isLoading: isLoading,
          );
        });
  }

  Future<String> _getImageUrl(String reference) async {
    final state = await Env.sl<CatCubit>().getImage(referenceImage: reference);
    String url = "";
    if (state is GetImageCatLoaded) {
      url = state.image.url ?? "";
    }
    return url;
  }
}
