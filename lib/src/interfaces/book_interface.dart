import 'package:app_leia_mais/src/data/models/book_model.dart';

abstract class IBook {
  Future<BookModel> getBooks({String query});
}