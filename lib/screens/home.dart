import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/widget/todo_item.dart';
import 'package:todo_list/model/todo.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.TodoList();
  final _tdcontroller = TextEditingController();
  final _searchController = TextEditingController();
  List<Todo> _founds = [];

  @override
  void initState() {
    // TODO: implement initState
    _founds = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal:15 , vertical: 15),
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top:40,
                          bottom: 20,
                        ),
                        child:Text('All TODOS',
                        style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.w500),
                        ),

                      ),
                      for (Todo todo in _founds.reversed)
                      ToDoItem(
                        td: todo,
                      ontodochanged: _handletodochange,
                        ondelete: _handledelete,
                      ),


                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                 margin: EdgeInsets.only(bottom: 20,
                 right: 20,
                 left: 20),
                 padding: EdgeInsets.symmetric(
                   horizontal: 20,
                   vertical: 5,
                 ),
                  decoration:   BoxDecoration(
                    color: Colors.white,
                    boxShadow: const[ BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0,0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _tdcontroller,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none,
                    ),
                  ),
                )
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+', style: TextStyle(fontSize: 40) , ),
                    onPressed: (){
                      _addtodo(_tdcontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                     primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,

                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SearchBox()
  {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      child: TextField (
        onChanged: (value) => _filter(value),
        controller: _searchController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints:
            BoxConstraints(maxHeight: 20,
                minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: tdGrey,
            )
        ),
      ),

    );
  }
  void _handletodochange (Todo td)
  {
    setState(() {
      td.isd = !td.isd;
    });
  }

  void _handledelete (String id)
  {
    setState(() {
     todoList.removeWhere((item) => item.id ==id);
    });
  }

  void _addtodo(String todo)
  {
    setState(() {
      todoList.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todo: todo));
    });
    _tdcontroller.clear();

  }

  void _filter (String keyw)
  {
    List<Todo> results = [];
    if (keyw.isEmpty)
      {
        results = todoList;
      }
    else
      {
        results = todoList.
    where((item) => item.todo!.toLowerCase()
        .contains(keyw.toLowerCase()))
            .toList();
      }
    setState(() {
      _founds = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBgColor,
      title: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
        Icon(Icons.menu,
        color: tdBlack,
        size: 30,),

        Container(
          height: 40,
            width : 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/haboub.jpg'),
            ),
        )
      ],),

    );
  }
}
