import 'package:dio/dio.dart';

import 'home_page_data_source.dart';

class HomePageDataSourceImpl extends HomePageDataSource {
  final Dio _dio;
  HomePageDataSourceImpl(this._dio);
}
