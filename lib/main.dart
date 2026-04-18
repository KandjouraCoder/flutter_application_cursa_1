import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _messageController = TextEditingController();
  List<String> messages = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        useDefaultSemanticsOrder: false,
        title: Text(
          'WhatsApp',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
            print(_selectedIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            tooltip: 'Stories',
            label: 'Actus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Communautés',
            tooltip: 'Communauté',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Appels',
            tooltip: 'Appel',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 560,
                width: 400,
                color: const Color.fromARGB(255, 113, 167, 115),
                child: ListView(
                  //itemExtent: 65,la taille de chaque item de la liste est de 65 pixels
                  itemExtent: 65,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/1.webp'),
                      ),
                      title: Text(
                        'Moussa Diakité',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              var safeArea = SafeArea(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(
                                        bottom: 24.0,
                                        left: 16.0,
                                        right: 16.0,
                                      ).add(
                                        EdgeInsets.only(
                                          bottom: MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom,
                                        ),
                                      ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      isDense: true,
                                      hintText: 'Message',
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),

                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {
                                          // Handle send button press
                                          if (_messageController
                                              .text
                                              .isNotEmpty) {
                                            setState(() {
                                              messages.add(
                                                _messageController.text,
                                              );
                                              _messageController.clear();
                                            });
                                          }
                                        },
                                      ),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.emoji_emotions),
                                        onPressed: () {
                                          // Handle emoji button press
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              return Scaffold(
                                appBar: AppBar(title: Text('Moussa Diakité')),

                                // ✅ LES MESSAGES ICI (dans body)
                                body: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: messages.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(messages[index]),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                                // ✅ INPUT ICI (en bas)
                                bottomNavigationBar: SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        context,
                                      ).viewInsets.bottom,
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.emoji_emotions),
                                          onPressed: () {},
                                        ),

                                        Expanded(
                                          child: TextField(
                                            controller:
                                                _messageController, // ✅ TRÈS IMPORTANT
                                            decoration: InputDecoration(
                                              hintText: "Message",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                        ),

                                        IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            if (_messageController
                                                .text
                                                .isNotEmpty) {
                                              setState(() {
                                                messages.add(
                                                  _messageController.text,
                                                );
                                                _messageController.clear();
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/3.webp'),
                      ),
                      title: Text(
                        'Kandjoura',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hi, it is me bro!'),
                      trailing: Text('Hier'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              var safeArea = SafeArea(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(
                                        bottom: 24.0,
                                        left: 16.0,
                                        right: 16.0,
                                      ).add(
                                        EdgeInsets.only(
                                          bottom: MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom,
                                        ),
                                      ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      isDense: true,
                                      hintText: 'Message',
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),

                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {
                                          // Handle send button press
                                          if (_messageController
                                              .text
                                              .isNotEmpty) {
                                            setState(() {
                                              messages.add(
                                                _messageController.text,
                                              );
                                              _messageController.clear();
                                            });
                                          }
                                        },
                                      ),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.emoji_emotions),
                                        onPressed: () {
                                          // Handle emoji button press
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                    'Kandjoura',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                // ✅ LES MESSAGES ICI (dans body)
                                body: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: messages.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(messages[index]),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                                // ✅ INPUT ICI (en bas)
                                bottomNavigationBar: SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        context,
                                      ).viewInsets.bottom,
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.emoji_emotions),
                                          onPressed: () {},
                                        ),

                                        Expanded(
                                          child: TextField(
                                            controller:
                                                _messageController, // ✅ TRÈS IMPORTANT
                                            decoration: InputDecoration(
                                              hintText: "Message",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                        ),

                                        IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            if (_messageController
                                                .text
                                                .isNotEmpty) {
                                              setState(() {
                                                messages.add(
                                                  _messageController.text,
                                                );
                                                _messageController.clear();
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
