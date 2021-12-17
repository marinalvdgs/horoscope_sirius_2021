import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common_widgets/bottom_container.dart';
import 'package:horoscope_sirius_2021/common_widgets/resizing_logo.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';

class PageWithResizingImage extends StatelessWidget {
  final String logoImage;
  final String logoTitle;
  final Widget content;
  final Widget? appBar;
  const PageWithResizingImage({
    Key? key,
    required this.logoImage,
    required this.logoTitle,
    required this.content,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  ResizingLogo(
                    image: logoImage,
                    title: logoTitle,
                  ),
                  if (appBar != null)
                    Positioned(left: 0, right: 0, top: 0, child: appBar!)
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: BottomContainer(child: content),
            ),
          ],
        ),
      ),
    );
  }
}
