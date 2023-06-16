import 'package:baseproject/src/signup/data/source/signup_remote_date_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../start/di/start_page_providers.dart';
import '../data/signup_repository_impl.dart';
import '../data/source/signup_data_source.dart';
import '../domain/signup_repository.dart';
import '../ui/viewmodel/signup_view_model_main.dart';


final _signupSourceProvider = Provider<SignupDataSource>(
      (ref) {
    Dio dio = ref.watch(dioProvider);
    return SignupDataSourceImpl(dio);
  },
);

final _signupRepositoryProvider = Provider<SignupRepository>(
      (ref) {
    final SignupDataSource dataSource = ref.watch(_signupSourceProvider);
    return SignupRepositoryImpl(dataSource);
  },
);

final signupViewModelProvider = ChangeNotifierProvider<SignupViewModelMain>((ref) {
  SignupRepository repository = ref.watch(_signupRepositoryProvider);
  return SignupViewModelMain()..update(repository);
});