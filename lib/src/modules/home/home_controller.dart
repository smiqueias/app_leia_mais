import 'package:app_leia_mais/src/data/models/book_model.dart';
import 'package:app_leia_mais/src/di/locator.dart';
import 'package:mobx/mobx.dart';
import 'repositories/book_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final repository = locator<BookRepository>();

  _HomeControllerBase() {
    fetchBooks(query: 'android');
  }

  @observable
  ObservableFuture<BookModel> book;

  @action
  fetchBooks({String query})  {
     book =  repository.getBooks(query: query).asObservable();

  }
}
