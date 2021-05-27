import 'package:flutter/material.dart';
import 'package:airtv_clone/channelcard.dart';
import 'package:airtv_clone/channel_model.dart';
import 'package:airtv_clone/channeldata.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<ChannelModel> categories = <ChannelModel>[];

  @override
  void initState() {
    super.initState();
    categories = getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: TextField(
            // controller: searchCtrl,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              // hintText: 'Search Here',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(



          children: [


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Suggested",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,

                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ChannelCard(
                      imageAssetUrl: categories[index].imageURL,
                      categoryName: categories[index].channelName,
                    );
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Enternainment",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ChannelCard(
                      imageAssetUrl: categories[index].imageURL,
                      categoryName: categories[index].channelName,
                    );
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "News",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ChannelCard(
                      imageAssetUrl: categories[index].imageURL,
                      categoryName: categories[index].channelName,
                    );
                  }),
            ),
          ],
        ),

      ),
    );
  }
}
