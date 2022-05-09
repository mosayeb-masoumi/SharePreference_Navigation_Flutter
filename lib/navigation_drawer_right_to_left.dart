import 'package:flutter/material.dart';
import 'package:navigation_drawer_flutter/home_page.dart';

class NavigationDrawerRightToLeft extends StatelessWidget {
  const NavigationDrawerRightToLeft({Key? key}) : super(key: key);

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

        onTap: (){
          print("avatar tapped");
        },

        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage("https://mpng.subpng.com/20180712/jus/kisspng-computer-icons-user-profile-encapsulated-postscrip-bigode-5b46f43d5cd3f3.6508150915313767013802.jpg"),
              ),

              SizedBox(height: 12,),
              Text("user name" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              SizedBox(height: 12,),
              Text("username@gmail.com" , style: TextStyle(fontSize: 15 ),),

              SizedBox(height: 12,),
            ],
          ),

        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Wrap(
        runSpacing: 16,  // vertical spacing
        children: [
          ListTile(
            trailing: const Icon(Icons.home),

            title: const Text("home", textAlign: TextAlign.end,),
            onTap: (){

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
            title: const Text("favorite", textAlign: TextAlign.end,),
            onTap: (){},
          ),

          ListTile(
            leading: const Icon(Icons.arrow_drop_down),
            trailing: const Icon(Icons.update),
            title: const Text("update" , textAlign: TextAlign.end,),
            onTap: (){},
          ),

          const Divider(color: Colors.grey,),

          ListTile(
            trailing: const Icon(Icons.notifications),
            title: const Text("notification", textAlign: TextAlign.end,),
            onTap: (){},
          ),
        ],

      ),
    );
  }
}
