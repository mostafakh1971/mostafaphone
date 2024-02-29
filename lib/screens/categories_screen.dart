import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/components.dart';
import 'package:flutter_mobile/cubit/app_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.category});
  String category;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Hero(tag: category, child: Text(category)),
              centerTitle: true,
            ),
            body: BuildCondition(
              condition: cubit.brandModel != null,
              builder: (context) => GridView.builder(
                itemCount: cubit.brandModel!.brands.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    buildGridItem(cubit.brandModel?.brands[index]),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
