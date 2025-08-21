
class ProducatModel{
  final int id ;
  final String name;
  final String image;
  final double price;
  final String description;
  late final int? quantity;

  ProducatModel({required this.id ,this.quantity=1,required this.name, required this.image, required this.price, required this.description});
}