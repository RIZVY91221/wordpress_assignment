import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRepository implements BaseRepository {
  // api objects
  final BaseRemoteDataSource _remoteDataSource;

  final BaseLocalDataSource _localDataSource;

  final BaseSharedPreference _sharedPreference;

  // constructor
  ImplementBaseRepository(this._remoteDataSource, this._localDataSource, this._sharedPreference);

  @override
  Future initBoxes(List<String> boxes) {
    return _localDataSource.initBoxes(boxes);
  }
}