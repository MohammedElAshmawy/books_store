import 'package:book_store/Core/utils/api_service.dart';
import 'package:book_store/Features/home/data/repository/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setUpServiceLocator (){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(
    getIt.get<ApiService>()
  ));
}