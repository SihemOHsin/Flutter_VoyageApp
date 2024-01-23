import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDetailsPage extends StatefulWidget {
  String keyword = '';
  GalleryDetailsPage(this.keyword);

  @override
  State<GalleryDetailsPage> createState() => _GalleryDetailsPageState();
}

class _GalleryDetailsPageState extends State<GalleryDetailsPage> {
  int currentPage = 1;
  int size = 10;
  late num totalPages = 0;
  ScrollController scrollController = new ScrollController();
  List<dynamic> hits = [];
  var galleryData;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          getGalleryData(widget.keyword);
        }
      }
    });
  }

  void getGalleryData(String keyword) {
    print("Gallery de + keyword");
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${keyword}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.galleryData = json.decode(resp.body);
        hits.addAll(galleryData['hits']);
        totalPages = (galleryData['totalHits'] / size).ceil();
        hits = galleryData['hits'];
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.keyword}, Page ${currentPage}/${totalPages}",
          style: TextStyle(
              color: Colors.brown.shade800)
      )),
      body: (galleryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: (galleryData == null ? 0 : hits.length),
        controller: scrollController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        hits[index]['tags'],
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  color: Colors.brown.shade200,
                ),
              ),
              Container(
                child: Card(
                  child: Image.network(
                    hits[index]['webformatURL'],
                    fit: BoxFit.fitWidth,
                  ),
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
            ],
          );
        },
      )),
    );
  }

  // Liberate the scroll
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
