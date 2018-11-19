import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Todo List', home: new TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  // Instead of autogenerating a todo item, _addTodoItem now accepts a string
  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  Widget _buildTodoList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _todoItems.length) {
        return _buildTodoItem(_todoItems[index]);
      }
    });
  }

  Widget _buildTodoItem(String todoTextItem) {
    return ListTile(title: new Text(todoTextItem));
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Nueva tarea'),
        ),
        body: new TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addTodoItem(val);
            Navigator.pop(context); // Close the add todo screen
          },
          decoration: new InputDecoration(
              hintText: 'Ingre alguna tarea para realizar',
              contentPadding: const EdgeInsets.all(16.0)),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List - app Bar')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed:
            _pushAddTodoScreen, // pressing this button now opens the new screen
        tooltip: 'Agregar nuevo item',
        child: new Icon(Icons.add),
      ),
    );
  }
}
