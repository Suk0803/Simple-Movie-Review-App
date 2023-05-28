import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Movie Review Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> dataList = [
    {
      "category": "탑건: 매버릭",
      "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
    },
    {
      "category": "마녀2",
      "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
    },
    {
      "category": "범죄도시2",
      "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
    },
    {
      "category": "헤어질 결심",
      "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
    },
    {
      "category": "브로커",
      "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
    },
    {
      "category": "문폴",
      "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
    },
  ];

  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: reviewController,
                            decoration: InputDecoration(
                              labelText: "Write your review",
                              icon: Icon(Icons.comment),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            print("Review: ${reviewController.text}");
                            reviewController.clear();
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        dataList[index]['imgUrl'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            dataList[index]['category'],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
