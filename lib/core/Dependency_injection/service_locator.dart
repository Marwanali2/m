import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marovies/core/utils/api_services.dart';
import 'package:marovies/features/details/data/repos/details_repo/details_repo_impl.dart';
import 'package:marovies/features/watch_list/data/repos/watch_list_repo/watch_list_repo_impl.dart';

import '../../features/home/data/repos/home_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      ApiServices(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      ApiServices(
        Dio(),
      ),
    ),
  );
   getIt.registerSingleton<WatchListRepoImpl>(
    WatchListRepoImpl(
      ApiServices(
        Dio(),
      ),
    ),
  );
}

