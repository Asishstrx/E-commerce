class Item {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageurl;
  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageurl});
}

List<Item> items = [
  Item(
      id: '1',
      name: 'Nike Free Metacon 6',
      description:
          "The Free Metcon 6 opens your world of workout possibilities. We added even more forefoot flexibility to our most adaptable trainer and reinforced the heel with extra foam. That means more freedom for dynamic movements during plyos and cardio classes, plus the stable base you need for weights.",
      price: 10795,
      imageurl: 'lib/images/W+NIKE+FREE+METCON+6.png'),
  Item(
      id: '2',
      name: 'Adidas Originals Forum',
      description:
          "Express your personal style in these adidas Forum Bold Shoes. The trainers stay true to their '80s basketball roots while adding details like a platform outsole. Amp up the sophistication with premium leather and a subtle snakeskin deboss on the famous X-ankle detail. The terry lining and platform outsole add extra comfort.",
      price: 10999.00,
      imageurl: 'lib/images/shopping (1).webp'),
  Item(
      id: '3',
      name: 'PUMA Mens Speedcat ',
      description:
          "Step into a realm where style seamlessly merges with functionality. These trainers are a testament to PUMA's legacy of innovation and design excellence. Inspired by the sleek aesthetics of the racing circuit, these trainers boast sharp lines and a streamlined silhouette, making them an essential addition to any wardrobe. Crafted with a high-quality leather upper, they exude luxury while ensuring durability and comfort.",
      price: 9999,
      imageurl: 'lib/images/shopping (2).webp'),
  Item(
      id: '4',
      name: 'New Balance 530',
      description:
          "Men ́s shoes Sneakers New Balance 530 Trainers Grey EU 40 Man. Type of Sneakers : Running Style,Cut Dressinn : Low Cut New Balance 530 Trainers are prepared to accompany you in your daily or sporty activities and provide you all the comfort, cushioning, freshness, and protection with a style inspired by the 90s’ and the beginning of the millennium, when the drop was very thick.",
      price: 10899,
      imageurl: 'lib/images/ws327kg_nb_05_i.webp'),
];
