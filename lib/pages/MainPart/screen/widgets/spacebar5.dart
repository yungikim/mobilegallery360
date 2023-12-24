import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../const/const.dart';
import '../../../../util/Util.dart';

class SpaceBar5 extends StatelessWidget {
  const SpaceBar5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      alignment: Alignment.center,
      //  color: Colors.red,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/mainPage/banner-04-img.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tr('main_45'),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              tr('main_46'),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
               // Get.to(()=> const ShowMyRoom(), transition: Transition.fadeIn);
                String url = "$base_url/main/myspace.jsp";
                Util.UrlOpenWebview(url, tr('main_8'));
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                backgroundColor: Colors.black,
              ),
              child: Text(
                tr('main_47'),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
