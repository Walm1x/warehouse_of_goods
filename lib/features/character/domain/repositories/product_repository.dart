import 'package:warehouse_of_goods_application/features/character/domain/entities/product.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity product);
  Future<void> deleteProduct(int id);
}
