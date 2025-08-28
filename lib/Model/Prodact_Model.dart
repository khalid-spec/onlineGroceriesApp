class ProducatModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  late final int? quantity;
  final List<String> category;

  ProducatModel(
      {required this.id,
      required this.category,
      this.quantity = 1,
      required this.name,
      required this.image,
      required this.price,
      required this.description});


      factory ProducatModel.fromJson(Map<String,dynamic>json){
        return ProducatModel(id: json['id'],
         category:List.from( json['category']),
          name: json['name'],
           image: json['image'],
            price: (json['price'] as num ).toDouble(),
             description: json['description']);
      }
}
