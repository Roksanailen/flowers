import 'dart:developer';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'https';
  final _host = "flowers-backend.onrender.com";
  // final _host = '192.168.243.1';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: _port,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

  Uri login() => _mainUri(path: 'auth/local');

  Uri register() => _mainUri(path: 'auth/local/register');

  Uri changePassword() => _mainUri(path: 'auth/change-password');

  Uri getAllProducts({Map<String, String>? params}) =>
      _mainUri(path: 'flowers', queryParameters: params);
  Uri getAllTypes({Map<String, String>? params}) =>
      _mainUri(path: 'types', queryParameters: params);
  Uri getAllCategories({Map<String, String>? params}) =>
      _mainUri(path: 'categories', queryParameters: params);
  Uri getMyOrders({Map<String, String>? params}) =>
      _mainUri(path: 'orders', queryParameters: params);
  Uri completeOrder({required int id}) => _mainUri(path: 'orders/deliverd/$id');
}
