import 'package:flutter/material.dart';

import 'package:geo_wild_design/components/my_custom_bottom_bar.dart';
import '../constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _currentNav = 1;

  void changeTab(dynamic i) {
    setState(() {
      print("test mgl: $i");
      _currentNav = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimary_splash_color,
                        width: 8,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            primaryColor: Colors.black,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  left: 30.0,
                                  right: 10.0,
                                ),
                                child: Icon(Icons.search),
                              ),
                              contentPadding: EdgeInsets.all(25.0),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: animalsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return animalsList[index];
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index == 0 ? 1 : 3),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 100,
      //   child: BottomNavigationBar(
      //     currentIndex: _currentNav,
      //     backgroundColor: Colors.black,
      //     unselectedItemColor: Colors.grey[300],
      //     selectedItemColor: kPrimary_color,
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: kPrimary_color),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search, color: kPrimary_color),
      //         label: "Discover",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded, color: kPrimary_color),
      //         label: "Profile",
      //       ),
      //     ],
      //     onTap: (index) {
      //       setState(() {
      //         _currentNav = index;
      //       });
      //     },
      //   ),
      // ),
      bottomNavigationBar: MyCustomBottomBar(
        children: [
          "Home",
          "Discover",
          "Profile",
        ],
        notifyParent: changeTab,
        currentSelected: _currentNav,
      ),
    );
  }
}
