import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionText extends StatelessWidget {
  final RegistryItem registryItem;

  SuggestionText(this.registryItem);

  Widget _buildTextSection(String title, String sectionText){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.height,
          ),
        ),
        SizedBox(
          height: 10.height,
        ),
        Text(
          sectionText,
          style: TextStyle(
            fontSize: 14.height,
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextSection("Описание текущего положения:", registryItem.currentStateDes),
        SizedBox(
          height: 5.height,
        ),
        _buildTextSection("Описание предлагаемого решения:", registryItem.ideaStateDes),
        SizedBox(
          height: 5.height,
        ),
        _buildTextSection("Ожидаемый положительный эффект:", registryItem.predictedStateDes),
      ],
    );
  }
}