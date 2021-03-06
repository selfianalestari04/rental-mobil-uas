import 'package:flutter/material.dart';
import 'package:rental_mobil/login.dart';
import 'package:rental_mobil/constant.dart';
import 'package:rental_mobil/screens/available/widget/car_list_item.dart';


class AvailableCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: IconButton(
        icon: Icon(
          Icons.account_circle,
          size: 60,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('Account'),
          // onTap: () => Navigator.of(context).push(_NewPage()),
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LoginPage();
          })),
        ),
      ],
    );
    return Scaffold(
        backgroundColor: Color(0xff2196f3),
        appBar: buildAppBar(),
        body: ListView.builder(
          itemCount: carList.length,
          itemBuilder: (context, index) => CarListItem(index),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: mCardColor,
      elevation: 0,
      title: Text('Car Rental'),
    );
  }
}
