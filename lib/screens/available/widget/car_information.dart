import 'package:flutter/material.dart';
import 'package:rental_mobil/model/car.dart';
import 'package:rental_mobil/widget/attribute.dart';
import 'package:rental_mobil/constant.dart';

class CarInfomation extends StatelessWidget {
  const CarInfomation({
    Key key,
    @required this.car,
  }) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 24, right: 24, top: 50),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mCardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(
            '\RP. ${car.price}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'harga/hari',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Attribute(
                value: car.brand,
                name: 'Brand',
              ),
              Attribute(
                value: car.model,
                name: 'Plat Nomor',
              ),
              Attribute(
                value: car.co2,
                name: 'CC',
              ),
              Attribute(
                value: car.fuelCons,
                name: 'Konsumsi BBM',
              ),
            ],
          )
        ],
      ),
    );
  }
}
