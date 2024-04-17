
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/widgets/image_content_widget.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 50,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }

  Widget _getImageCard({required double width, required double height}) {
    return ImageContent(
        height: height * 0.5,
        width: width ,
        reference: widget.cat.referenceImageId ?? "");
  }
}
