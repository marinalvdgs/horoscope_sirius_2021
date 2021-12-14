import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({Key? key}) : super(key: key);

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const TabBar(
              tabs: [
                Tab(text: "Yesterday"),
                Tab(text: "Today"),
                Tab(text: "Tomorrow"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return const SingleChildScrollView(
                      child: Text(
                    'fkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjffkdsfhsdjhfjdshfjhdsfjhdsjfhdsjhfdsjf',
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
