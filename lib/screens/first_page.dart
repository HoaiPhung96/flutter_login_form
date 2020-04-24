import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:login_form/screens/detail_item.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final String url =
      'http://103.77.167.158:6080/arcgis/rest/services/LuoiDien_BacSongHuong/FeatureServer';
  final String jsonurl = '?f=pjson';
  List data;

  Future<String> getDataList() async {
    var response = await http.get(Uri.encodeFull(url + jsonurl));

    setState(() {
      var responseList = json.decode(response.body);
      data = responseList["layers"];
    });
    return "SS";
  }

  @override
  void initState() {
    super.initState();
    this.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Trang chủ"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print(data[index]['id']);
                        // print(data[index]['domain']);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailItem(urlId: data[index]['id'])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          data[index]['name'],
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

