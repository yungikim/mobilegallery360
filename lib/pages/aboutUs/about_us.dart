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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  Container(
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/images/mainPage/company_brief_visual.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1111"),
                  Text("22222")
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
