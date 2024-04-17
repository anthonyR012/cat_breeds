import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:flutter/material.dart';

class CenterInfoWidget extends StatelessWidget {
  const CenterInfoWidget(
      {super.key,
      this.retryTap,
      this.imageInfo = imageNoWifi,
      this.description = sentencesNoInternet});
  final String imageInfo;
  final String description;
  final void Function()? retryTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('$pathManagementImages$imageInfo'),
          ),
          Text(description,
              style: const TextStyle(
                fontFamily: fontFamilyMontserrat,
                color: blackColorTheme,
                fontWeight: FontWeight.bold,
                fontSize: h3Size,
              )),
          const SizedBox(height: spaceBetween10),
          Visibility(
            visible: retryTap != null,
            child: InkWell(
              onTap: retryTap,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: glamGradientTheme),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Intertar de nuevo",
                        style: TextStyle(
                          color: whiteColorTheme,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.refresh,
                        color: whiteColorTheme,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
