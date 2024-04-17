import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/detail_cat_page/widgets/text_input_widget.dart';
import 'package:catbreeds/src/widgets/image_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailCat extends StatefulWidget {
  const DetailCat({super.key, required this.cat});
  final CatModel cat;

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          _getImageCard(width: width, height: height),
          const SizedBox(
            height: spaceBetween10,
          ),
          Expanded(
              child: Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            interactive: true,
            thickness: 4.0,
            radius: const Radius.circular(4.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.cat.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: primaryColorTheme,
                          fontSize: h2Size,
                          fontFamily: fontFamilyMontserrat,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextInputWidget(
                          title: "Descripción: ",
                          content: widget.cat.description),
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                        title: "Origen: ",
                        content: widget.cat.origin,
                        icon: Icons.public_sharp),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Nombre alternativo: ",
                      content: widget.cat.altNames.isNotEmpty
                          ? widget.cat.altNames
                          : "N/A",
                      icon: Icons.alternate_email_outlined,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Inteligencia: ",
                      content: widget.cat.intelligence.toString(),
                      icon: Icons.light_mode_outlined,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Adaptabilidad: ",
                      content: widget.cat.adaptability.toString(),
                      icon: Icons.pattern_sharp,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Energía: ",
                      content: widget.cat.energyLevel.toString(),
                      icon: Icons.stacked_bar_chart_rounded,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Nivel de afecto: ",
                      content: widget.cat.affectionLevel.toString(),
                      icon: Icons.leaderboard_outlined,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Temperamento: ",
                      content: widget.cat.temperament.toString(),
                      icon: Icons.timelapse_rounded,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Problemas de salud: ",
                      content: widget.cat.healthIssues.toString(),
                      icon: Icons.health_and_safety_outlined,
                    ),
                    const SizedBox(height: 2),
                    TextInputWidget(
                      title: "Esperanza de vida: ",
                      content: '${widget.cat.lifeSpan.toString()} años',
                      icon: Icons.monitor_heart_outlined,
                    ),
                    const SizedBox(height: spaceBetween10 * 2),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _getImageCard({required double width, required double height}) {
    return ImageContent(
        height: height * 0.5,
        width: width,
        reference: widget.cat.referenceImageId ?? "");
  }
}
