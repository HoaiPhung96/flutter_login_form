import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';




class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  void getHttp() async {
  try {
    Response response = await Dio().get("http://103.77.167.158:6080/arcgis/rest/services/LuoiDien_BacSongHuong/FeatureServer");
    print(response);
  } catch (e) {
    print(e);
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Cài đặt"),
      ),
      body: Center(
      
          ),
    );
  }
}
