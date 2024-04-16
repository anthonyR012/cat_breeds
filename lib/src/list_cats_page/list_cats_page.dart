import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/cubit/cat_cubit/cat_cubit.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCatsPage extends StatelessWidget {
  const ListCatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: Env.sl<CatCubit>(),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            List<CatModel> cats = [];
            bool isLoading = state is! GetCatsLoaded;
            if (state is CatInitial) {
              Env.sl<CatCubit>().doGetCats();
            } else if (state is CatError) {
            } else if (state is GetCatsLoaded) {
              cats = state.cats;
            }
            return isLoading
                ? Center(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(cats[index].name);
                      },
                      itemCount: cats.length,
                    ),
                )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
