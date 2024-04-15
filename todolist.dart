import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<String> tasks = []; //Görevleri depolayacağımız local alan
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar'ımızı kodladığımız yer
      appBar: AppBar(
        backgroundColor: isDarkModeEnabled ? Colors.black : Colors.blue[200],
        title: Text('ToDo List',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          //Dark mode seçeneği için buton ekleyelim
          IconButton(
            icon: Icon(isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode,color: Colors.white,),
            onPressed: () {
              setState(() {
                isDarkModeEnabled = !isDarkModeEnabled;
              });
            },
          ),
        ],
          iconTheme: IconThemeData(color: Colors.white), // Geri tuşunun rengini beyaz olarak ayarlar

      ),
      backgroundColor: isDarkModeEnabled ? Colors.black : Colors.blue[400],
      //Ana ekranın kodları listelenmiş veriler burada olacak
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: isDarkModeEnabled ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tasks[index],
                          style: TextStyle(color: isDarkModeEnabled ? Colors.white : Colors.black),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: isDarkModeEnabled ? Colors.white : Colors.black),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _AddTaskDialog(context);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//Görev ekleme kısmının kodları
  void _AddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        //Metin yazacağımız yerin kodu ve ekle iptal butonları ekle ile görevimizi ekleyeceğiz
        return AlertDialog(
          title: Text('Yeni Görev Ekle'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              hintText: 'Görevinizi buraya girin',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tasks.add(_taskController.text);
                  _taskController.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}
