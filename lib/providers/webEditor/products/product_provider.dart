import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String? _imagePath;
  String? _productName;
  String? _productPrice;
  String? _productDescription;
// Default constructor
  Product({String? imagePath, String? productName, String? productPrice, String? productDescription})
      : _imagePath = imagePath,
        _productName = productName,
        _productPrice = productPrice,
        _productDescription = productDescription;

  String get imagePath => _imagePath!;

  set imagePath(String value) {
    _imagePath = value;
  }

  String get productName => _productName!;

  set productName(String value) {
    _productName = value;
  }

  String get productPrice => _productPrice!;

  set productPrice(String value) {
    _productPrice = value;
  }

  String get productDescription => _productDescription!;

  set productDescription(String value) {
    _productDescription = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': _imagePath,
      'productName': _productName,
      'productPrice': _productPrice,
      'productDescription': _productDescription,
    };
  }

  // Factory constructor to create object from map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      imagePath: map['imagePath'],
      productName: map['productName'],
      productPrice: map['productPrice'],
      productDescription: map['productDescription'],
    );
  }

}

class WebProductsProvider extends ChangeNotifier {
  List<Product> _listProducts = [];

  WebProductsProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, 'ProductsList') ?? [];
        _listProducts.clear();
        for (var element in dynlist) {
          if (element is Map<String, dynamic>) {
            Product product = Product();
            product.imagePath = element['imagePath'];
            product.productName = element['productName'];
            product.productDescription = element['productDescription'];
            product.productPrice = element['productPrice'];
            _listProducts.add(product);
            notifyListeners();
          }
        }
        debugPrint('Products Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebProductsProvider: $e');
    }
  }

  List<Product> get listProducts => _listProducts;

  void addProduct(List<Product> list) {
    // _listProducts ??= [];
    debugPrint('Above');
    // debugPrint('${_listProducts.isEmpty}');
    // if (_listProducts.isEmpty) {
    //   _listProducts = []; // Initialize _listProducts if it's null
    // }
    // debugPrint('Middle');
    // _listProducts.add(product);
    // debugPrint('Below');
    // debugPrint('${_listProducts.length}');
    _listProducts = list;
    notifyListeners();
  }

  void removeAt(int index) {
    if(index < _listProducts.length){
      _listProducts.removeAt(index);
      notifyListeners();
    }
  }
}