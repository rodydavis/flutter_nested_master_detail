import 'package:flutter/material.dart';

import '../widgets/master_detail.dart';
import 'books/index.dart';
import 'items/index.dart';
import 'songs/index.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const routes = [
      Items(automaticallyImplyLeading: false),
      Songs(automaticallyImplyLeading: false),
      Books(automaticallyImplyLeading: false),
    ];
    return MasterDetail(
      title: 'Routes',
      items: routes,
      detailBuilder: (item) => item,
      routeBuilder: (item) {
        if (item is Items) return '/items';
        if (item is Songs) return '/songs';
        if (item is Books) return '/books';
        return '/';
      },
      itemBuilder: (item, selected, onSelect) {
        final name = item.runtimeType.toString();
        return ListTile(
          title: Text(name),
          selected: selected,
          trailing: const Icon(Icons.chevron_right),
          onTap: () => onSelect(),
        );
      },
    );
  }
}
