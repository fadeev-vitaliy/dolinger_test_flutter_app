import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = new GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _basketCountController = TextEditingController();

  @override
  void initState() {
    _urlController.text = "https://www.fotografia.com.ua/gallery/albums/hibiny-2009/DSC_0124.jpg";
    // _urlController.text = "https://expansetv.ru/images/season_5.jpg";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Page"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                /// Поле URL картинки
                new TextFormField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'URL картинки (любая из сети)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) return 'Введите URL картинки (любая из сети)';
                      _urlController.text = value;
                      return null;
                    }),

                new SizedBox(height: 10.0),

                /// Поле число от 3 до 5
                new TextFormField(
                    controller: _basketCountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Число от 3 до 5',
                    ),
                    validator: (value) {
                      if (value.isEmpty || int.tryParse(value) == null) return 'Введите число от 3 до 5';
                      if (int.parse(value) < 3 || int.parse(value) > 5) return 'Число должно быть от 3 до 5';
                      _basketCountController.text = value;
                      return null;
                    }),

                new SizedBox(height: 20.0),

                /// Кнопка перехода к 2му экрану
                new FlatButton(
                  child: Text(
                    'Далее',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                        _openBasket();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _openBasket()  {
    Navigator.pushNamed(context, '/second', arguments: [_urlController.text, _basketCountController.text]);
  }

}
