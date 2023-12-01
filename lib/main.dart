import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '201157 subjects',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _clothes = ['Dresses', 'Jackets', 'Coats', 'Socks', 'Shoes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('201157'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a clothing',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _clothes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_clothes[index], style: const TextStyle(color: Colors.red)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              editClothing(index, _clothes[index]);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.green),
                            onPressed: () {
                              setState(() {
                                _clothes.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addClothing,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void addClothing() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newClothing = "";
        return AlertDialog(
          title: const Text('Add your new clothing', style: TextStyle(color: Colors.blue)),
          content: TextField(
            onChanged: (String string) {
              newClothing = string;
            },
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: TextButton(
                child: const Text('Add', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  setState(() {
                    if (newClothing.isNotEmpty) {
                      _clothes.add(newClothing);
                    }
                  });
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void editClothing(int index, String clothing) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textEditingController = TextEditingController(text: clothing);

        return AlertDialog(
          title: const Text('Edit Item', style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: textEditingController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _clothes[index] = textEditingController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
