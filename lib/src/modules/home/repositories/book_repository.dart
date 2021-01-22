import 'package:app_leia_mais/src/data/models/book_model.dart';
import 'package:app_leia_mais/src/interfaces/book_interface.dart';
import 'package:dio/dio.dart';


class BookRepository implements IBook {
  final Dio dio;

  BookRepository(this.dio);

  @override
  Future<BookModel> getBooks({String query}) async {
    final apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=$query';


    final response = await dio.get(apiUrl);

     try {
      if (response.statusCode == 200) {
        return bookModelFromJson(response.data);
      }
    } catch (error) {
      print(error);
      print(response.statusCode);
      return null;
    }

  }
}
