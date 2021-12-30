import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solesmates/utils/config.dart';
import 'package:solesmates/utils/constants.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Constants.backgroundvid)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    var screenWidth = _mediaQueryData.size.width;
    var screenHeight = _mediaQueryData.size.height;
    var blockSizeHorizontal = screenWidth / 100;
    var blockSizeVertical = screenHeight / 100;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            _skip(),
            const SizedBox(),
            _logo(blockSizeHorizontal, blockSizeVertical),
            const SizedBox(
              height: 50,
            ),
            Positioned(
                top: blockSizeVertical * 55,
                left: blockSizeHorizontal * 14,
                child: Container(
                    child: tabWidget(blockSizeHorizontal, blockSizeVertical)))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

Widget tabWidget(blockSizeHorizontal, blockSizeVertical) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Dive into',
            style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 30,
            child: DefaultTextStyle(
              style: GoogleFonts.montserrat(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('anything'),
                  TyperAnimatedText('r/Code'),
                  TyperAnimatedText('r/Flutter'),
                  TyperAnimatedText('r/Login Ui\'s'),
                  TyperAnimatedText('reddit')
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 900),
                stopPauseOnTap: true,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              primary: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Constants.google,
                height: blockSizeVertical * 2.5,
                width: blockSizeHorizontal * 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Sign up with Google',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              primary: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(
                FontAwesomeIcons.apple,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Sign up with Apple',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              primary: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(
                Icons.email,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Sign up with email address',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 15),
      _already()
    ],
  );
}

Widget _already() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account? ',
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
      ),
      InkWell(
        child: Text(
          'Sign In',
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.white),
        ),
        onTap: () {},
      )
    ],
  );
}

Widget _logo(blockSizeHorizontal, blockSizeVertical) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
    child: Column(
      children: [
        const Padding(padding: EdgeInsets.only()),
        Center(
          child: Image.asset(
            AppConfig.appLogo,
            height: blockSizeVertical * 12,
            width: blockSizeHorizontal * 100,
          ),
        ),
      ],
    ),
  );
}

Widget _skip() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          child: Text(
            'Skip',
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          onTap: () {},
        )
      ],
    ),
  );
}
