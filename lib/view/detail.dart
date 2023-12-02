import 'package:flutter/material.dart';
import 'package:travelapp/model/wisata.dart';
import 'package:travelapp/view%20model/fetch_wisata.dart';
import 'package:travelapp/widgets/icon_badge.dart';

class Details extends StatelessWidget {
  final Wisata wisata;
  Details({Key? key, required this.wisata});

  Repository repo = Repository();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              size: 18,
              color: Colors.black45,
              icon: Icons.notifications_none,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: repo.fetchDataPlaces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 250.0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        wisata.gambar,
                        height: 250.0,
                        width: MediaQuery.of(context).size.width - 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            wisata.destinasi,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            wisata.lokasi,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "3000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "oke bos",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.airplanemode_active,
        ),
        onPressed: () {},
      ),
    );
  }
}
