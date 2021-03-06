import 'package:flutter/material.dart';
import 'package:rental_mobil/model/car.dart';
import 'package:rental_mobil/constant.dart';
import 'package:rental_mobil/screens/available/widget/car_information.dart';
import 'package:rental_mobil/screens/detail/car_detail_screen.dart';

class CarListItem extends StatelessWidget {
  const CarListItem(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Car car = carList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CarDetailScreen(car);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 20),
        child: Stack(
          children: [
            CarInfomation(car: car),
            Positioned(
              right: 90,
              child: Image.asset(
                car.image,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
