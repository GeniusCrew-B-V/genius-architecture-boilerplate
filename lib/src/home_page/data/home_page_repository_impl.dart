import '../domain/home_page_repository.dart';
import 'source/home_page_data_source.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageDataSource _homePageRemoteDataSource;

  HomePageRepositoryImpl(this._homePageRemoteDataSource);
}
