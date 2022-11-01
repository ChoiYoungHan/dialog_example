import 'package:flutter/material.dart';

void main() {
  runApp(const dialog_example());
}

class dialog_example extends StatelessWidget {
  const dialog_example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  var titleList = ['oldman', 'relieve', 'rich'];
  var imageList = ['assets/oldman.png', 'assets/relieve.png', 'assets/rich.png'];
  var description = [
    'Hello Nice to meet you , Sunmoon University Good Good, Sunmoon University Good Good',
    'Hello Nice to meet you , Sunmoon University Good Good, Sunmoon University Good Good',
    'Hello Nice to meet you , Sunmoon University Good Good, Sunmoon University Good Good'];

  void showPopup(context, title, image, description){
    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(image,
                    width: 200, height: 200),
                  ),
                  SizedBox(
                    height: 10
                  ),
                  Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text(
                      description,
                      maxLines: 3,
                      style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500]),
                      textAlign: TextAlign.center)
                  ),
                  ElevatedButton.icon(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      label: Text('close'))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              debugPrint(titleList[index]);
              showPopup(context, titleList[index], imageList[index], description[index]);
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(titleList[index],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      )),
                      SizedBox(
                        height: 10
                      ),
                      SizedBox(
                        width: width,
                        child: Text(description[index],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[500]
                        )),
                      )
                    ],
                  ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

