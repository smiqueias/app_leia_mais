import 'package:app_leia_mais/src/di/locator.dart';
import 'package:app_leia_mais/src/global/theme/app_theme.dart';
import 'package:app_leia_mais/src/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BookDetailView extends StatelessWidget {
  final controller = locator<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final int index = ModalRoute.of(context).settings.arguments;

    final bookTitle = controller.book.value.items[index].volumeInfo.title;

    final authorListLength =
        controller.book.value.items[index].volumeInfo.authors.length;

    final authors = controller.book.value.items[index].volumeInfo.authors
        .getRange(0, authorListLength)
        .toString()
        .replaceAll('(', '')
        .replaceAll(')', '');

    final rating = controller.book.value.items[index].volumeInfo.averageRating;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        iconTheme: IconThemeData(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.bookmark_border,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 15, 25, 15),
                    width: size.width * 0.37,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(controller
                                .book
                                .value
                                .items[index]
                                .volumeInfo
                                .imageLinks
                                .thumbnail))),
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookTitle,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Text(
                          authors,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            Observer(builder: (_) {
                              if (rating == null) {
                                return Text(
                                  ' *Sem Ranking',
                                  style: TextStyle(color: Colors.black38),
                                );
                              }

                              return SmoothStarRating(
                                isReadOnly: true,
                                size: 18,
                                starCount: 5,
                                rating: rating.toDouble() == null
                                    ? 0
                                    : rating.toDouble(),
                                color: Colors.yellow[700],
                                borderColor: Colors.yellow[700],
                              );
                            }),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Observer(builder: (_) {
                              if (rating == null) {
                                return Container(
                                  height: 0,
                                  width: 0,
                                );
                              }

                              return Text(
                                rating.toString(),
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontWeight: FontWeight.bold),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(84, 84, 84, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Observer(
                builder: (context) {
                  if (controller
                          .book.value.items[index].volumeInfo.description ==
                      null) {
                    return Center(
                      child: Text(
                        'O livro não possui descrição',
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 30, right: 15),
                    child: Text(
                      controller.book.value.items[index].volumeInfo.description,
                      style: TextStyle(
                        height: 1.8,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              )
            ]),
          )),
    );
  }
}
