import 'dart:ui';

import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/cubit/cat_cubit/cat_cubit.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/list_cats_page/widgets/card_cat_widget.dart';
import 'package:catbreeds/src/list_cats_page/widgets/input_text_custom_widget.dart';
import 'package:catbreeds/src/widgets/center_info_widged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeletonizer/skeletonizer.dart';

class SliverAppBarCustom extends StatefulWidget {
  const SliverAppBarCustom({
    super.key,
    this.pinned = true,
    this.floating = true,
    required this.context,
  });

  final bool pinned;
  final bool floating;
  final BuildContext context;

  @override
  State<SliverAppBarCustom> createState() => _SliverAppBarCustomState();
}

class _SliverAppBarCustomState extends State<SliverAppBarCustom> {
  bool _pinned = true;
  bool _floating = true;
  double width = 0;
  double height = 0;
  double lastPixelRegistered = 0;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  List<CatModel> cats = [];

  @override
  void initState() {
    super.initState();
    _pinned = widget.pinned;
    _floating = widget.floating;
    width = MediaQuery.of(widget.context).size.width;
    height = MediaQuery.of(widget.context).size.height;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPersistentHeader(
            pinned: _pinned,
            floating: _floating,
            delegate: _SliverAppBarDelegate(
              maxHeight: 120,
              minHeight: 70,
              child: (value) {
                return Container(
                  padding: const EdgeInsets.only(top: paddingInput15 * 2),
                  decoration:const  BoxDecoration(
                      color: secondaryColorTheme,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 3,
                            color: Colors.black26)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titleApp,
                        style: TextStyle(
                            fontFamily: fontFamilyMontserrat,
                            fontWeight: FontWeight.bold,
                            fontSize: lerpDouble(h2Size, h4Size + 2, value)),
                      ),
                      const SizedBox(width: spaceBetween10),
                      Image.asset('$pathManagementImages$imageCat',
                      width: lerpDouble(50, 30, value),)
                    ],
                  ),
                );
              },
            )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(paddingInput15),
          child: InputTextWidget(
            width: width * 0.6,
            height: 30,
            onChanged: (p0) {
              
            },
            controller:_textEditingController,
          ),
        )),
        BlocProvider.value(
          value: Env.sl<CatCubit>(),
          child: BlocBuilder<CatCubit, CatState>(
            builder: (context, state) {
              bool isLoading = state is! GetCatsLoaded;
              if (state is CatInitial) {
                Env.sl<CatCubit>().doGetCats();
              } else if (state is CatError) {
                return const SliverToBoxAdapter(child: CenterInfoWidget());
              } else if (state is GetCatsLoaded) {
                cats = state.cats;
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CardCat(
                      cat: isLoading ? null : cats[index],
                      height: height * 0.4,
                      width: width,
                      isLoading: isLoading,
                    );
                  },
                  childCount: isLoading ? 4 : cats.length,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget Function(double) child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child(shrinkOffset / maxHeight));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
