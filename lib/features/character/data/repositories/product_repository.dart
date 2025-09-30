import 'package:warehouse_of_goods_application/features/character/data/datasources/remote/database/database.dart';
import 'package:warehouse_of_goods_application/features/character/domain/entities/product.dart';
import 'package:warehouse_of_goods_application/features/character/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase db;

  ProductRepositoryImpl(this.db);

  @override
  Future<void> addProduct(ProductEntity product) async {
    await db
        .into(db.products)
        .insert(
          ProductsCompanion.insert(
            name: product.name,
            id: product.id,
            count: product.count,
            price: product.price,
            categoryNumber: product.categoryNumber,
            // другие поля
          ),
        );
  }

  @override
  Future<void> deleteProduct(int id) async {
    await (db.delete(db.products)..where((tbl) => tbl.id.equals(id))).go();
  }
}
