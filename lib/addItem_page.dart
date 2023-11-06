import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:suaim/common/global.dart';

List listing = [#name, #type, #quantity, #ascription];

List<Widget> _vieList() {
  List<Widget> list = [];
  // 指定文件路径
  var file = r'C:\Users\tdccj\PycharmProjects\SAIUM\打印零件表.xlsx';
  // 读取文件内容为字节数组
  var bytes = File(file).readAsBytesSync();
  // 使用SpreadsheetDecoder解码字节数组
  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

  // 遍历解码后的表格

  for (var table in decoder.tables.keys) {
    // 打印表格名称、最大列数和最大行数
    print(table);
    print(decoder.tables[table]);
    print(decoder.tables[table]!.maxCols);
    print(decoder.tables[table]!.maxRows);

    Map map = {};
    // 遍历表格中的每一行
    for (var row in decoder.tables[table]!.rows) {
      var rowNum = 0;

      // 生成每一行的widget
      list.add(ListTile(
          title: Text(map[decoder.tables[table]!.rows[0][rowNum]] =
              row[0]) //将item对应column
          ));
    }
  }
  return list;
}

List<Widget> _viewListControl() {
  List<Widget> list = [];
  // 指定文件路径
  var file = r'C:\Users\tdccj\PycharmProjects\SAIUM\打印零件表.xlsx';
  // 读取文件内容为字节数组
  var bytes = File(file).readAsBytesSync();
  // 使用SpreadsheetDecoder解码字节数组
  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

  // 遍历解码后的表格

  for (var table in decoder.tables.keys) {
    // 打印表格名称、最大列数和最大行数
    print(table);
    print(decoder.tables[table]);
    print(decoder.tables[table]!.maxCols);
    print(decoder.tables[table]!.maxRows);

    Map map = {};
    // 遍历表格中的每一行
    for (var row in decoder.tables[table]!.rows) {
      var rowNum = 0;

      // 生成每一行的widget
      list.add(ListTile(
          title: Text(map[decoder.tables[table]!.rows[0][rowNum]] =
              row[0]) //将item对应column
          ));
    }
  }
  return list;
}

class additempage extends StatefulWidget {
  const additempage({super.key});

  @override
  State<additempage> createState() => _additempageState();
}

class _additempageState extends State<additempage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const Spacer(flex: 1),
          Flexible(
            flex: 10,
            child: Column(children: [
              const Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 19,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(
                          20.0, 20.0, 20.0, 20.0), //设置边距
                      decoration: BoxDecoration(
                          border: Border.all(color: defaultColor), //边框颜色
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10))), //边框圆角
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: ListView(
                              children: _vieList(), //name栏
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListView(
                              children: _viewListControl(), //todo 操作栏
                            ),
                          )
                        ],
                      ))),
              const Spacer(flex: 1),
            ]),
          ),
          Flexible(
              flex: 5,
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100, 50)),

                      //圆角
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      //边框
                      side: MaterialStateProperty.all(
                        const BorderSide(color: defaultColor),
                      ),
                      //背景
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text(
                    '刷新',
                    style: TextStyle(
                        fontFamily: "KeShiLuYanTi", color: defaultColor),
                  ),
                  onPressed: () {
                    setState(() {
                      // 用setState刷新_viewlist,直接调用不会加载
                      _vieList();
                      _viewListControl();
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }
}

// TODO 显示没做呢