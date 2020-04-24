import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form/screens/first_page.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class DetailItem extends StatefulWidget {
  DetailItem({Key key, this.urlId}) : super(key: key);
  final int urlId;
  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {

final String url =
      'http://103.77.167.158:6080/arcgis/rest/services/LuoiDien_BacSongHuong/FeatureServer/7';
  final String jsonurl = '?f=pjson';
  List layer;



  Future<String> getDataList() async {
    var response = await http.get(Uri.encodeFull(url+jsonurl));

    setState(() {
      var responseList = json.decode(response.body);
      layer = responseList["fields"];
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
        itemCount: layer == null ? 0 : layer.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          layer[index]['name'],
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
