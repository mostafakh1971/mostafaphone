import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/components.dart';
import 'package:flutter_mobile/cubit/app_cubit.dart';
import 'package:flutter_mobile/screens/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text("MostafakhPhone"),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              centerTitle: true,
            ),
            body: BuildCondition(
              condition:
                  cubit.brandLogosModel != null && cubit.categoryModel != null,
              builder: (context) => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  CarouselSlider(
                    items: cubit.brandLogosModel?.images
                        .map((e) => Image.network(e,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress != null
                                    ? Image.asset(
                                        "images/gifb.gif",
                                        fit: BoxFit.cover,
                                      )
                                    : child,
                            //fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset("images/R.jpg")))
                        .toList(),
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 1.0),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: cubit.categoryModel!.categories.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        cubit.getAllbrands(
                            category: cubit.categoryModel?.categories[index]);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoriesScreen(
                            category: cubit.categoryModel?.categories[index],
                          ),
                        ));
                      },
                      child: Hero(
                          tag: cubit.categoryModel?.categories[index],
                          child: buildGridItem(
                              cubit.categoryModel?.categories[index])),
                    ),
                    shrinkWrap: true,
                  )
                ]),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
