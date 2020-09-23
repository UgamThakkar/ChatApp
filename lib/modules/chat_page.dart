import 'package:flutter/material.dart';
import 'package:flutter_app1/components/chat.dart';
import 'package:flutter_app1/models/chat_users.dart';
class ChatPage extends StatefulWidget{
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(text:"Ugam Thakkar", secondarytext: "Op Setup", time: "Now", image:"images/aditya-das-RNpjzwDBsEY-unsplash.jpg"),
    ChatUsers(text:"Parth", secondarytext: "kya chal raha hai", time: "Now", image:"images/adam-hamel-7tVCQbnftNc-unsplash.jpg"),
    ChatUsers(text:"Martand", secondarytext: "Wont be able to play", time: "yesterday",image:"images/alfred-kenneally-97hZOFMr0Xg-unsplash.jpg" ),
    ChatUsers(text:"siddhant", secondarytext: "any lectures today?", time: "12:01PM",image:"images/ali-pazani-tHX354FtvH4-unsplash.jpg"),
    ChatUsers(text:"rushay", secondarytext: "sleep", time: "yesterday",image:"images/bruno-bucar-yXxnQ5JGnjE-unsplash.jpg"),
    ChatUsers(text:"dhrumil", secondarytext: "amazing", time: "Now",image:"images/houcine-ncib-rAy5DLouSL8-unsplash.jpg"),
    ChatUsers(text:"abhi", secondarytext: "lol", time: "21mar", image:""),
    ChatUsers(text:"hetu", secondarytext: "Shared a post", time: "1jan", image:""),
    ChatUsers(text:"moxit", secondarytext: "coming tonight?", time: "24aug", image:""),
    ChatUsers(text:"shrey", secondarytext: "eating", time: "15aug", image:""),
    ChatUsers(text:"martand", secondarytext: "working", time: "1sept", image:""),
    ChatUsers(text:"dhyey", secondarytext: "hitting gym", time: "Now", image:""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text("Chats", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8.0, top: 2.0, bottom: 2.0),
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.add,color: Colors.black12,size: 20.0,),
                          SizedBox(width: 2,),
                          Text("New", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:16, bottom: 16, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20.0,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100,

                    ),
                  ),

                ),
              ),

            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top:16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ChatUsersList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondarytext,
                 image: chatUsers[index].image,
                 time: chatUsers[index].time,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}


