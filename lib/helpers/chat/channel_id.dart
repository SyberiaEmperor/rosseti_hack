
import 'dart:collection';
import 'dart:convert';

String encodeChannelId(String channelName, Map channelParams) {
  final fullChannelName =
      channelName.endsWith('Channel') ? channelName : "${channelName}Channel";

  Map channelId = channelParams == null ? {} : Map.from(channelParams);
  channelId['channel'] ??= fullChannelName;

  final orderedMap = SplayTreeMap.from(channelId);
  return jsonEncode(orderedMap);
}

String parseChannelId(String channelId) {
  return jsonEncode(SplayTreeMap.from(jsonDecode(channelId)));
}
