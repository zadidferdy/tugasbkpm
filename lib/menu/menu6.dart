import 'package:flutter/material.dart';

class menu6 extends StatefulWidget {
  @override
  _Menu6State createState() => _Menu6State();
}

class _Menu6State extends State<menu6> {
  List<Map<String, dynamic>> chatList = [
    {
      "name": "Aldi",
      "lastMessage": "Halo, bro!",
      "isRead": false,
    },
    {
      "name": "Budi",
      "lastMessage": "Besok kita ketemu ya?",
      "isRead": true,
    },
    {
      "name": "Cici",
      "lastMessage": "Oke, makasih ya!",
      "isRead": false,
    },
  ];

  void markAsRead(int index) {
    setState(() {
      chatList[index]["isRead"] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu 6 - Chat")),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user.png'), // Pastikan file ini ada
            ),
            title: Text(chat["name"]),
            subtitle: Text(chat["lastMessage"]),
            trailing: chat["isRead"]
                ? null
                : Icon(Icons.circle, color: Colors.blue, size: 12),
            onTap: () {
              markAsRead(index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(user: chat["name"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String user;

  ChatDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat dengan $user")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Hai, $user!"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Halo juga!"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: "Tulis pesan...", border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
