import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_base_project/features/categories/categories_widget.dart';
import 'package:simple_base_project/features/offers/offers_bloc.dart';
import 'package:simple_base_project/networking/models/products_response.dart';
import 'package:simple_base_project/utils/app_colors.dart';
import 'package:simple_base_project/utils/app_strings.dart';
import 'package:simple_base_project/widgets/bar_widget.dart';
import 'package:simple_base_project/widgets/cards/main_card.dart';
import 'package:simple_base_project/widgets/lable.dart';
import 'package:simple_base_project/widgets/place_holder_error.dart';
import 'package:simple_base_project/widgets/progress_loading.dart';

class OffersScreen extends StatefulWidget {
  final Function? onMenuTap;
  final Function? onNotificationTap;

  const OffersScreen({super.key, this.onMenuTap, this.onNotificationTap});

  @override
  State<StatefulWidget> createState() {
    return OffersScreenState();
  }
}

class OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BarWidget(
                rightIcon: 'assets/images/menu.svg',
                leftIcon: 'assets/images/notification.svg',
                isBorder: true,
                padding: 12,
                islogo: false,
                lable: 'offers'.tr,
                rotate: 1,
                onPressedRight: () {
                  widget.onMenuTap!();
                },
                onPressedLeft: () {
                  widget.onNotificationTap!();
                },
              ),
              Lable(
                'offers_on_products'.tr,
                Theme.of(context).textTheme.titleLarge!.merge(
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: AppColors.black),
                ),
                vertical: 5.0,
                horizantal: 20.0,
              ),
              CategoriesWidget(
                onTap: (String slug) {
                  bloc.add(LoadModelsEvent(context, slug));
                },
              ),
              offersBloc(AppStrings.all_products),
            ],
          ),
        ));
  }

  OffersBloc bloc = OffersBloc();

  Widget offersBloc(String category) {
    return BlocProvider<OffersBloc>(
        create: (context) => bloc..add(LoadModelsEvent(context, category)),
        child: BlocBuilder<OffersBloc, ModelsState>(builder: (context, state) {
          if (state is LoadingModelsState) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: const ProgressLoading(),
              ),
            );
          } else if (state is LoadedModelsState) {
            return dataList(state.response);
          } else if (state is FailedModelsState) {
            return const PlaceHolderError();
          } else {
            return const PlaceHolderError();
          }
        }));
  }

  Widget dataList(ProductsResponse response){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: GridView.builder(
          itemCount: (response.data?.length ?? 0),
          itemBuilder: (context, index) =>
              MainCard(data: response.data![index]),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
