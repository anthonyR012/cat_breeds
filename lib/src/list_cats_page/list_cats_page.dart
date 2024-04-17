import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/cubit/cat_cubit/cat_cubit.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:catbreeds/src/list_cats_page/widgets/card_cat_widget.dart';
import 'package:catbreeds/src/list_cats_page/widgets/input_text_custom_widget.dart';
import 'package:catbreeds/src/list_cats_page/widgets/silver_app_custom_widget.dart';
import 'package:catbreeds/src/widgets/center_info_widged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCatsPage extends StatefulWidget {
  const ListCatsPage({super.key});

  @override
  State<ListCatsPage> createState() => _ListCatsPageState();
}

class _ListCatsPageState extends State<ListCatsPage> {
  double width = 0;
  double height = 0;
  final ScrollController _scrollController = ScrollController();
  List<CatModel> completeCats = [];
  List<CatModel> filterCats = [];
  final FocusNode focusFilter = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBarCustom(context: context),
          SliverToBoxAdapter(
              child: RefreshIndicator(
                onRefresh: () => Future.value(true),
                child: Padding(
                            padding: const EdgeInsets.all(paddingInput15),
                            child: InputTextWidget(
                width: width * 0.6,
                height: 30,
                onChanged: _filterText,
                focusNode: focusFilter,
                            ),
                          ),
              )),
          BlocProvider.value(
            value: Env.sl<CatCubit>(),
            child: BlocBuilder<CatCubit, CatState>(
              builder: (context, state) {
                bool isLoading =
                    state is! GetCatsLoaded && state is! GetCatsFilterLoaded;
                if (state is CatInitial) {
                  Env.sl<CatCubit>().doGetCats();
                } else if (state is CatError) {
                  return const SliverToBoxAdapter(child: CenterInfoWidget());
                } else if (state is GetCatsLoaded) {
                  completeCats = state.cats;
                } else if (state is GetCatsFilterLoaded) {
                  filterCats = state.cats;
                } else if (state is CatNoFound) {
                  return const SliverToBoxAdapter(
                      child: CenterInfoWidget(
                    description: "No se encontró coincidencias.",
                    imageInfo: imageCat,
                  ));
                }
                if (filterCats.isEmpty) {
                  filterCats = completeCats;
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CardCat(
                        cat: isLoading ? null : filterCats[index],
                        height: height * 0.4,
                        width: width * 0.85,
                        focusFilter: focusFilter,
                        isLoading: isLoading,
                      );
                    },
                    childCount: isLoading ? 4 : filterCats.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _filterText(String value) async {
    final filter = value.toLowerCase();
    List<CatModel> cats = completeCats
        .where((cat) =>
            cat.name.toLowerCase().contains(filter) ||
            cat.origin.toLowerCase().contains(filter))
        .toList();
    if (cats.isEmpty) {
      Env.sl<CatCubit>().setState(CatNoFound());
    } else {
      Env.sl<CatCubit>().setState(GetCatsFilterLoaded(cats));
    }
  }
}
