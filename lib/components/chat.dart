import 'package:flutter/material.dart';
import 'package:flutter_app1/modules/chat_detail_page.dart';
class ChatUsersList extends StatefulWidget{
  String text;
  String secondaryText;
  String image;
  String time;
  ChatUsersList({@required this.text, @required this.secondaryText,@required this.image, @required this.time});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
        return ChatDetailPage();
        }));
      },
        child: Container(
          padding: EdgeInsets.only(left:10, right: 10, top: 10, bottom: 10),
          child: Row(
            children: <Widget> [
              Expanded(
                child: Row(
                  children: <Widget> [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.image),
                      maxRadius: 30,
                    ),
                    SizedBox(width: 16,),
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(widget.text),
                          SizedBox(height: 6,),
                          Text(widget.secondaryText, style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              Text(widget.time, style: TextStyle(fontSize: 12, color:Colors.grey.shade500),),
            ],
          ),
        ),
    );
  }

}
