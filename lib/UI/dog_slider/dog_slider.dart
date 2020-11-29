import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:rosseti/main.dart';

import 'dog_flare_controller.dart';

import 'dog_slider_bg_painter.dart';
import 'moving_character_physics_2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'bouncing_icon.dart';

class DogSlider extends StatefulWidget {
  final double arcRadius;
  final ValueChanged<double> onChanged;
  final double width;
  final double hzPadding;
  final double startValue;
  final double countPos;

  const DogSlider(
      {Key key,
      @required this.onChanged,
      this.width = 100,
      this.arcRadius = 15,
      this.hzPadding = 40,
      this.startValue = 0,
      this.countPos})
      : super(key: key);

  @override
  _DogSliderState createState() => _DogSliderState();
}

class _DogSliderState extends State<DogSlider> with TickerProviderStateMixin {
  static const double _offscreenX = -50;
  static const double _bottomPadding = 15;

  AnimationController _ballAnim;
  double _slidePosX = 0;
  double _sliderValue = 0;
  Ticker _dogTicker;
  MovingCharacterPhysics2d _dogPhysics;
  DogFlareControls _dogController;

  @override
  void initState() {
    //Move slider to start pos
    final step = MyApp.makeStatementsBloc.step;
    _slidePosX = step == -1
        ? widget.hzPadding +
            _getPos(step + 1) * (widget.width - widget.hzPadding)
        : _getPos(step + 1);
    _sliderValue = widget.startValue;

    //_moveDogTarget(_getPos(MyApp.makeStatementsBloc.step+1));

    //animationController to handle our ball
    _ballAnim = AnimationController(vsync: this)
      ..addListener(() => setState(() {}));
    //Dog controller to handle animations
    _dogController = DogFlareControls();
    //Character physics for dog
    _dogPhysics = MovingCharacterPhysics2d(
      //Start dog offscreen
      startX: _offscreenX,
      //If value is 0, keep dog offscreen, otherwise, set target to the current slider pos
      targetX: _slidePosX,
      //Play walk anim when moving
      onMoveStarted: () => _dogController.play("walk"),
      //play sit animation when we reach our destination
      onDestinationReached: () => _dogController.play("sit-front"),
    );

    //Use Ticker to redraw view, and update dog physics
    _dogTicker = Ticker((elapsed) {
      setState(() => _dogPhysics.update(elapsed));
    });
    _startDogTicker();

    super.initState();
  }

  @override
  void dispose() {
    _dogTicker.dispose();
    super.dispose();
  }

  double _getPos(int x) {
    return x.toDouble() / widget.countPos * widget.width;
  }

  @override
  Widget build(BuildContext context) {
    double width = max(widget.width, 100.0);
    double height = 100;
    double ballSize = widget.arcRadius * 1.35;

    return BlocListener<MakeStatementsBloc, MakeStatementsState>(
        listener: (context, state) {
          if (state is InternetStepState) {
            setState(() {
              _slidePosX = _getPos(state.step + 1);
              _moveDogTarget(_getPos(state.step + 1));
            });
          } else if (state is FaceToFaceStepState) {
            setState(() {
              _slidePosX = _getPos(state.step + 1);
              _moveDogTarget(_getPos(state.step + 1));
            });
          } else if (state is TypeOfIncidentChoiceState) {
            setState(() {
              _slidePosX = _getPos(state.step + 1);
              _moveDogTarget(_getPos(state.step + 1));
            });
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: width,
            height: height,
            //color: Colors.red.shade50,
            child: Stack(
              children: <Widget>[
                //The background lines/floor
                Positioned(
                  left: 0,
                  child: CustomPaint(
                    foregroundPainter: DogSliderBgPainter(
                      xPos: _slidePosX,
                      arcRadius: widget.arcRadius,
                      arcScaleY: max(0, 1 - _ballAnim.value * 2),
                      bottomPadding: _bottomPadding,
                    ),
                    size: Size(width, height),
                  ),
                ),

                // //Running dog
                // _buildFlareActor(),

                //The ball
                Positioned(
                  bottom: _bottomPadding + 4 + _ballAnim.value * 30,
                  left: _slidePosX - ballSize * .5,
                  width: ballSize,
                  height: ballSize,
                  child: _buildBallAndArrowStack(),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildBallAndArrowStack() {
    return Stack(
      children: <Widget>[
        Image.asset("assets/ball.png"),
        Transform.translate(
          offset: Offset(26, -2),
          child: BouncingWidget(
            isVisible: _sliderValue == 0 && _ballAnim.value < .2,
            child: Icon(Icons.arrow_forward_ios,
                size: 22, color: Color(0xff174d4c)),
          ),
        ),
      ],
    );
  }

  // Widget _buildFlareActor() {
  //   //Set the position of the dog, according to the character physics
  //   var dogPosition = _dogPhysics.position;
  //   var walkingDog = FlareActor(
  //     "assets/DogAnimation.flr",
  //     controller: _dogController,
  //     fit: BoxFit.fitWidth,
  //     alignment: Alignment.bottomCenter,
  //     snapToEnd: true,
  //   );
  //   return Positioned(
  //     bottom: _bottomPadding + 6,
  //     left: dogPosition,
  //     child: Container(
  //       alignment: Alignment.center,
  //       //color: Colors.blue,
  //       transform: Matrix4.diagonal3Values(_dogPhysics.flipView ? -1 : 1, 1, 1),
  //       width: _dogWidth,
  //       height: _dogWidth,
  //       child: Transform(
  //         child: walkingDog,
  //         //Offset the dog half-way on the X, so it's center-aligned when flipping
  //         transform: Matrix4.translationValues(-_dogWidth * .5, 0, 0),
  //       ),
  //     ),
  //   );
  // }

  void _moveDogTarget(double xPos) {
    //Ff ticker is not going, fire it up
    if (!_dogTicker.isTicking) {
      _dogTicker.start();
    }
    //calculate current xPos and dispatch change events
    setState(() {
      //Inject targetX into dogPhysics
      _slidePosX =
          xPos.clamp(widget.hzPadding, widget.width - widget.hzPadding);
      _sliderValue = (_slidePosX - widget.hzPadding) /
          (widget.width - widget.hzPadding * 2);
      if (widget.onChanged != null) {
        widget.onChanged(_sliderValue);
      }
      _dogPhysics.targetX = _sliderValue == 0 ? _offscreenX : _slidePosX;
    });
  }

  void _startDogTicker() async {
    await Future.delayed(Duration(milliseconds: 500));
    _dogTicker.start();
  }
}
