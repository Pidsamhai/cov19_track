import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectorBottonItem<K, V> {
  final K key;
  final V value;
  SelectorBottonItem(this.key, this.value);
}

class SelectorBottonWidget<K, V> extends StatelessWidget {
  final List<SelectorBottonItem<K, V>> buttons;
  final SelectorBottonItem<K, V> selected;
  final ValueChanged<SelectorBottonItem<K, V>>? onSelected;
  final BorderRadius _radius = BorderRadius.circular(100);

  SelectorBottonWidget({
    Key? key,
    required this.buttons,
    required this.selected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      spacing: 10,
      children:
          buttons.map((e) => buildButtons(onSelected, e, selected)).toList(),
    );
  }

  Widget buildButtons(
    ValueChanged<SelectorBottonItem<K, V>>? onSelected,
    SelectorBottonItem<K, V> item,
    SelectorBottonItem<K, V> selected,
  ) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: _radius,
      ),
      onTap: () => onSelected?.call(item),
      child: Container(
        decoration: selected == item
            ? BoxDecoration(
                border: Border.all(),
                borderRadius: _radius,
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 4,
            top: 4,
          ),
          child: Text(item.key.toString()),
        ),
      ),
    );
  }
}
