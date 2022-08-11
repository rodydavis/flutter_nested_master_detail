import 'package:flutter/material.dart';

import '../../widgets/master_detail.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.id,
    this.automaticallyImplyLeading = true,
  });

  final String id;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return MasterDetail(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: 'Item: $id',
      items: List.generate(100, (index) => '$index'),
      routeBuilder: (item) => '/items/$item',
      detailBuilder: (item) => Item(id: item, automaticallyImplyLeading: false),
      itemBuilder: (item, selected, onSelect) => ListTile(
        title: Text(item),
        selected: selected,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => onSelect(),
      ),
    );
  }
}
