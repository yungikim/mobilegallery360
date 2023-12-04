import 'package:flutter/material.dart';
import '../../util/Util.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: customAppBar(context),
      ),
      body: Container(
        height: 500,
        color: Colors.red,
      ),
    );
  }
}
