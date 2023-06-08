import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_base_project/features/categories/categories_bloc.dart'
    as categories_bloc;
import 'package:simple_base_project/networking/models/home_response.dart';
import 'package:simple_base_project/utils/app_colors.dart';
import 'package:simple_base_project/widgets/lable.dart';
import 'package:simple_base_project/widgets/progress_loading.dart';

class CategoriesWidget extends StatefulWidget {
  final Function(String slug) onTap;

  const CategoriesWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return categoriesBloc();
  }

  Widget categoriesBloc() {
    return BlocProvider<categories_bloc.CategoriesBloc>(
        create: (context) => categories_bloc.CategoriesBloc()
          ..add(categories_bloc.LoadModelsEvent(context)),
        child: BlocBuilder<categories_bloc.CategoriesBloc,
            categories_bloc.ModelsState>(builder: (context, state) {
          if (state is categories_bloc.LoadingModelsState) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(8.0.sp),
                child: const ProgressLoading(),
              ),
            );
          } else if (state is categories_bloc.LoadedModelsState) {
            return categoriesList(state.response.data ?? []);
          } else {
            return const SizedBox();
          }
        }));
  }

  int selectedIndex = -1;

  Widget categoriesList(List<Categories> items) {
    return Container(
        height: 52.h,
        margin: EdgeInsets.symmetric(vertical: 0.h),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap((items[index].slug ?? ''));
            },
            child: categoryCard(items[index], index),
          ),
        ));
  }

  Widget categoryCard(Categories data, int index) {
    return Lable(
      data.name ?? '',
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color:
            (selectedIndex == index) ? AppColors.mid_yellow : AppColors.black,
      ),
      textAlign: TextAlign.center,
      alignment: Alignment.center,
      horizantal: 8,
    );
  }
}
