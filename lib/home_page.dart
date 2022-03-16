import 'package:flutter/material.dart';
import 'login_page.dart';
import 'detail_page.dart';

import 'model/app_store.dart';

class HomePage extends StatefulWidget{
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("APLIKASIKU"),
        actions: <Widget>[

          IconButton(icon: new Icon(Icons.logout, color: Colors.white), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'DOWNLOAD',
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  Widget _createListCard() {
    var dataAppStore= appList ;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataAppStore[index], context);
      },
      itemCount: dataAppStore.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(AppStore data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(imageLogo: data.imageLogo, name:data.name, developer: data.developer, genre: data.genre, rating: data.rating, description: data.description, appLink: data.appLink, imageUrls: data.imageUrls,);
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(data.imageLogo),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(data.name)),
              ),
              Expanded(
                  flex :1,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0,0,20,0),
                      height:50,
                      child: const Icon(Icons.add_box_outlined),
                     )
              )
            ],
          ),
        ),
      ),
    );
  }
}