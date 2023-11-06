import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:suaim/common/global.dart';
import 'package:bruno/bruno.dart';
import 'package:file_picker/file_picker.dart';

List listing = [#name, #type, #quantity, #ascription];
var file = r'C:\Users\tdccj\PycharmProjects\SAIUM\打印零件表.xlsx';

var itemName = '未选中';
Map getItemInfo(itemName) {
  Map Iteminfo = {};

  Iteminfo['name'] = itemName;
  print(Iteminfo);
  return Iteminfo;
}

String fileName(name) {
  // 调用以更新文件路径
  file = name;
  return file;
}

SpreadsheetDecoder openFlie(file) {
// 指定文件路径

// 读取文件内容为字节数组
  var bytes = File(file).readAsBytesSync();
// 使用SpreadsheetDecoder解码字节数组
  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

  return decoder;
}

List<Widget> _vieList(decoder) {
  List<Widget> list = [];
  // 遍历解码后的表格

  for (var table in decoder.tables.keys) {
    // 打印表格名称、最大列数和最大行数
    // print(table);
    // print(decoder.tables[table]);
    // print(decoder.tables[table]!.maxCols);
    // print(decoder.tables[table]!.maxRows);

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
  List<Widget> _viewListControl(decoder) {
    List<Widget> list = [];

    // 遍历解码后的表格

    for (var table in decoder.tables.keys) {
      // 打印表格名称、最大列数和最大行数
      // print(table);
      // print(decoder.tables[table]);
      // print(decoder.tables[table]!.maxCols);
      // print(decoder.tables[table]!.maxRows);

      // 遍历表格中的每一行
      for (var row in decoder.tables[table]!.rows) {
        // 生成每一行的widget
        list.add(ListTile(
            title: TextButton(
                child: const Text(
                  '查看',
                  style: TextStyle(color: defaultColor),
                ),
                onPressed: () {
                  itemName = row[0]; //必须要有这一步，要不然全局变量会替代局部
                  setState(() {
                    getItemInfo(itemName);
                  });
                }) //将item对应column
            ));
      }
    }
    return list;
  }

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
                              children: _vieList(openFlie(file)), //name栏
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListView(
                              children:
                                  _viewListControl(openFlie(file)), //todo 操作栏
                            ),
                          )
                        ],
                      ))),
              const Spacer(flex: 1),
            ]),
          ),
          Flexible(
              flex: 5,
              child: Column(children: [
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  // 信息框
                  flex: 1,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 3,
                        child: BrnPairInfoTable(
                          itemSpacing: 10,
                          isValueAlign: true,
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.baseline,
                          children: [
                            BrnInfoModal(keyPart: '文件名:', valuePart: file),
                            BrnInfoModal(
                                keyPart: 'name:',
                                valuePart: getItemInfo(itemName)["name"]),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    // 按钮列
                    flex: 1,
                    child: Column(children: [
                      Flexible(
                        // 选择文件，仅支持xlsx
                        flex: 5,
                        child: TextButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(100, 50)),

                              //圆角
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              //边框
                              side: MaterialStateProperty.all(
                                const BorderSide(color: defaultColor),
                              ),
                              //背景
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text(
                            '文件',
                            style: TextStyle(
                                fontFamily: "KeShiLuYanTi",
                                color: defaultColor),
                          ),
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              // print(result.files.single.name);
                              // print(result.files.single.extension);
                              // print(result.files.single.size);
                              // print(result.files.single.path);
                              fileName(result.files.single.path); //更新文件路径
                            } else {
                              // User canceled the picker
                            }
                            setState(() {
                              // 自动刷新
                              _vieList(openFlie(file));
                              _viewListControl(openFlie(file));
                            });
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        // 刷新按钮
                        flex: 5,
                        child: TextButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(100, 50)),

                              //圆角
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              //边框
                              side: MaterialStateProperty.all(
                                const BorderSide(color: defaultColor),
                              ),
                              //背景
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text(
                            '刷新',
                            style: TextStyle(
                                fontFamily: "KeShiLuYanTi",
                                color: defaultColor),
                          ),
                          onPressed: () {
                            setState(() {
                              // 用setState刷新_viewlist,直接调用不会加载
                              _vieList(openFlie(file));
                              _viewListControl(openFlie(file));
                            });
                          },
                        ),
                      )
                    ]))
              ]))
        ],
      ),
    );
  }
}

// TODO 显示没做呢