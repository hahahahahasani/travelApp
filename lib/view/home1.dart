import 'package:flutter/material.dart';
import 'package:travelapp/view%20model/fetch_wisata.dart';
import 'package:travelapp/view/detail.dart';
import 'package:travelapp/widgets/icon_badge.dart';

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
              size: 20,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildHorizontalList(context),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<dynamic>>(
        future: repo.fetchDataPlaces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var wisata = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    child: Container(
                      height: 250.0,
                      width: 140.0,
                      child: FutureBuilder<List<dynamic>>(
                        future: repo.fetchDataPlaces(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    wisata.gambar,
                                    height: 178.0,
                                    width: 140.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    wisata.destinasi,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 3.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    wisata.lokasi,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.blueGrey[300],
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details(wisata: wisata);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder<List<dynamic>>(
        future: repo.fetchDataPlaces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var wisata = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    child: Container(
                      height: 70.0,
                      child: FutureBuilder<List<dynamic>>(
                        future: repo.fetchDataPlaces(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    wisata.gambar,
                                    height: 178.0,
                                    width: 140.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                Container(
                                  height: 80.0,
                                  width:
                                      MediaQuery.of(context).size.width - 130.0,
                                  child: ListView(
                                    primary: false,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          wisata.destinasi,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(height: 3.0),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            size: 13.0,
                                            color: Colors.blueGrey[300],
                                          ),
                                          SizedBox(width: 3.0),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              wisata.lokasi,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                color: Colors.blueGrey[300],
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "3000",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details(wisata: wisata);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
