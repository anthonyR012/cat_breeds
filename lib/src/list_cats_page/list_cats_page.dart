import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/cubit/cat_cubit/cat_cubit.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/list_cats_page/widgets/silver_app_custom_widget.dart';
import 'package:catbreeds/src/widgets/center_info_widged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCatsPage extends StatelessWidget {
  const ListCatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverAppBarCustom(context: context),
    );
  }
}
