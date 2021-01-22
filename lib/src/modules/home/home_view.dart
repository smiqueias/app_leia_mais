import 'package:app_leia_mais/src/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/book_cards.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = locator<HomeController>();

  final List<String> categories = [
    "Android",
    "Java",
    "Flutter",
    "IOS",
    "React",
    "SQL"
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 62, left: 24),
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Browse',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Recomended',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
              )
            ],
          ),
          _buildChip(size: size),

          Observer(

            builder: (_) {

            if(controller.book.error != null) {
              return Center(
                child: Text(
                  'Ops! Ocorreu um erro. Tente Novamente',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20
                  ),
                ),
              );
            }

             else if(controller.book.value == null) {
                return Container(
                  margin: EdgeInsets.only(
                    top: size.height * .2
                  ),
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                );
              }

             return Expanded(
                child: ListView.builder(
                  itemCount: controller.book.value.items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookCards(
                      controller: controller,
                      size: size,
                      index: index,
                    );
                  },
                ),
              );
            }
          )

        ],
      ),
    ));
  }

  Widget _buildChip({Size size}) {
    return Container(
      width: size.width,
      height: size.height * 0.1,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            int _selectedIndex = index;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  controller.fetchBooks(query: categories[index]);
                  setState(() {
                    currentIndex = _selectedIndex;
                  });
                },
                child: Chip(
                  backgroundColor: currentIndex == _selectedIndex
                      ? Colors.blue
                      : Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  label: Text(
                    categories[index],
                    style: TextStyle(
                      color: currentIndex == _selectedIndex
                          ? Colors.white
                          : Colors.grey[500],
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
