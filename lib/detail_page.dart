import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String imageLogo;
  final String developer;
  final String genre;
  final String rating;
  final String description;
  final String appLink;
  final List<String> imageUrls;

  const DetailPage({
    Key? key,
    required this.name,
    required this.imageLogo,
    required this.developer,
    required this.genre,
    required this.rating,
    required this.description,
    required this.appLink,
    required this.imageUrls,

    //this.price = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Aplikasi'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(imageLogo),
              SizedBox(height: 16,),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text(developer),
              SizedBox(height: 16,),
              Text("Ratings : ${rating}             Reviewer : ${description}"),
              Text(" "),
              Text("Kelompok : ${genre}"),
              Text(" "),
              Text("Link : ${imageUrls}"),
            ],
          ),
        ),
      ),
    );
  }
}
