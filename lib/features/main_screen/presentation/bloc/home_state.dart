part of 'home_bloc.dart';

enum GetOffersStatus { loading, failed, success, init }
enum GetFlowersStatus { loading, failed, success, init }
enum GetPlantsStatus { loading, failed, success, init }
enum GetGiftsStatus { loading, failed, success, init }

class HomeState {
  final List<ProductModel> offersProducts;
  final List<ProductModel> flowers;
  final List<ProductModel> plants;
  final List<ProductModel> gifts;
  final GetFlowersStatus getFlowersStatus;
  final GetOffersStatus getOffersStatus;
  final GetGiftsStatus getGiftsStatus;
  final GetPlantsStatus getPlantsStatus;
  const HomeState({
    this.offersProducts = const [],
    this.flowers = const [],
    this.plants = const [],
    this.gifts = const [],
    this.getFlowersStatus = GetFlowersStatus.init,
    this.getGiftsStatus = GetGiftsStatus.init,
    this.getOffersStatus = GetOffersStatus.init,
    this.getPlantsStatus = GetPlantsStatus.init,
  });

  HomeState copyWith({
    List<ProductModel>? offersProducts,
    List<ProductModel>? flowers,
    List<ProductModel>? plants,
    List<ProductModel>? gifts,
    GetFlowersStatus? getFlowersStatus,
    GetOffersStatus? getOffersStatus,
    GetGiftsStatus? getGiftsStatus,
    GetPlantsStatus? getPlantsStatus,
  }) {
    return HomeState(
      offersProducts: offersProducts ?? this.offersProducts,
      flowers: flowers ?? this.flowers,
      plants: plants ?? this.plants,
      gifts: gifts ?? this.gifts,
      getFlowersStatus: getFlowersStatus ?? this.getFlowersStatus,
      getOffersStatus: getOffersStatus ?? this.getOffersStatus,
      getGiftsStatus: getGiftsStatus ?? this.getGiftsStatus,
      getPlantsStatus: getPlantsStatus ?? this.getPlantsStatus,
    );
  }
}
