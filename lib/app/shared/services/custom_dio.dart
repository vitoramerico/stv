import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:stv/app/shared/repositories/local_storage/local_storage.dart';

import 'interceptors/auth_interceptors.dart';

class CustomDio extends DioForNative{
  
  CustomDio(LocalStorage storage) {
    options  = BaseOptions(baseUrl: 'https://api.themoviedb.org');
    interceptors.add(AuthInterceptor(storage));    
  }
}