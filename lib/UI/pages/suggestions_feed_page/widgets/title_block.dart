import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class TitleBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double price = 350000;
    return Container(
      child: Column(
        children: [
          Text(
            "Банк предложений",
            style: TextStyle(
              fontSize: 24.height,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24.height,
          ),
          Container(
            height: 104.height,
            width: 312.width,
            padding: EdgeInsets.only(
              left: 11.width,
              right: 11.width,
              top: 5.height,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.15),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${price.toInt()}p",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.height,
                  ),
                ),
                SizedBox(
                  height: 4.height,
                ),
                Text(
                  "Уже выплачено сотрудникам ПАО “Россети” за внесение рационализаторских предложений",
                  style: TextStyle(
                    fontSize: 12.height,
                  ),
                ),
                SizedBox(
                  height: 4.height,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Text(
                      "Подробная статистика",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.height,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.height,
          ),
        ],
      ),
    );
  }
}
