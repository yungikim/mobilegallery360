import 'package:flutter/material.dart';

import '../../util/Util.dart';

class Tech extends StatelessWidget {
  const Tech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: actionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: customAppBar(context),
      ),
    );
  }
}
