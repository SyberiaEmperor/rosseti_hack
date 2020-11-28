import 'package:flutter/material.dart';
import '../../../classes/responsive_size.dart';

class SuggestionNavbar extends StatelessWidget {
  final int currentStep;
  final Function incStep;
  final Function decStep;

  SuggestionNavbar({this.currentStep, this.decStep, this.incStep});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Color.fromRGBO(163, 174, 179, 0.25),
          )
        ],
      ),
      padding: EdgeInsets.only(
        left: 25.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IgnorePointer(
            ignoring: false,
            child: GestureDetector(
              onTap: decStep,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: currentStep == 0 ? 0.0 : 1.0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 9.width,
                  ),
                  height: 52.height,
                  width: 52.height,
                  decoration: BoxDecoration(
                    color: Color(0xFFA9A9A9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 19.height,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.width,
          ),
          IgnorePointer(
            ignoring: false,
            child: GestureDetector(
              onTap: incStep,
              child: Container(
                alignment: Alignment.center,
                width: 212.width,
                height: 52.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Далее",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.height,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
