import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/base/paging_controller.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:bs_assignment/repository/base_repository.dart';

class MovieOverviewController extends BaseController {
  final BaseRepository repository;

  MovieOverviewController({required this.repository});

  late CustomPaginationController<MovieResource> paginationController = CustomPaginationController<MovieResource>(
      onFetchPage: (pageKey, filterText, searchText) async => await getMovieListService(pageKey, filterText, searchText));

  @override
  void onInit() {
    paginationController.initialize();
    super.onInit();
  }

  @override
  void dispose() {
    paginationController.dispose();
    super.dispose();
  }

  /* ***
   * call data from repo
   * **/
  Future<List<MovieResource>> getMovieListService(int pageKey, String? filter, String? search) async {
    return await callDataService(repository.getMovieList(pageKey));
  }

  Future<void> onRefresh() async {
    paginationController.refresh(filter: '', search: '');
  }
}
