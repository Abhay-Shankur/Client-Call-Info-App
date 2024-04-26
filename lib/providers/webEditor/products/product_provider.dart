import 'package:call_info/firebaseHandlers/firebase_auth.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String? _imagePath;
  String? _productName;
  String? _productPrice;
  String? _productDescription;

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

}

class ProductsProvider extends ChangeNotifier {
  List<Product> _listProducts = [];

  ProductsProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      String? uid = await FirebaseAuthHandler.getUid();
      if(uid != null) {
        FirestoreHandler firestore = FirestoreHandler();
        String domainName = await firestore.readFieldAtPath("USERS", uid, 'webDomain');
        List<dynamic> dynlist = await firestore.readFieldAtPath("Website", domainName, 'ProductsList') as List<dynamic>;
        // _ownerName = data['ownerName'];
        // _ownerContact = data['ownerContact'];
        // _businessName = data['businessName'];
        // _businessContact = data['businessContact'];
        // _businessMail = data['businessMail'];
        // _businessAddress = data['businessAddress'];
        if(_listProducts == null ){
          _listProducts = [];
        }
        _listProducts.clear();
        dynlist.forEach((element) {
          if (element is Map<String, dynamic>) {
            Product product = new Product();
            product.imagePath = element['imagePath'];
            product.productName = element['productName'];
            product.productDescription = element['productDescription'];
            product.productPrice = element['productPrice'];
            _listProducts.add(product);
            notifyListeners();
          }
        });
        debugPrint('Products Data Initialized.');
        firestore.closeConnection();
        notifyListeners();
      } else {
        throw Exception('User not Authenticated');
      }
    } catch (e) {
      debugPrint('Failed to Initialize WebDomainProvider: $e');
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
}