import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/models/brand_logos_model.dart';
import 'package:flutter_mobile/models/brand_model.dart';
import 'package:flutter_mobile/models/category_model.dart';
import 'package:flutter_mobile/utils/dio_helper.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);

  BrandLogosModel? brandLogosModel;

  getBrandsLogos() {
    emit(GetBrandsLogosLoadingState());
    DioHelper.get(path: "all/brandlogos").then((value) {
      brandLogosModel = BrandLogosModel.fromJson(value?.data["data"]);
      print(brandLogosModel?.images[0]);
      emit(GetBrandsLogosSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBrandsLogosFailureState());
    });
  }

  CategoryModel? categoryModel;
  getCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.get(path: "all/categories").then((value) {
      categoryModel = CategoryModel.fromJson(value?.data["data"]);
      print(categoryModel?.categories[0]);
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesFailureState());
    });
  }

  BrandModel? brandModel;
  getAllbrands({required String category}) {
    brandModel = null;
    emit(GetBrandsLoadingState());
    DioHelper.get(path: "all/brands", query: {"category": category})
        .then((value) {
      brandModel = BrandModel.fromJson(value?.data["data"]);
      print(brandModel?.brands[0]);
      emit(GetBrandsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBrandsFailureState());
    });
  }
}
