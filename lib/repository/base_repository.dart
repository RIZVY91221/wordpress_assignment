import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:bs_assignment/repository/i_base_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRepository {
  @factoryMethod
  static ImplementBaseRepository create(
    BaseRemoteDataSource remoteDataSource,
    BaseLocalDataSource localDataSource,
    BaseSharedPreference sharedPreference,
  ) =>
      ImplementBaseRepository(
        remoteDataSource,
        localDataSource,
        sharedPreference,
      );
  //local_base
  Future initBoxes(List<String> boxs);
}