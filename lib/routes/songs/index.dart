import 'package:flutter/material.dart';

import '%5Bid%5D.dart';
import '../../widgets/master_detail.dart';

class Songs extends StatelessWidget {
  const Songs({Key? key, this.automaticallyImplyLeading = true})
      : super(key: key);

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return MasterDetail(
      title: 'Songs',
      items: List.generate(100, (index) => '$index'),
      detailBuilder: (item) => Song(id: item, automaticallyImplyLeading: false),
      routeBuilder: (item) => '/items/$item',
      itemBuilder: (item, selected, onSelect) => ListTile(
        title: Text(item),
        selected: selected,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => onSelect(),
      ),
    );
  }
}
