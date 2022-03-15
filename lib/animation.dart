import 'package:flutter/material.dart';

class MusicStart extends StatelessWidget {
  List<Color> color = [];
  List<int> duration = [
    700,
    300,
    400,
    500,
    550,
    700,
    900,
    400,
    500,
    100,
    900,
    400,
    500,
    550,
    700
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
          15,
          (index) => Musicvisualizer(
              duration: duration[index], color: Color(0xFF7966FF))),
    );
  }
}

class Musicvisualizer extends StatefulWidget {
  final int duration;
  final Color color;

  const Musicvisualizer({Key? key, required this.duration, required this.color})
      : super(key: key);

  @override
  _MusicvisualizerState createState() => _MusicvisualizerState();
}

class _MusicvisualizerState extends State<Musicvisualizer>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0, end: 28).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3.34,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
      ),
      height: animation.value,
    );
  }
}
