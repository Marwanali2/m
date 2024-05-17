import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marovies/core/utils/api_services.dart';

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
}

