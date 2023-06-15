import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import 'home_categories.dart';

class RowMiniCategories extends StatelessWidget {
  const RowMiniCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 6.2,
        color: Pallete.backgroundColor,
        child: ListView.separated(
          padding:
              const EdgeInsetsDirectional.only(top: 10, end: 10, start: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => HomeCategories(
              name: homeCategoriesListname[index],
              img: homeCategoriesListimg[index]),
          itemCount: homeCategoriesListname.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}

List homeCategoriesListname = <String>[
  'BOYS',
  'GIRLS',
  'FOOTWEAR',
  'TOYS',
  'DIAPERING',
  'GEAR',
  'FEEDING',
  'BATH',
  'NURSERY',
  'MOMS',
  'HEALTH',
  'BOUTIQUES'
];

List homeCategoriesListimg = <String>[
  'https://drive.google.com/uc?export=view&id=1mz-4YQCtVgBbzcDTB8IeM4IG1Q7DdKv0',
  'https://img.freepik.com/free-photo/excited-ginger-lady-hat-holding-straw-bag-ecstatic-long-haired-girl-summer-outfit-enjoying-good-day_197531-11080.jpg?w=996&t=st=1685376435~exp=1685377035~hmac=75c0c11f171e11ab496dd15768c0fba66a1926f74d0ea5ca4364e70881d11a90',
  'https://www.fisdom.com/wp-content/uploads/2022/07/Campus-Activewear.png',
  'https://images-cdn.ubuy.co.in/6421a0e99d210c29112c3843-hahaland-toddler-toys-for-1-year-old-boy.jpg',
  'https://cdn-de.agrilife.org/extension/departments/fch/diapering-toilet-learning-inclusive-infant-toddler-care/courses/images/diapering-and-toilet-learning-primary2.jpg',
  'https://res.cloudinary.com/babylist/image/upload/f_auto,q_auto:best,c_scale,w_768/v1659997704/hello-baby/Baby_Gear_Save_vs._Splurge.jpg',
  'https://cdn.cdnparenting.com/articles/2018/09/sleep-and-feeding-schedule-for-your-three-month-old.webp',
  'https://cdn.cdnparenting.com/articles/2018/09/pexels-photo-914253.jpeg ',
  'https://cdn.shopify.com/s/files/1/0310/2988/7114/articles/nursery_ideas_1200x.jpg?v=1639090532',
  'https://imgix.bustle.com/uploads/getty/2022/2/25/59bcef24-120c-4206-8ba6-3576dfccf8ed-getty-1369926717.jpg?w=540&fit=crop&crop=faces&auto=format%2Ccompress',
  'https://www.uhc.com/health-and-wellness/health-topics/childrens-health/child-well-visits/_jcr_content/root/regioncontainer-main/responsivegrid/image.coreimg.82.1280.jpeg/1613218628653/child-well-visit-baby-stethoscope-860x506.jpeg',
  'https://alamocitymoms.com/wp-content/uploads/2022/05/F0A067F8-D6CB-495E-90A5-DAF9FD5BF521-scaled.jpeg'
];
