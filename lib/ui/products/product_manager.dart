import 'package:flutter/foundation.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';

import 'package:test/models/product.dart';

class ProducsManager with ChangeNotifier {
  final List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Trà Sữa Truyền Thống',
      description: 'Hàng bán chạy',
      price: 1,
      imageUrl:
          'https://cf.shopee.vn/file/2d4ff2d412055e790a770d53d65684e6',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Trà Sữa Matcha',
      description: 'Hàng hot',
      price: 1.2,
      imageUrl:
          'https://cdn.tgdd.vn/Files/2021/12/09/1403510/cach-lam-matcha-tran-chau-duong-den-uong-ngon-cuc-thich-202112092206182099.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Trà Sữa Socola',
      description: 'Ngon quãi đạn',
      price: 1.3,
      imageUrl:
          'https://debokor.com/Thumb.ashx?s=580&file=/UploadImages/shops/Debokor/socola.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Trà Sữa Trân Châu Đường Đen',
      description: 'Tạm uống được',
      price: 1.5,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZxmLAY4aypttu-PrNXSs0q__gQgYsZsuTbA&usqp=CAU',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _item.length;
  }

  List<Product> get items {
    return [..._item];
  }

  List<Product> get favoriteItems {
    return _item.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _item.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  void addProduct(Product product) {
    _item.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _item.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _item[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _item.indexWhere((item) => item.id == id);
    _item.removeAt(index);
    notifyListeners();
  }
}


  