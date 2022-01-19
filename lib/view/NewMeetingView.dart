import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meeting_app/view/CalenderView.dart';
import 'package:meeting_app/widgets/StackedWidgets.dart';

class NewMeetingView extends StatefulWidget {
  const NewMeetingView({Key? key}) : super(key: key);

  @override
  NewMeetingViewState createState() => NewMeetingViewState();
}

class NewMeetingViewState extends State<NewMeetingView> {
  int activeIndex = 0;
  bool _isLoading = false;
  String dateVal = '';

  final colors = [
    '#7954F6',
    '#39CAF9',
    '#F5DF5D',
    '#11D69F',
    '#EE3962',
    '#F77F52',
    '#663E70'
  ];

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  @override
  void initState() {
    super.initState();

    dateVal = 'Select Date & Time';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        title: Text(
          'New Meetings',
          style: TextStyle(fontSize: 16, color: Colors.black, height: 1.2),
          //GoogleFonts.rubik(fontSize: 16, height: 1.2, color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter Meeting Title',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  autocorrect: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Meeting title')),
              SizedBox(
                height: 20,
              ),
              Text(
                'Check Availablity',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  readOnly: true,
                  onTap: () {
                    PushAndPick();
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalenderView()));*/
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: dateVal,
                      suffixIcon: Icon(
                        Icons.date_range_outlined,
                        color: Colors.lightBlueAccent,
                      ))),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select Collaborators',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildExpandedBox(
                    children: [
                      const SizedBox(height: 16),
                      buildStacked(direction: TextDirection.rtl),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
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
                    padding:
                        EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                    child: Center(
                      child: Text(
                        "Contacts",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade800),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Meeting Type',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              GroupButton(
                isRadio: false,
                spacing: 10,
                onSelected: (index, isSelected) =>
                    print('$index button is selected $isSelected'),
                buttons: ["Private", "Public", "On Invite"],
                buttonWidth: MediaQuery.of(context).size.width / 3 - 30,
                buttonHeight: 40,
                selectedColor: Colors.black,
                selectedBorderColor: Colors.black,
                unselectedBorderColor: Colors.black,
                borderRadius: BorderRadius.circular(30.0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pick Color for Meeting',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              buildExpandedBox(
                children: [
                  const SizedBox(height: 16),
                  buildStackedImages(direction: TextDirection.rtl),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      height: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.only(
                          left: 50, right: 50, bottom: 10, top: 10),
                      child: Center(
                        child: Text(
                          "Schedule",
                          style: GoogleFonts.rubik(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void PushAndPick() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalenderView(),
      ),
    ).then((val) {
      setState(() {
        dateVal = val;
      });
      print(val); //you get details from screen2 here
    });
  }

  Widget buildExpandedBox({
    required List<Widget> children,
  }) =>
      SizedBox(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        )),
      );

  Widget buildStackedImages({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 30;
    final double xShift = -15;
    List<Widget> items = [];
    String urlimage = "";

    for (int i = 0; i < colors.length; i++) {
      urlimage = colors[i];
      items.add(buildColor(urlimage, false));
    }

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildStacked({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 30;
    final double xShift = -5;
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

  Widget buildColor(String colortext, bool selectedTool) {
    final double borderSize = 2;

    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        color: HexColor(colortext),
        child: ClipOval(
          child: Center(
              child: Icon(
            Icons.check,
            color: selectedTool ? Colors.blue : Colors.white,
          )),
        ),
      ),
    );
  }
}
