import 'package:flutter/material.dart';

import '%5Bid%5D.dart';
import '../../widgets/master_detail.dart';

class Books extends StatelessWidget {
  const Books({Key? key, this.automaticallyImplyLeading = true})
      : super(key: key);

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return MasterDetail(
      title: 'Books',
      automaticallyImplyLeading: automaticallyImplyLeading,
      items: List.generate(100, (index) => '$index'),
      detailBuilder: (item) => Book(id: item, automaticallyImplyLeading: false),
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
