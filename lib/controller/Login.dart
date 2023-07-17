import 'package:flutter/cupertino.dart';
import 'package:flutter_appflowers/core/global_functions.dart';
import 'package:flutter_appflowers/core/unified_api/api_variables.dart';
import 'package:flutter_appflowers/core/unified_api/post_api.dart';
import 'package:get/get.dart';
class LoginController extends GetxController{
  final usernameController = TextEditingController().obs;

  final passwordController= TextEditingController().obs;
  bool isLoading=false;
  void login()async {
    isLoading=true;
    final loginModel = await LoginRequests().login(usernameController.value, passwordController.value) ;
    if(loginModel!=null)
{
  GlobalFunctions().setUserInfo(user: loginModel);
  isLoading=false;
}

  }

}
class LoginRequests{
  Future<LoginModel> login(username,password)async{
    PostApi postApi=PostApi(uri: ApiVariables().login(), body: {"identifier":username, "password":password}, fromJson: loginModelFromJson);
    final result= await postApi.callRequest();
return result;
  }


}