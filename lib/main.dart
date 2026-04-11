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
                                appBar: AppBar(
                                  actions: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.call),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.videocam),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert),
                                    ),
                                  ],
                                  title: Text('Moussa Diakité'),
                                ),
                                bottomNavigationBar: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                    safeArea,
                                  ],
                                ),
                                body: Center(
                                  child: Text(
                                    'Bienvenue dans le chat de Moussa Diakité!',
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
                        backgroundImage: AssetImage('assets/5.webp'),
                      ),
                      title: Text(
                        'Souaré Bathily',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Souaré Bathily'),
                              ),
                              bottomNavigationBar: Padding(
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
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Souaré Bathily!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/4.jpg'),
                      ),
                      title: Text(
                        'Amara SACKO',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('Hier'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Amara SACKO'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Amara SACKO!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/3.webp'),
                      ),
                      title: Text(
                        'Djomba Tounkara',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Djomba Tounkara'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Djomba Tounkara!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/5.webp'),
                      ),
                      title: Text(
                        'Boulaye Sendé',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Boulaye Sendé'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Boulaye Sendé  !',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/7.jpg'),
                      ),
                      title: Text(
                        'Hawa Diarra',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Je suis à ton service'),
                      trailing: Text('Mardi'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Hawa Diarra'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Hawa Diarra!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/6.jpeg'),
                      ),
                      title: Text(
                        'Mariam Soumaré',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('08:30'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Mariam Soumaré'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Mariam Soumaré!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/7.jpg'),
                      ),
                      title: Text(
                        'TIREAR Maro',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Femme me......'),
                      trailing: Text('Vendredi'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('TIREAR Maro'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de TIREAR Maro!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/4.jpg'),
                      ),
                      title: Text(
                        'Natha Nadi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Natha Nadi'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Natha Nadi!',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/5.webp'),
                      ),
                      title: Text(
                        'Sori Bakayoko',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Hello, how are you?'),
                      trailing: Text('12:30 PM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.videocam),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                                title: Text('Sori Bakayoko'),
                              ),
                              bottomNavigationBar: SafeArea(
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
                              ),
                              body: Center(
                                child: Text(
                                  'Bienvenue dans le chat de Sori Bakayoko!',
                                ),
                              ),
                            ),
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
