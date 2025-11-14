import 'package:exam_time_tracker/features/create_timer/presentation/pages/create_timer_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context);
    const double spaceBetweenElements = 12.0;
    const double spaceFromSides = 12.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // space between top and create timer
        const SizedBox(height: spaceBetweenElements),

        //Create new timer card
        Card(
          margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(Icons.timer),
            title: Text('Create new timer'),
            trailing: Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateTimerPage()),
              );
            },
          ),
        ),

        const SizedBox(height: spaceBetweenElements),

        Card(
          margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
          color: customColors.colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              AppBar(
                title: Text('Saved timers'),
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(12), topLeft: Radius.circular(12))
                ),
              ),
              
              const SizedBox(height: spaceBetweenElements),

              Card(
                margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('timer1'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              const SizedBox(height: spaceBetweenElements),

              Card(
                margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('timer2'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              const SizedBox(height: spaceBetweenElements),

              Card(
                margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('timer3'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              const SizedBox(height: spaceBetweenElements),

              Card(
                margin: EdgeInsets.symmetric(horizontal: spaceFromSides),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('timer4'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              const SizedBox(height: spaceBetweenElements),
            ],
          ),
        ),

        Container(

        )
      ],
    );
  }
}