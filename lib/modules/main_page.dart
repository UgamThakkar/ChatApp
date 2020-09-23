import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/modules/chat_page.dart';
    class Mainpage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.blueGrey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                title: Text("Chats")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  title: Text("Groups")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text("Profile")
              ),
            ],
          ),
          body: ChatPage(),
        );
      }
    }
    