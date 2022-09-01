import 'package:flutter/material.dart';
import 'package:image_to_text/DetailScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> itemList = ["Text Scanner","Barcode Scanner","Label scanner","Face detection"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EK ML-KIT"),
      ),
      body:
      ListView.builder(
      itemCount: itemList.length,
          itemBuilder: (context ,index){
        return Card(
        child: ListTile(
        title: Text(itemList[index]),
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(),
            settings: RouteSettings(
              arguments: itemList[index]),
            )
          );
          },)
        );
    }
    ));
  }
}

