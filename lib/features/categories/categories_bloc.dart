import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_base_project/networking/api_client/api_client.dart';
import 'package:simple_base_project/networking/models/categories_response.dart';
import 'package:simple_base_project/utils/app_strings.dart';

class CategoriesBloc extends Bloc<ModelsEvent, ModelsState> {
  CategoriesBloc() : super(LoadingModelsState());

  @override
  Stream<ModelsState> mapEventToState(ModelsEvent event) async* {
    if (event is LoadModelsEvent) {
      yield LoadingModelsState();

      try {
        CategoriesResponse? response = CategoriesResponse.fromJson(
            await APIClient().getHttp(AppStrings.categories));

        yield LoadedModelsState(response: response);
      } catch (e) {
        if (kDebugMode) {
          print('LoadedModelsHomeResponse Error :  $e');
        }
        yield FailedModelsState();
      }
    }
  }
}

// Event
class ModelsEvent {}

class LoadModelsEvent extends ModelsEvent {
  final BuildContext mContext;

  LoadModelsEvent(this.mContext);
}

// States
abstract class ModelsState {}

class LoadingModelsState extends ModelsState {}

class LoadedModelsState extends ModelsState {
  CategoriesResponse response;

  LoadedModelsState({required this.response});
}

class FailedModelsState extends ModelsState {}
