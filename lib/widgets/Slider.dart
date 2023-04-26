import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/DefultCarouselSlider.dart';

import '../core/getAllImageService.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,

      //width: double.infinity,
      child: FutureBuilder(
          future: getImagesFromFirebaseStorage(NameofFolder: 'suites'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('error happend'));
            } else if (snapshot.hasData) {
              final List ListUrl = snapshot.data!;
              return Defult_Carouse_lSlider(imgList: ListUrl);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
