import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RyanChowCard(),
  ));
}

class Todo {
  int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});
}

class RyanChowCard extends StatefulWidget {
  @override
  State<RyanChowCard> createState() => _RyanChowCardState();
}

class _RyanChowCardState extends State<RyanChowCard> {
  final TextEditingController titleController = TextEditingController();
  final ValueNotifier<double> progressNotifier = ValueNotifier<double>(0.0);

  double progress = 0.0; // 进度step
  // 创建Todo列表
  final List<Todo> todoList = [
    Todo(id: 1, title: '创建flutter项目'),
    Todo(id: 2, title: 'Flutter的小组将'),
    Todo(id: 3, title: '样式和字体'),
    Todo(id: 4, title: 'StatelessWidget'),
    Todo(id: 5, title: '静态资源&图片'),
    Todo(id: 6, title: 'Icon&Button'),
    Todo(id: 7, title: 'Container&Padding'),
    Todo(id: 8, title: 'Rows'),
    Todo(id: 9, title: 'Column'),
    Todo(id: 10, title: 'Expanded'),
    Todo(id: 11, title: 'StatefulWidget'),
    Todo(id: 12, title: 'ListView'),
  ];

  void incrementProgress() {
    setState(() {
      progressNotifier.value < 1.0
          ? progressNotifier.value += 0.01
          : showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                      title: Text('恭喜，进度达到TOP!'),
                      content: Text("进度已完成!!!!!!",
                          style: TextStyle(fontFamily: 'RubikVinyl')),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              progressNotifier.value = 0.0;
                            });
                          },
                          child: const Text('确定'),
                        )
                      ]));
    });
  }

  void incrementTodoListItem() {
    // 新增一个对话框
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: Text('新增任务'),
                content: TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: '请输入任务标题'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      titleController.clear();
                    },
                    child: Text('取消'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        setState(() {
                          todoList.add(Todo(
                              id: todoList.length + 1,
                              title: titleController.text,
                              isDone: false));
                        });
                        Navigator.of(context).pop();
                        titleController.clear();
                      }
                    },
                    child: Text('确定'),
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: incrementTodoListItem,
        backgroundColor: Colors.grey[800],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'RyanChow ID Card',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // 居中
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/car.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(height: 50.0, color: Colors.grey[800]),
            Text(
              'NAME',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(height: 2.0),
            Text(
              'RyanChow',
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RubikVinyl'),
            ),
            SizedBox(height: 15.0),
            Text(
              'CURRENT LEVEL',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(height: 2.0),
            Row(
              children: [
                Text(
                  'InternShip',
                  style: TextStyle(
                      color: Colors.amber,
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RubikVinyl'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  // child: ClipRect(
                  //   // borderRadius: BorderRadius.circular(10.0), // 圆角设置
                  //   child: LinearProgressIndicator(
                  //     value: progressNotifier.value, // 当前进度条进度
                  //     minHeight: 20.0, // 设置进度条的高度
                  //     color: Colors.amber,
                  //     // borderRadius: ra,
                  //     backgroundColor: Colors.grey[300],
                  //   ),
                  // ),
                  child: ValueListenableBuilder<double>(
                    valueListenable: progressNotifier,
                    builder: (context, progress, child) {
                      // 每次进度改变时，打印当前值
                      print("当前进度: $progress");
                      return LinearProgressIndicator(
                        value: progress,
                        minHeight: 20.0,
                        color: Colors.amber,
                        backgroundColor: Colors.grey[300],
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'RyanChow4545@gmail.com',
                  style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 1.0,
                      fontSize: 18.0),
                )
              ],
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5.0),
              ),
              // color: Colors.grey[200],
              child: ListView.separated(
                itemCount: todoList.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[800],
                    height: 2.0,
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                        value: todoList[index].isDone,
                        onChanged: (value) {
                          setState(() {
                            todoList[index].isDone = value ?? false;
                            if (todoList[index].isDone == true) {
                              progressNotifier.value += 0.01;
                            } else {
                              progressNotifier.value -= 0.01;
                            }
                          });
                        }),
                    title: Text(
                      todoList[index].title,
                      style: TextStyle(
                        color: todoList[index].isDone
                            ? Colors.grey[400]
                            : Colors.black,
                        decoration: todoList[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ), // 显示标题
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// 无状态组件
// class RyanChowCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         title: Text('RyanChow ID Card',
//           style: TextStyle(
//               color: Colors.white
//           ),
//         ),
//         centerTitle: true, // 居中
//         backgroundColor: Colors.grey[850],
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/car.jpg'),
//                 radius: 40.0,
//               ),
//             ),
//             Divider(height: 50.0, color: Colors.grey[800]),
//             Text('NAME',
//               style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 2.0
//               ),
//             ),
//             SizedBox(height: 2.0),
//             Text('RyanChow',
//               style: TextStyle(
//                   color: Colors.amber,
//                   letterSpacing: 2.0,
//                   fontSize: 28.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'RubikVinyl'
//               ),
//             ),
//             SizedBox(height: 15.0),
//             Text('CURRENT LEVEL',
//               style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 2.0
//               ),
//             ),
//             SizedBox(height: 2.0),
//             Text('InternShip',
//               style: TextStyle(
//                   color: Colors.amber,
//                   letterSpacing: 2.0,
//                   fontSize: 28.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'RubikVinyl'
//               ),
//             ),
//             SizedBox(height: 15.0),
//             Row(
//               children: [
//                 Icon(
//                   Icons.email,
//                   color: Colors.grey[400],
//                 ),
//                 SizedBox(width: 10.0),
//                 Text(
//                   'RyanChow4545@gmail.com',
//                   style: TextStyle(
//                       color: Colors.grey[400],
//                       letterSpacing: 1.0,
//                       fontSize: 18.0
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// 有状态test
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//
//   int counter = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
