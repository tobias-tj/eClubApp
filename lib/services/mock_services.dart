import 'package:e_club/models/expense_item.dart';
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

  static List<ExpenseMonth> getmockExpenses() {
    final restaurantCatId = UniqueKey().toString();
    final shoppingCatId = UniqueKey().toString();
    final transportCatId = UniqueKey().toString();
    return [
      ExpenseMonth(month: 'Abril 2025', total: 550000, categories: [
        ExpenseCategory(
            id: restaurantCatId,
            name: 'Restaurantes y bares',
            icon: Icons.restaurant,
            total: 180000,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Lido Bar',
                  amount: 60000,
                  dateTime: DateTime(2025, 4, 6, 13, 20)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Hamburguesería XYZ',
                  amount: 120000,
                  dateTime: DateTime(2025, 4, 18, 21)),
            ]),
        ExpenseCategory(
            name: 'Compras',
            id: shoppingCatId,
            icon: Icons.shopping_bag,
            total: 220000,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Tienda Stock',
                  amount: 100000,
                  dateTime: DateTime(2025, 4, 9, 11, 30)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'La Vienesa',
                  amount: 120000,
                  dateTime: DateTime(2025, 4, 20, 10, 15)),
            ]),
        ExpenseCategory(
            id: transportCatId,
            name: 'Transporte',
            icon: Icons.bus_alert,
            total: 150000,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Uber',
                  amount: 60000,
                  dateTime: DateTime(2025, 4, 2, 7, 50)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Bolt',
                  amount: 90000,
                  dateTime: DateTime(2025, 4, 16, 19, 45))
            ])
      ]),
      ExpenseMonth(month: 'Mayo 2025', total: 620000, categories: [
        ExpenseCategory(
            id: restaurantCatId,
            name: 'Restaurantes y bares',
            total: 200000,
            icon: Icons.restaurant,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'McDonald\'s',
                  amount: 50000,
                  dateTime: DateTime(2025, 5, 2, 12)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Pizza hut',
                  amount: 75000,
                  dateTime: DateTime(2025, 5, 10, 19, 30)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Johnny B. Good',
                  amount: 75000,
                  dateTime: DateTime(2025, 5, 22, 22)),
            ]),
        ExpenseCategory(
            id: shoppingCatId,
            name: 'Compras',
            icon: Icons.shopping_bag,
            total: 270000,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Farmacenter',
                  amount: 70000,
                  dateTime: DateTime(2025, 5, 5, 9, 15)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Ferretería ABC',
                  amount: 200000,
                  dateTime: DateTime(2025, 5, 19, 16)),
            ]),
        ExpenseCategory(
            id: transportCatId,
            name: 'Transporte',
            icon: Icons.bus_alert,
            total: 150000,
            expenses: [
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Uber',
                  amount: 50000,
                  dateTime: DateTime(2025, 5, 3, 8, 40)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Bolt',
                  amount: 60000,
                  dateTime: DateTime(2025, 5, 15, 18, 20)),
              ExpenseItem(
                  id: UniqueKey().toString(),
                  place: 'Uber',
                  amount: 40000,
                  dateTime: DateTime(2025, 5, 28, 21, 30))
            ]),
      ]),
      ExpenseMonth(
        month: 'Junio 2025',
        total: 705133,
        categories: [
          ExpenseCategory(
            id: restaurantCatId,
            name: 'Restaurantes y bares',
            total: 230000,
            icon: Icons.restaurant,
            expenses: [
              ExpenseItem(
                id: UniqueKey().toString(),
                place: 'El Café de Aca',
                amount: 57000,
                dateTime: DateTime(2025, 6, 5, 10, 30),
              ),
              ExpenseItem(
                id: UniqueKey().toString(),
                place: 'Hard Rock Café',
                amount: 95000,
                dateTime: DateTime(2025, 6, 12, 20, 45),
              ),
              ExpenseItem(
                id: UniqueKey().toString(),
                place: 'TGI Fridays',
                amount: 78000,
                dateTime: DateTime(2025, 6, 20, 21, 10),
              ),
            ],
          ),
          ExpenseCategory(
              id: shoppingCatId,
              name: 'Compras',
              total: 300000,
              icon: Icons.shopping_bag,
              expenses: [
                ExpenseItem(
                    id: UniqueKey().toString(),
                    place: 'Shopping del Sol',
                    amount: 120000,
                    dateTime: DateTime(2025, 6, 18, 15, 20)),
                ExpenseItem(
                    id: UniqueKey().toString(),
                    place: 'Paseo La Galería',
                    amount: 180000,
                    dateTime: DateTime(2025, 6, 15, 17, 10)),
              ]),
          ExpenseCategory(
              id: transportCatId,
              name: 'Transporte',
              total: 175133,
              icon: Icons.bus_alert,
              expenses: [
                ExpenseItem(
                    id: UniqueKey().toString(),
                    place: 'Uber',
                    amount: 73300,
                    dateTime: DateTime(2025, 6, 3, 8, 10)),
                ExpenseItem(
                    id: UniqueKey().toString(),
                    place: 'Bolt',
                    amount: 71833,
                    dateTime: DateTime(2025, 6, 10, 19, 50)),
                ExpenseItem(
                    id: UniqueKey().toString(),
                    place: 'Uber',
                    amount: 30000,
                    dateTime: DateTime(2025, 6, 25, 22, 15))
              ])
        ],
      ),
    ];
  }
}
