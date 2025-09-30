import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_of_goods_application/features/character/data/repositories/product_repository.dart';
import 'package:warehouse_of_goods_application/features/character/domain/usecases/add_product.dart';
import 'package:warehouse_of_goods_application/features/character/domain/usecases/delete_product.dart';
import 'package:warehouse_of_goods_application/features/character/presentation/bloc/product_bloc.dart';
import 'package:warehouse_of_goods_application/features/character/presentation/pages/product_screen.dart';

import 'features/character/data/datasources/remote/database/database.dart';

void main() {
  // Инициализация базы данных
  final db = AppDatabase();

  // Репозиторий
  final repository = ProductRepositoryImpl(db);

  // UseCases
  final addUseCase = AddProduct(repository);
  final deleteUseCase = DeleteProduct(repository);

  runApp(MyApp(addUseCase: addUseCase, deleteUseCase: deleteUseCase));
}

class MyApp extends StatelessWidget {
  final AddProduct addUseCase;
  final DeleteProduct deleteUseCase;

  const MyApp({Key? key, required this.addUseCase, required this.deleteUseCase})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Склад товаров',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => ProductCubit(addUseCase, deleteUseCase),
        child: const ProductScreen(),
      ),
    );
  }
}
