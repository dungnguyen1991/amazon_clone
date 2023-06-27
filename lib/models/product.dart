import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final int quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    // print(map['quantity'].runtimeType);
    // print(map['quantity'].toInt());
    //print(List<String>.from(map['images']));

    // var test = Product(
    //   name: map['name'] as String,
    //   description: map['description'] as String,
    //   quantity: map['quantity'] as int,
    //   images: [
    //     "https://res.cloudinary.com/df964dkw4/image/upload/v1687750156/Iphone%20dai%20de/ptbjej8a2q76tqvy0yfy.jpg,"
    //   ],
    //   category: map['category'] as String,
    //   price: map['price'].toDouble(),
    //   id: map['_id'] != null ? map['_id'] as String : null,
    // );
    // print(test);
    // return Product(
    //   name: map['name'] as String,
    //   description: map['description'] as String,
    //   quantity: map['quantity'] as int,
    //   images: List<String>.from((map['images'] as List<String>)),
    //   category: map['category'] as String,
    //   price: map['price'].toDouble(),
    //   id: map['_id'] != null ? map['_id'] as String : null,
    // );

    // return Product(
    //   name: map['name'] as String,
    //   description: map['description'] as String,
    //   quantity: map['quantity'] as int,
    //   // images: [
    //   //   "https://res.cloudinary.com/df964dkw4/image/upload/v1685588930/Iphone%20dai%20de/pline5loxvpdha4sjku2.jpg",
    //   //   "https://res.cloudinary.com/df964dkw4/image/upload/v1685588931/Iphone%20dai%20de/t1cngogj8dpwpkl9qr4f.jpg"
    //   // ],
    //   // images: List<String>.from((map['images'] as List<String>)),
    //   // images: map['images'].map((e) => e.toString()).toList(),
    //   images: List<String>.from(map['images']),
    //   category: map['category'] ?? '',
    //   //price: map['price'].toDouble(),
    //   price: map['price']?.toDouble() ?? 0.0,
    //   id: map['_id'],
    // );
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
