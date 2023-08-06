import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/home/widgets/DefultCarouselSlider.dart';

import '../../../core/getAllImageService.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: FutureBuilder(
          future: getImagesFromFirebaseStorage(NameofFolder: 'suites'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('error happend'));
            } else if (snapshot.hasData) {
              final List ListUrl = snapshot.data!;
              return Defult_Carouse_lSlider(imgList: ListUrl);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
