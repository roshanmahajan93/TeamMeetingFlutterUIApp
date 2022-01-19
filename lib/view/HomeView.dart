import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meeting_app/core/string_extension.dart';
import 'package:meeting_app/view/NewMeetingView.dart';
import 'package:meeting_app/widgets/CircleTabIndicator.dart';
import 'package:meeting_app/widgets/StackedWidgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  int selectedTool = 0;

  List<dynamic> tools = [
    {
      'time': '12:30 - 14:00',
      'title': 'UI Design Career Info',
      'total': '12 Members Joining',
      'color': '#13D3F9',
      'status': 'Join',
    },
    {
      'time': '12:30 - 14:00',
      'title': 'User Experience VS Interface',
      'total': '12 Members Joining',
      'color': '#F6DF5E',
      'status': 'Requested',
    },
    {
      'time': '12:30 - 14:00',
      'title': 'Development VS Design',
      'total': '12 Members Joining',
      'color': '#0FD59E',
      'status': 'Join',
    }
  ];

  late TabController _tabController;
  int activeIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });
    super.initState();
  }

  List<String> images = [
    'https://images.unsplash.com/photo-1633177317976-3f9bc45e1d1d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633113093730-47449a1a9c6e?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633209942287-701d44019290?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633287387306-f08b4b3671c6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633269540827-728aabbb7646?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633183601291-ec3ddf252825?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633267538438-2d49aeb844f7?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633172905740-2eb6730c95b4?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4MXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633277194892-c5e2bba2d40f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3OHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hey, Andrea!",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: CircleAvatar(
                                child: Image.asset("avatar".toPNG),
                              ),
                            ),
                          ],
                        ),
                        FadeInDown(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Check your \nMeeting Details",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade800,
                                    height: 1.3),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  Future.delayed(Duration(seconds: 2), () {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewMeetingView()));
                                },
                                color: Colors.white,
                                height: 30,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 8, top: 8),
                                child: Center(
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    child: Container(
                        child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey.shade600,
                            indicator:
                                CircleTabIndicator(Colors.grey.shade800, 4.0),
                            tabs: [
                          Tab(
                            child: Text(
                              "Upcoming",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade800),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "On Hold",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade800),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Past",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade800),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Cancelled",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade800),
                            ),
                          )
                        ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            padding: EdgeInsets.all(12),
                            itemCount: tools.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTool = index;
                                  });
                                },
                                child: FadeInUp(
                                  delay: Duration(milliseconds: index * 100),
                                  child: AnimatedContainer(
                                    height: 200,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    margin: EdgeInsets.only(bottom: 10),
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      color: HexColor(tools[index]['color']),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        tools[index]['time'],
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(),
                                                    ),
                                                    Switch(
                                                      activeColor: Colors.white
                                                          .withOpacity(0),
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      value: _switchValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _switchValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  tools[index]['title'],
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  tools[index]['total'],
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  child: Center(),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    buildExpandedBox(
                                                      children: [
                                                        const SizedBox(
                                                            height: 16),
                                                        buildStackedImages(
                                                            direction:
                                                                TextDirection
                                                                    .rtl),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                      ),
                                                      height: 25,
                                                      padding:
                                                          EdgeInsets.all(7),
                                                      child: Center(
                                                        child: Text(
                                                          tools[index]
                                                              ['status'],
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.grey
                                                                  .shade800,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Center(),
                        Center(),
                        Center()
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget buildExpandedBox({
    required List<Widget> children,
  }) =>
      Expanded(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )),
      );

  Widget buildStackedImages({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 30;
    final double xShift = 10;
    List<Widget> items = [];

    for (int i = 0; i < urlImages.length; i++) {
      if (i <= 3) {
        if (i >= 3) {
          items.add(buildText(((urlImages.length) - i).toString() + '+'));
        } else {
          items.add(buildImage(urlImages[i]));
        }
      }
    }

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    final double borderSize = 2;

    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(urlImage, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget buildText(String textsize) {
    final double borderSize = 2;

    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        color: Colors.black,
        child: ClipOval(
          child: Center(
            child: Text(
              textsize,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
