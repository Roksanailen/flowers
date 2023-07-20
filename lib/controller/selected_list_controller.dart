import 'package:get/get.dart';

class SelectedListController extends GetxController {
   var selectedlist = List <String>.empty(growable: true).obs;
   getselectedlist()=>selectedlist;
   setselectedlist(List<String>list)=>selectedlist.value=list;
 }