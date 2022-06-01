import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import './components/chart.dart';
import '../widgets/index.dart';
import '../models/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final List<Course> courseForyou = [
    Course(
      title: "Machine Learning",
      subtitle: "20k+ subscribers",
      image: "ibm.png",
    ),
    Course(
      title: "Deep Learning",
      subtitle: "18k+ subscribers",
      image: "google.png",
    ),
    Course(
      title: "Applied Data Science",
      subtitle: "25k+ subscribers",
      image: "microsoft.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/man.png", width: 35.0),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Bungearnss",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              "Developer",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Icon(Icons.notifications_active_outlined),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Your Course",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                _makeYourCourses(size.width - 40.0),
                const SizedBox(height: 30.0),
                const Text(
                  "Statistics",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 20.0),
                BarChartComponent(),
                const SizedBox(height: 30.0),
                const Text(
                  "For You",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: courseForyou.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ForyouCourse(
                        title: courseForyou[index].title,
                        subtitle: courseForyou[index].subtitle,
                        image: courseForyou[index].image,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        margin: const EdgeInsets.all(20.0),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.design_services),
            title: const Text("Courses"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  /// Make your courses widget.
  Widget _makeYourCourses(double width) {
    double cardWidth = (width / 2) - 5.0;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCourse(
              title: "Data Science with Python",
              hour: "9",
              progress: 0.7,
              color: Colors.teal.withOpacity(0.5),
              width: cardWidth,
            ),
            MyCourse(
              title: "Brain Science",
              hour: "5",
              progress: 0.4,
              color: Colors.red.withOpacity(0.5),
              width: cardWidth,
            ),
          ],
        ),
      ],
    );
  }
}
