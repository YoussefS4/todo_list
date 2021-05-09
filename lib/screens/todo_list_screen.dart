import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:sqflite/sqflite.dart';


class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  int _currentIndex = 0;
  final nav=[
    Center(child: Text('Home'),),
  ];

  Widget _buildTask(int index){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Task Title'),
            subtitle: Text('Oct 2, 2019'),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: Colors.red,
              value: true,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: nav[_currentIndex],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.orangeAccent,
                    Colors.deepOrange,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.centerLeft
              )
          ),
        ),
        elevation: 20.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors:[
                        Colors.deepOrange,
                        Colors.orangeAccent
                      ]
                  )
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                        Image(

                            width: 60.0,
                            image: NetworkImage('https://cdn0.iconfinder.com/data/icons/photography-flat-4/32/photography_user_interface_ui_profile_human_account-512.png')
                        ),
                      ),

                    ),
                    Text('Youssef Soultan',style: TextStyle(fontSize: 18.0,),),
                    Text('youssefsoultan5@gmail.com')
                  ],
                ),
              ),
            ),
            CustomTile(Icons.save_outlined,'Templates'),
            CustomTile(Icons.category_outlined,'Categories'),
            CustomTile(Icons.analytics_outlined,'Analytics'),
            CustomTile(Icons.settings,'Settings'),
            CustomTile(Icons.delete_forever_rounded,'Trash'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => AddTask(),),),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
            if (index == 0){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Tasks',
                      style:TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      '1 to 10',
                      style:TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ) ,
                    ),
                  ],
                ),
              );
            }
            return _buildTask(index);
          },
      ),

    );
  }
}
class CustomTile extends StatelessWidget {

  IconData icon;
  String text;
  CustomTile(this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12,))
        ),
        child: InkWell(
          child: Row(
            children: [
              Icon(icon),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}