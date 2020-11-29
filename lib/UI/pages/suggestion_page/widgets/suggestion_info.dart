import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionInfo extends StatelessWidget {
  final RegistryItem registryItem;

  SuggestionInfo(this.registryItem);

  Widget _buildInfoRow(String title, String value,
      {bool isStatus = false, bool showPercentage = false}) {
    return Container(
      margin: EdgeInsets.only(
        top: 5.height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            showPercentage ? "$value%" : value,
            style: TextStyle(
              fontSize: 14,
              color: isStatus ? registryItem.status.asColor : Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.height,
        horizontal: 10.width,
      ),
      width: 320.width,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          _buildInfoRow("Автор",
              "${registryItem.user.surname} ${registryItem.user.name} ${registryItem.user.secondName}"),
          _buildInfoRow("Статус", registryItem.status.asString, isStatus: true),
          _buildInfoRow("Дата создания", registryItem.dateString),
          _buildInfoRow("Поддержали", registryItem.numberAccepted.toString()),
          _buildInfoRow("Уникальность", registryItem.uniq.toString(),
              showPercentage: true),
          _buildInfoRow("Популярность", registryItem.popularity.toString(),
              showPercentage: true),
        ],
      ),
    );
  }
}
