import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowers/core/models/products_model.dart';
import 'package:flowers/dependency_injection.dart';

import '../../../../core/bloc/language_bloc.dart';
import '../../../products/requests/products_requests.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetHomeFlowersEvent>(_mapGetFlowersEventToState);
    on<GetHomeGiftsEvent>(_mapGetGiftsEventToState);
    on<GetHomePlantsEvent>(_mapGetPlantsEventToState);
    on<GetHomeOffersEvent>(_mapGetOffersEventToState);
  }

  FutureOr<void> _mapGetFlowersEventToState(event, emit) async {
    emit(state.copyWith(getFlowersStatus: GetFlowersStatus.loading));
    final result = await ProductsRepository().getProductsByCategory(
        GetProductsParams(
            typeId: serviceLocator<LanguageBloc>().state.locale?.languageCode ==
                    'ar'
                ? 11
                : 8));
    result.fold(
        (l) => emit(state.copyWith(getFlowersStatus: GetFlowersStatus.failed)),
        (r) => emit(state.copyWith(
            getFlowersStatus: GetFlowersStatus.success, flowers: r.data!)));
  }

  FutureOr<void> _mapGetPlantsEventToState(event, emit) async {
    emit(state.copyWith(getPlantsStatus: GetPlantsStatus.loading));
    final result = await ProductsRepository().getProductsByCategory(
        GetProductsParams(
            typeId: serviceLocator<LanguageBloc>().state.locale?.languageCode ==
                    'ar'
                ? 13
                : 10));
    result.fold(
        (l) => emit(state.copyWith(getPlantsStatus: GetPlantsStatus.failed)),
        (r) => emit(state.copyWith(
            getPlantsStatus: GetPlantsStatus.success, plants: r.data!)));
  }

  FutureOr<void> _mapGetGiftsEventToState(event, emit) async {
    emit(state.copyWith(getGiftsStatus: GetGiftsStatus.loading));
    final result = await ProductsRepository().getProductsByCategory(
        GetProductsParams(
            typeId: serviceLocator<LanguageBloc>().state.locale?.languageCode ==
                    'ar'
                ? 12
                : 9));
    result.fold(
        (l) => emit(state.copyWith(getGiftsStatus: GetGiftsStatus.failed)),
        (r) => emit(state.copyWith(
            getGiftsStatus: GetGiftsStatus.success, gifts: r.data!)));
  }

  FutureOr<void> _mapGetOffersEventToState(event, emit) async {
    emit(state.copyWith(getOffersStatus: GetOffersStatus.loading));
    final result = await ProductsRepository()
        .getProductsByCategory(GetProductsParams(isOffer: true));
    result.fold(
        (l) => emit(state.copyWith(getOffersStatus: GetOffersStatus.failed)),
        (r) => emit(state.copyWith(
            getOffersStatus: GetOffersStatus.success,
            offersProducts: r.data!)));
  }
}
