import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'home_page_data_source.dart';

class HomePageDataSourceImpl extends HomePageDataSource {
  final Dio _dio;
  final FirebaseFirestore _firestore;
  HomePageDataSourceImpl(this._dio, this._firestore);
}
