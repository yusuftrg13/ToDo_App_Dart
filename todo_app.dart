import 'package:flutter/material.dart';
import 'package:flutter_todo_1/todolist.dart';

class TodoHomeScreen extends StatefulWidget {
  @override
  _TodoHomeScreenState createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Dark mode seçeneğini ekleyelim
      theme: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        //AppBar'In kodları
        appBar: AppBar(
          backgroundColor: isDarkModeEnabled ? Colors.grey[900] : Colors.blue[200],
          title: Text(
            'TO DO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: isDarkModeEnabled ? Colors.grey[900] : Colors.blue[200],
        body: Center(
          //Ana ekran  tasarımının olduğu kodlar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(
                  Icons.work_rounded,
                  size: 100,
                  color: isDarkModeEnabled ? Colors.blue[400] : Colors.blue[200],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Yapılacaklar Listesi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: isDarkModeEnabled ? Colors.white : Colors.black,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkModeEnabled ? Colors.black : Colors.blue[200], // Buton arkaplan rengi
                  foregroundColor: Colors.white, // Buton metin rengi
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Haydi Görev Ekleyelim'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isDarkModeEnabled = !isDarkModeEnabled;
            });
          },
          child: Icon(Icons.lightbulb_outline),
        ),
      ),
    );
  }
}
