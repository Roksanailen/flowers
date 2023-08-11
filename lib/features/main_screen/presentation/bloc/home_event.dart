part of 'home_bloc.dart';

 abstract class HomeEvent  {
  const HomeEvent();

}

class GetHomeFlowersEvent extends HomeEvent{}
class GetHomeGiftsEvent extends HomeEvent{}
class GetHomeOffersEvent extends HomeEvent{}
class GetHomePlantsEvent extends HomeEvent{}