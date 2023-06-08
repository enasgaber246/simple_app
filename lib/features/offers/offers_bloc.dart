import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_base_project/networking/api_client/api_client.dart';
import 'package:simple_base_project/networking/models/products_response.dart';

class OffersBloc extends Bloc<ModelsEvent, ModelsState> {
  OffersBloc() : super(LoadingModelsState());

  @override
  Stream<ModelsState> mapEventToState(ModelsEvent event) async* {
    if (event is LoadModelsEvent) {
      yield LoadingModelsState();

      try {
        ProductsResponse response = ProductsResponse.fromJson(
            await APIClient().getHttp('offers-in-category/${event.category}'));

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
  final String category;

  LoadModelsEvent(this.mContext, this.category);
}

// States
abstract class ModelsState {}

class LoadingModelsState extends ModelsState {}

class LoadedModelsState extends ModelsState {
  ProductsResponse response;

  LoadedModelsState({required this.response});
}

class FailedModelsState extends ModelsState {}
