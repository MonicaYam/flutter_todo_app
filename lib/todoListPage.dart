import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/alertDialogComponent.dart';
import 'package:flutter_application_2/addTodo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  TodoListPageState createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ

  List<String> todoList = [];
  List<Color> colorList = [];
  List<bool> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: const Text('リスト一覧'),
        actions: [
          IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () async {
                final bool? isClear = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return const AlertDialogComponent();
                    });
                if (isClear == true) {
                  setState(() {
                    // リスト追加
                    todoList.clear();
                    isChecked.clear();
                    colorList.clear();
                  });
                }
              }),
        ],
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() => {
                          todoList.removeAt(index),
                          isChecked.removeAt(index),
                          colorList.removeAt(index)
                        });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: '削除',
                ),
              ],
            ),
            child: ListTile(
              tileColor: colorList[index],
              title: Row(children: [
                Checkbox(
                  value: isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                    });
                  },
                ),
                Text(todoList[index]),
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const AddTodoPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText);
              // チェックボックスの値設定
              isChecked.add(false);
              //ランダムカラー生成
              var colorForToDo =
                  Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                      .withOpacity(0.3);
              // Todo毎に色を保存
              colorList.add(colorForToDo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
