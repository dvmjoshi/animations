import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
    duration: Duration(milliseconds: 1200));
    _animation=CurvedAnimation(parent: _controller, curve:Curves.easeIn);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(child: FadeTransition(
          opacity: _animation,
          child: Image.network("https://cdn.dribbble.com/users/3281732/screenshots/7421960/media/9dd2e5490681a75e42c7f2c39bfeb905.jpeg"))),
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
