import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MasterDetail<T> extends StatefulWidget {
  const MasterDetail({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.detailBuilder,
    required this.routeBuilder,
    this.automaticallyImplyLeading = true,
  });

  final bool automaticallyImplyLeading;
  final List<T> items;
  final String title;
  final Widget Function(T, bool, VoidCallback) itemBuilder;
  final Widget Function(T) detailBuilder;
  final String Function(T) routeBuilder;

  @override
  State<MasterDetail<T>> createState() => _MasterDetailState<T>();
}

class _MasterDetailState<T> extends State<MasterDetail<T>> {
  T? value;

  void onSelect(T? value) {
    if (mounted) {
      setState(() {
        this.value = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth > 720 && dimens.maxHeight > 720) {
          return Row(
            children: [
              SizedBox(
                width: 300,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  ),
                  body: ListView.separated(
                    separatorBuilder: ((context, index) =>
                        const Divider(height: 0)),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return widget.itemBuilder(item, value == item, () {
                        onSelect(item);
                      });
                    },
                  ),
                ),
              ),
              const VerticalDivider(width: 0),
              Expanded(
                child: value == null
                    ? const Material(
                        child: Center(child: Text('Select an item')),
                      )
                    : widget.detailBuilder(value as T),
              )
            ],
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
          ),
          body: ListView.separated(
            separatorBuilder: ((context, index) => const Divider(height: 0)),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return widget.itemBuilder(item, false, () {
                onSelect(item);
                context.push(widget.routeBuilder(item));
              });
            },
          ),
        );
      },
    );
  }
}
