import 'package:app_leia_mais/src/modules/home/home_controller.dart';
import 'package:app_leia_mais/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BookCards extends StatelessWidget {
  final Size size;
  final HomeController controller;
  final int index;

  const BookCards({Key key, this.size, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Observer(
                builder: (_) => Image.network(controller.book.value.items[index]
                            .volumeInfo.imageLinks.thumbnail) ==
                        null
                    ? Container(
                        height: 0,
                        width: 0,
                      )
                    : Image.network(controller.book.value.items[index]
                        .volumeInfo.imageLinks.thumbnail),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black87, blurRadius: 15)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(
                    builder: (_) => Text(
                              controller
                                  .book.value.items[index].volumeInfo.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ) ==
                            null
                        ? Container(
                            height: 0,
                            width: 0,
                          )
                        : Text(
                            controller.book.value.items[index].volumeInfo.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      controller.book.value.items[index].volumeInfo
                                  .description ==
                              null
                          ? ''
                          : controller
                              .book.value.items[index].volumeInfo.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    );
                  }),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.BOOK_DETAIL,
                        arguments: index
                        ),
                      icon: Icon(
                        Icons.arrow_forward_ios
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
