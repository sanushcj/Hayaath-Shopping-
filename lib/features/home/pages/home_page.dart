import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/common/alltextfields.dart';
import 'package:hayaath_shopping/features/home/widgets/horizontal_listview.dart';
import 'package:hayaath_shopping/theme/colors.dart';
import '../widgets/homefeed_container.dart';
import '../widgets/image_and_title.dart';
import '../widgets/mycarosal.dart';
import '../widgets/rowmini.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Pallete.backgroundColor,
        centerTitle: true,
        title: Text(
          'Hayaath Shopping',
          style: TextStyle(
              fontSize: 40, color: Pallete.premium, fontFamily: "LogoName"),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
                child: SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    placeholder: "Search hayaath.com",
                  ),
                ),
              ),
              MyCarosal(),
              RowMiniCategories(),
              DefaultFeedContainer(
                title1: 'iPhone 14 Pro Max',
                seeall: '',
                productimg1:
                    'https://images.unsplash.com/photo-1680687688158-e9165395ff00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGlwaG9uZSUyMDE0JTIwcHJvJTIwbWF4fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                onTap1: '',
                title2: 'Motorola Edge 40',
                productimg2:
                    'https://mobiledrop.in/wp-content/uploads/2023/05/Motorola-Edge-40-5G-Coronet-Blue-color-back-design.jpg',
                onTap2: '',
                title3: 'Samsung S23',
                productimg3:
                    'https://images.samsung.com/in/smartphones/galaxy-s23/images/galaxy-s23-share-image.jpg',
                onTap3: '',
                title4: 'OnePlus 11',
                productimg4:
                    'https://imageio.forbes.com/specials-images/imageserve/64786f5b54c3597b9b7b69d9/OnePlus-11-Marble-Odyssey-Edition-back-/960x0.jpg?format=jpg&width=960',
                onTap4: '',
                maintitle: 'UPGRADE TO 5G 🔥',
                maintitlesize: 25,
              ),
              Divider(
                thickness: 1,
                color: Pallete.greyColor,
              ),
              TitleWithImage(
                onTap: '',
                productimg:
                    'https://images.unsplash.com/photo-1593644311729-d0b478c97d95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                title: '40% off on Canon Camera Make yours one !',
              ),
              Divider(
                thickness: 1,
                color: Pallete.greyColor,
              ),
              HorizontalView()
            ],
          ),
        ),
      ),
    );
  }
}
