class Item{
  final String title;
  final String description;
  final double price;
  final String image;
  final int itemId;

  Item({
    required this.itemId,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
  });
}