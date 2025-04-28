import 'package:e_club/models/movement_model.dart';
import 'package:flutter/material.dart';

class MockService {
  static List<MovementModel> getMovements() {
    return [
      MovementModel(
        title: "Playstation Network",
        category: "Entretenimiento",
        monto: "1.000",
        date: "07/06/25",
        type: 1,
        icon: Icons.movie,
      ),
      MovementModel(
        title: "Banco Regional",
        category: "Retiros",
        monto: "150.000",
        date: "08/06/25",
        type: 1,
        icon: Icons.account_balance,
      ),
      MovementModel(
        title: "Punto Farma",
        category: "Salud",
        monto: "1.000.000",
        date: "09/06/25",
        type: 2,
        icon: Icons.favorite,
      ),
    ];
  }
}
