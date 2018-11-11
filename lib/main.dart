import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList()
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItems(){
    setState(() {
          int index = _todoItems.length;
          _todoItems.add('Item ' + index.toString());
        });
  }

  Widget _buildTodoList (){
  return ListView.builder(itemBuilder: (context, index){
   if(index < _todoItems.length){
       return  _buildTodoItem(_todoItems[index]);
   }
  });
}

Widget _buildTodoItem(String todoTextItem){
 return ListTile(title: new Text(todoTextItem));
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List - app Bar')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodoItems,
        tooltip: 'Agregar nuevo item',
        child: new Icon(Icons.add),
      ),
    );
  }
}