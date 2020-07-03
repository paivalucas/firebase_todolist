import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';
import 'models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.todoList.hasError) {
          return Center(
            child: RaisedButton(
              onPressed: controller.getList(),
              child: Text('Error'),
            ),
          );
        }

        if (controller.todoList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<TodoModel> list = controller.todoList.data;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              return ListTile();
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
