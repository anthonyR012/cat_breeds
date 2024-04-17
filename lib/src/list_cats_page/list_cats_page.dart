
import 'package:catbreeds/src/list_cats_page/widgets/silver_app_custom_widget.dart';
import 'package:flutter/material.dart';

class ListCatsPage extends StatelessWidget {
  const ListCatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverAppBarCustom(context: context),
    );
  }
}
