import 'dart:ui';

import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _pinned = widget.pinned;
    _floating = widget.floating;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: _pinned,
        floating: _floating,
        delegate: _SliverAppBarDelegate(
          maxHeight: 120,
          minHeight: 70,
          child: (value) {
            return Container(
              padding: const EdgeInsets.only(top: paddingInput15 * 2),
              decoration: const BoxDecoration(
                  color: secondaryColorTheme,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4, spreadRadius: 3, color: Colors.black26)
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
                  Image.asset(
                    '$pathManagementImages$imageCat',
                    width: lerpDouble(50, 30, value),
                  )
                ],
              ),
            );
          },
        ));
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
