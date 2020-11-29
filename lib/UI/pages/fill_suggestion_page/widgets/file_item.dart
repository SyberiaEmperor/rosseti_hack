import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rosseti/repos/entities/repos.dart';
import '../../../classes/responsive_size.dart';

// ignore: must_be_immutable
class FileItem extends StatelessWidget {
  final String type;
  final Function func;
  final File file;
  FileItem(
    this.file,
    this.type,
    this.func,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        6.height,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 320.width,
      child: Container(
            width: 270.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type),
                SizedBox(
                  height: 9.height,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.width,
                    vertical: 9.height,
                  ),
                  child: Text(
                    file.path.split("/").last,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
