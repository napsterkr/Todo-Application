import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/state/todo_state.dart';
import 'package:todoapp/widgets/todo_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = TodoBloc();

  @override
  void initState() {
    _bloc.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Todo List"),
        ),
        body: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, TodoState state) {
            return state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.showError
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Something went wrong",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Give it another try",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            FlatButton(
                              child: Text(
                                "RELOAD",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0),
                              ),
                              onPressed: _bloc.loadData,
                            )
                          ],
                        ),
                      )
                    : TodoList();
          },
        ),
        floatingActionButton: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, TodoState state) {
            return Visibility(
                visible: _bloc.state.todoList.length > 0,
                child: FloatingActionButton(
                  onPressed: _bloc.loadData,
                  tooltip: 'RELOAD',
                  child: Icon(Icons.refresh),
                ));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
