import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_app/core/string_extension.dart';
import 'package:meeting_app/view/HomeView.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 1500),
                  child: Image(image: AssetImage("splash_team_img".toPNG)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        delay: Duration(milliseconds: 1000),
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          "Schedule Meetings",
                          style: GoogleFonts.rubik(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        delay: Duration(milliseconds: 1200),
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          "Collabrate with your Team & Client \nto discuss business",
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.blueGrey.shade400),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FadeInUp(
                  delay: Duration(milliseconds: 1300),
                  duration: Duration(milliseconds: 1000),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                    builder: (context) => HomeView()));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
