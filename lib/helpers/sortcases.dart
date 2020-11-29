import 'package:rosseti/models/registry_item.dart';

enum SortVar {
  popularity,
  status,
  date,
  uniq,
}

extension Comparators on SortVar {
  int Function(RegistryItem, RegistryItem) get comparator {
    switch (this) {
      case SortVar.date:
        return comparatorDate;
      case SortVar.popularity:
        return comparatorPopularity;
      case SortVar.uniq:
        return comparatorUniq;
      case SortVar.status:
        return comparatorStatus;
      default:
        return comparatorPopularity;
    }
  }

  String get asString {
    switch (this) {
      case SortVar.popularity:
        return "Популярность";
      case SortVar.status:
        return "Статус";
      case SortVar.uniq:
        return "Уникальность";
      case SortVar.date:
        return "Дата";
    }
  }

  int comparatorPopularity(
    RegistryItem item1,
    RegistryItem item2,
  ) {
    return item1.popularity - item2.popularity;
  }

  int comparatorDate(
    RegistryItem item1,
    RegistryItem item2,
  ) {
    return item1.date.compareTo(item2.date);
  }

  int comparatorStatus(
    RegistryItem item1,
    RegistryItem item2,
  ) {
    return item1.status.index - item2.status.index;
  }

  int comparatorUniq(
    RegistryItem item1,
    RegistryItem item2,
  ) {
    return item1.uniq - item2.uniq;
  }
}
