// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$bookAtom = Atom(name: '_HomeControllerBase.book');

  @override
  ObservableFuture<BookModel> get book {
    _$bookAtom.reportRead();
    return super.book;
  }

  @override
  set book(ObservableFuture<BookModel> value) {
    _$bookAtom.reportWrite(value, super.book, () {
      super.book = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic fetchBooks({String query}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchBooks');
    try {
      return super.fetchBooks(query: query);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
book: ${book}
    ''';
  }
}
