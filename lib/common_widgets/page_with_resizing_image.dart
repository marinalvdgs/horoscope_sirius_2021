import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common_widgets/bottom_container.dart';
import 'package:horoscope_sirius_2021/common_widgets/resizing_logo.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/register_form.dart';

class PageWithResizingImage extends StatelessWidget {
  final String logoImage;
  final String logoTitle;
  final Widget content;
  const PageWithResizingImage({
    Key? key,
    required this.logoImage,
    required this.logoTitle,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: ResizingLogo(
            image: logoImage,
            title: logoTitle,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BottomContainer(child: content),
          ),
        ],
      ),
    );
  }
}
