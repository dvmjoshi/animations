import 'dart:ui';

import 'package:flutter/material.dart';

import 'detailpage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  AnimationController _colorController;
  Animatable<Color> background = TweenSequence<Color>([
  TweenSequenceItem(
  weight: 1.0,
  tween: ColorTween(
  begin: Colors.red,
  end: Colors.green,
  ),
  ),
  TweenSequenceItem(
  weight: 1.0,
  tween: ColorTween(
  begin: Colors.green,
  end: Colors.blue,
  ),
  ),
  TweenSequenceItem(
  weight: 1.0,
  tween: ColorTween(
  begin: Colors.blue,
  end: Colors.pink,
  ),
  ),
  TweenSequenceItem(
  weight: 1.0,
  tween: ColorTween(
  begin: Colors.pink,
  end: Colors.red,
  ),
  ),]);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
        duration: Duration(milliseconds: 1200));
    _animation=CurvedAnimation(parent: _controller, curve:Curves.easeIn);
    setState(() {
      _colorController = AnimationController(vsync: this,duration: const Duration(seconds: 5),)
        ..addListener(() {
          setState(() {

          });
        })..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _colorController.forward(from: 0.0);
          }
        })..forward();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xff242424),
      appBar: AppBar(
        backgroundColor: Color(0xff242424),
        title: Text("Animations"),
      ),
      body: Column(
        children: [
          Center(child: FadeTransition(
              opacity: _animation,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeroDetail()),
                    );
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: "photo",
                        child: Container(
                          height: 340,
                          width: 567,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/joker.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                      Positioned(
                        height: 100,
                        width: 567,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 16,
                              sigmaY: 16,
                            ),
                            child: Container(
                              color: Colors.grey[600].withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'JOKER ARRIVES IN FLUTTER WORLD',
                                style: textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              //Ymargin(4),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: Text(

                                  'Smile, because it confuses people. Smile, because it’s easier than explaining what is killing you inside.  ',
                                  style: textTheme.caption.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'WorkSans',
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              //Image.network("https://cdn.dribbble.com/users/3281732/screenshots/7421960/media/9dd2e5490681a75e42c7f2c39bfeb905.jpeg")
)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 3.5,
                  height: 22,
                  color: background.evaluate(AlwaysStoppedAnimation(_colorController.value)),
                ),
                SizedBox(width: 4,),
                Text(
                  'DARK SIDE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 3
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:   FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.grey,
        onPressed: (){
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ) ,
    );
  }
}

