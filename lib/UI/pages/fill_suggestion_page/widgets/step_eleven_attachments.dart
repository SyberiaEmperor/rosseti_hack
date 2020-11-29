import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/repos/entities/repos.dart';
import '../../../../main.dart';
import '../../../classes/responsive_size.dart';

import 'file_item.dart';

class StepElevenAttachments extends StatefulWidget {
  @override
  _StepElevenAttachmentsState createState() => _StepElevenAttachmentsState();
}

class _StepElevenAttachmentsState extends State<StepElevenAttachments> {
  bool isSelected = false;
  List<FileItem> _items = [];
  func() {
    isSelected = false;
    setState(() {
      _items = [];
    });
  }

  Widget buildListOfFiles() {
    StatementRepos.getInstance().documents.forEach((e) {
      _items.add(FileItem(e, 'Документ', func));
    });
    StatementRepos.getInstance().images.forEach((e) {
      _items.add(FileItem(e, 'Фотография', func));
    });
    StatementRepos.getInstance().videos.forEach((e) {
      _items.add(FileItem(e, 'Видео', func));
    });
    return Container(
      width: 320.width,
      constraints: BoxConstraints(
        maxHeight: 200.height,
        minHeight: 0.height,
      ),
      child: ListView.separated(
        // shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _items[index];
        },
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 12.height,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.width),
            child: Text(
              "Прикрепите файл",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.height,
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 61.height,
          ),
          buildListOfFiles(),
          SizedBox(
            height: 16.height,
          ),
          !isSelected
              ? RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xFFD3DADD),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  onPressed: () async {
                    FilePickerResult result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File file = File(result.files.single.path);
                      if (result.files.single.extension.toLowerCase() ==
                              'mp4' ||
                          result.files.single.extension.toLowerCase() ==
                              'mov') {
                        StatementRepos.getInstance().videos.add(file);
                      } else if (result.files.single.extension.toLowerCase() ==
                              'jpg' ||
                          result.files.single.extension.toLowerCase() ==
                              'png' ||
                          result.files.single.extension.toLowerCase() ==
                              'jpeg') {
                        StatementRepos.getInstance().images.add(file);
                      } else {
                        StatementRepos.getInstance().documents.add(file);
                      }
                      MyApp.makeStatementsBloc.repos.file = file;
                    }
                    setState(() {
                      isSelected = true;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFFD3DADD),
                  ),
                  label: Text(
                    "Добавить файл",
                    style: TextStyle(
                      color: Color(0xFFD3DADD),
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: 17.height,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
