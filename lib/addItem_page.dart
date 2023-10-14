import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class additempage extends StatefulWidget {
  const additempage({super.key});

  @override
  State<additempage> createState() => _additempageState();
}

class _additempageState extends State<additempage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Flexible(
                child: Center(
                    child: TextButton(
              onPressed: () {
                // 指定文件路径
                var file = r'C:\Users\tdccj\PycharmProjects\SAIUM\打印零件表.xlsx';
                // 读取文件内容为字节数组
                var bytes = File(file).readAsBytesSync();
                // 使用SpreadsheetDecoder解码字节数组
                var decoder =
                    SpreadsheetDecoder.decodeBytes(bytes, update: true);

                // 遍历解码后的表格
                for (var table in decoder.tables.keys) {
                  // 打印表格名称、最大列数和最大行数
                  print(table);
                  print(decoder.tables[table]);
                  print(decoder.tables[table]!.maxCols);
                  print(decoder.tables[table]!.maxRows);
                  // 遍历表格中的每一行
                  for (var row in decoder.tables[table]!.rows) {
                    // 打印每一行数据
                    print('$row');
                  }
                }
              },
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return;
                },
              ),
            )))
          ],
        ),
      ),
    );
  }
}

// TODO 显示没做呢