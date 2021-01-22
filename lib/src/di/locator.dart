import 'package:app_leia_mais/src/modules/home/home_controller.dart';
import 'package:app_leia_mais/src/modules/home/repositories/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setup() {
  locator.registerLazySingleton<BookRepository>(() => BookRepository(Dio()));
  locator.registerLazySingleton<HomeController>(() => HomeController());
  
}
