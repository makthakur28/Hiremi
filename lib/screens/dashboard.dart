import 'package:flutter/material.dart';
import 'package:hiremi/widgets/dashboard_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<dynamic> featuredList;
  @override
  void initState() {
    super.initState();
    featuredList = [
      {
        'icon': Icons.yard_outlined,
        'text': 'Internships',
        'color': const Color.fromARGB(255, 255, 153, 0)
      },
      {
        'icon': Icons.local_post_office,
        'text': 'Freshers Jobs',
        'color': const Color.fromARGB(246, 255, 81, 7)
      },
      {
        'icon': Icons.person_2_outlined,
        'text': 'Experinced Jobs',
        'color': const Color.fromARGB(255, 164, 18, 255)
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 100, child: userCard()),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Explore Hiremi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            SliverToBoxAdapter(
              child: ExploreHiremiCard(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text("Hiremi's Featured",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return featuredCard(index,featuredList);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 6,
                        ),
                    itemCount: 3),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Latest Opportunities",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return LatOppCard();
                },
                childCount: 5,
              ),
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: SizedBox(
      //   width: 75,
      //   height: 75,
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     splashColor: Colors.white,
      //     shape: const CircleBorder(
      //         side: BorderSide(color: Colors.white, style: BorderStyle.solid)),
      //     child: Container(
      //       padding: EdgeInsets.all(8),
      //       child: const Wrap(
      //         alignment: WrapAlignment.center,
      //         children: [
      //           Icon(
      //             Icons.workspaces_rounded,
      //             color: Colors.red,
      //           ),
      //           Text(
      //             'HIREMI',
      //             style: TextStyle(color: Colors.black),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   // selectedIndex: Provider.of<NavProvider>(context,listen: false).selectedIndex,
      //   onItemTapped: (p0) {

      //     Provider.of<NavProvider>(context,listen: false).onItemTapped(p0);
      //   },
      // ),
    );
  }
}
