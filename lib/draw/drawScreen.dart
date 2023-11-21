import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gallery360/pages/MainPart/screen/main_page.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/pages/artist/artist_main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final DataController _dataController = Get.put(DataController());
  final zoomDrawerController = ZoomDrawerController();
  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {

    return ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        borderRadius: ResponsiveBreakpoints.of(context).isMobile ? 40 : 30,
        angle: -8,
        slideWidth:  MediaQuery.of(context).size.width * (ResponsiveBreakpoints.of(context).isMobile ? 0.7 : 0.4),
        showShadow: true,
        shadowLayer2Color: Colors.orangeAccent,
        menuScreen: Builder(
          builder: (context) => MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item){
              setState(() {
                currentItem = item;

                ZoomDrawer.of(context)!.close();
              });
            },
          ),
        ),
        mainScreen: getScreen(),
    );
  }

  Widget getScreen(){
    switch (currentItem){
      case MenuItems.home:
        return const MainPage();
      case MenuItems.vrgallery:
        return const ArtistMainPage();
      default:
        return const ArtistMainPage();
    }
  }
}

class MenuItem{
  final String title;
  final IconData icon;
  const MenuItem({required this.title, required this.icon});
}


class MenuItems{
  static const home = MenuItem(title: 'Home', icon: Icons.home);
  static const vrgallery = MenuItem(title: 'VR 갤러리', icon: Icons.vrpano);
  static const art = MenuItem(title: '작품', icon: Icons.art_track);
  static const artist = MenuItem(title: '작가', icon: Icons.article_sharp);
  static const vrshow = MenuItem(title: 'VR 대관', icon: Icons.shop);
  static const tech = MenuItem(title: 'Tech', icon: Icons.biotech);
  static const aboutus = MenuItem(title: 'About Us', icon: Icons.abc_outlined);
  static const all = <MenuItem>[
    home,
    vrgallery,
    art,
    artist,
    vrshow,
    tech,
    aboutus
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuScreen({super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(flex: 2,),
          ],
        )
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: (){
        return onSelectedItem(item);
      },
    ),

  );
}

