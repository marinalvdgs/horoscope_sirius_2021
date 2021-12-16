import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/services/compatibility_service.dart';

class SignsCompatibilityScreen extends StatefulWidget {
  final String woman;
  final String man;
  const SignsCompatibilityScreen({
    Key? key,
    required this.woman,
    required this.man,
  }) : super(key: key);

  @override
  State<SignsCompatibilityScreen> createState() =>
      _SignsCompatibilityScreenState();
}

class _SignsCompatibilityScreenState extends State<SignsCompatibilityScreen> {
  late final loadData = compatibilityService.state
      .getCompatibilityForSigns(woman: widget.woman, man: widget.man);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData,
      builder: (context, data) {
        if (!data.hasData) {
          return const MagicLoader();
        }
        return Container();
      },
    );
  }
}
