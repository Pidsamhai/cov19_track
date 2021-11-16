import 'package:flutter/material.dart';

class ProfileAppBar extends AppBar {
  ProfileAppBar({Key? key}) : super(key: key);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  double? get elevation => 0;

  @override
  Color? get foregroundColor => Colors.black;

  @override
  double? get titleSpacing => 0;

  @override
  Widget? get leading => Row(
        children: [
          SizedBox(
            width: preferredSize.height - 10,
            height: preferredSize.height - 10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset("assets/profile_pic.jpg"),
            ),
          ),
        ],
      );

  @override
  Widget? get title => const Text("Psm dev");

  @override
  List<Widget>? get actions => [
        IconButton(onPressed: () => {}, icon: const Icon(Icons.notifications)),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.bookmark))
      ];
}
