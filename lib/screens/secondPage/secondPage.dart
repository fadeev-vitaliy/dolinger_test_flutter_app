import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolinger_test_flutter_app/model/basket.dart';
import 'package:dolinger_test_flutter_app/repository/BasketRepositoryImplementation.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> arguments;
  String url = '';
  int count = 0;

  Basket basket;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadBasket());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                /// Картинка с соотношением сторон 4 х 3
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 4 * 3,
                  fit: BoxFit.cover,
                  imageUrl: url,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(child: Text("Error loading: " + url)),
                ),

                /// Заголовок
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Произвольный текст как заголовок",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),

                /// Подзаголовок списка Дополнительно
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    "Дополнительно",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                /// Элементы списка
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: basket == null ? 0 : basket.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listItem(index);
                      }),
                ),
                totalCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Виджет элемента списка
  Widget listItem(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[100],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// Картинка
          CachedNetworkImage(
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            imageUrl: url,
          ),

          /// Отступ
          SizedBox(
            width: 10,
          ),

          /// Название товара
          Expanded(
            child: Text(
              basket.items[index].product.name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          /// Количество
          Container(
            child: Stack(
              children: [
                /// Цифра количество товара
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 40,
                      color: Colors.blueGrey[50],
                      child: Center(
                        child: Text(
                          basket.items[index].count.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    /// Кнопка -
                    ButtonTheme(
                      minWidth: 50.0,
                      child: RaisedButton(
                        color: Colors.blueGrey[50],
                        elevation: 2.0,
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        onPressed: () {
                          setState(() {
                            if (basket.items[index].count >0) {
                              basket.items[index].count--;
                            }
                          });
                        },
                      ),
                    ),

                    /// Отступ
                    SizedBox(
                      width: 30,
                    ),

                    /// Кнопка +
                    ButtonTheme(
                      minWidth: 50.0,
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 2.0,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        onPressed: () {
                          setState(() {
                            basket.items[index].count++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Цена товара
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "+${basket.items[index].product.price.toString()} р.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Виджет отображения элемента Игого
  Widget totalCount() {
    int count = 0;
    int sum = 0;
    for (var item in basket.items) {
      count += item.count;
      sum += item.count * item.product.price;
    }
    return Container(
      margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      // padding: ,
      child: Row(children: [
        Expanded(child: Text("Дополнительно", style: TextStyle(fontSize: 18, color: Colors.black),)),
        Text("x$count $sum,00 р.", style: TextStyle(fontSize: 18, color: Colors.black),)
      ],),
      decoration: DottedDecoration(
          shape: Shape.line, linePosition: LinePosition.bottom, strokeWidth: 2, dash: <int>[2, 6] ),
    );
  }

  loadBasket() async {
    arguments = ModalRoute.of(context).settings.arguments;
    url = arguments[0];
    count = int.parse(arguments[1]);
    basket = await BasketRepositoryImplementation().generateBasket(count);
    print(basket);
    setState(() {});
  }
}
