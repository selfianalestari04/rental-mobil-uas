import 'package:flutter/material.dart';
import 'package:rental_mobil/model/car.dart';
import 'package:rental_mobil/screens/detail/widget/car_detail_informasi.dart';
import 'package:rental_mobil/screens/detail/widget/my_app_bar.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/w.jpeg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            MyAppbar(),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Stack(
                children: [
                  CarDetailInfomation(car: car),
                  Positioned(
                    right: 16,
                    child: Image.asset(
                      car.image,
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
