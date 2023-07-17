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
Uri login()=>_mainUri(path: 'auth/local');
  Uri getAllProducts(params)=>_mainUri(path: 'flowers', queryParameters: params)
  ;
}
