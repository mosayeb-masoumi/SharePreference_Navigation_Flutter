import 'package:flutter/material.dart';
import 'package:navigation_drawer_flutter/home_page.dart';

class NavigationDrawerRightToLeftSubList extends StatefulWidget {
  const NavigationDrawerRightToLeftSubList({Key? key}) : super(key: key);

  @override
  _NavigationDrawerRightToLeftSubListState createState() =>
      _NavigationDrawerRightToLeftSubListState();
}

class _NavigationDrawerRightToLeftSubListState
    extends State<NavigationDrawerRightToLeftSubList> {
  bool showSubList = false;
  List<String> subList = [
    "sublist 1",
    "sublist 2",
    "sublist 3",
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: InkWell(
        onTap: () {
          print("avatar tapped");
        },
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    "https://mpng.subpng.com/20180712/jus/kisspng-computer-icons-user-profile-encapsulated-postscrip-bigode-5b46f43d5cd3f3.6508150915313767013802.jpg"),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "user name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "username@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Wrap(
          // runSpacing: 16,  // vertical spacing
          children: [
            ListTile(
              trailing: const Icon(Icons.home),
              title: const Text(
                "home",
                textAlign: TextAlign.end,
              ),
              onTap: () {
                // close navigation before
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              trailing: const Icon(Icons.favorite),
              title: const Text(
                "favorite",
                textAlign: TextAlign.end,
              ),
              onTap: () {},
            ),


            GestureDetector(
              onTap: () {
                setState(() {
                  showSubList = !showSubList;
                });
              },
              child: ExpansionTile(
                trailing: const Icon(Icons.update),
                leading: showSubList == false
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.arrow_drop_up),
                title: Text("update", textAlign: TextAlign.end),
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: subList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          trailing: const Icon(Icons.update),
                          title: Text(
                            subList[index],
                            textAlign: TextAlign.end,
                          ),
                          onTap: () {
                            String title = subList[index];
                            print("$title  clicked");
                          },
                        );
                      })
                ],
              ),
            ),


            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              trailing: const Icon(Icons.notifications),
              title: const Text(
                "notification",
                textAlign: TextAlign.end,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
