import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data/common/exceptions.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    var netWorkStatus = await Connectivity().checkConnectivity();
    if (netWorkStatus == ConnectivityResult.none) throw ConnectionException();
    return super.onRequest(options, handler);
  }

}