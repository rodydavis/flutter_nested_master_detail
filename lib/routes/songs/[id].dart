import 'package:flutter/material.dart';

import '../../widgets/master_detail.dart';

class Song extends StatelessWidget {
  const Song({
    super.key,
    required this.id,
    this.automaticallyImplyLeading = true,
  });

  final String id;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return MasterDetail(
      title: 'Song: $id',
      automaticallyImplyLeading: automaticallyImplyLeading,
      items: List.generate(100, (index) => '$index'),
      routeBuilder: (item) => '/items/$item',
      detailBuilder: (item) => Song(id: item, automaticallyImplyLeading: false),
      itemBuilder: (item, selected, onSelect) => ListTile(
        title: Text(item),
        selected: selected,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => onSelect(),
      ),
    );
  }
}
