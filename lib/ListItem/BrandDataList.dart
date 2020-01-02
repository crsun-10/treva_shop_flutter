class Brand {
  final String id;
  final String name;
  final String img;
  final String desc;
  final items item;

  const Brand({
    this.img,
    this.id,
    this.name,
    this.desc,
    this.item,
  });
}

class items {
  final String itemName;
  final String itemPrice;
  final String itemRatting;
  final String itemSale;
  final String itemId;
  final String itemImg;

  const items(
      {this.itemName,
        this.itemPrice,
        this.itemRatting,
        this.itemSale,
        this.itemId,
        this.itemImg});
}

List<Brand> brandData = [
  const Brand(
      name: "Nike Sport",
      id: "1",
      img: "assets/imgBrand/nikeHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/brandNike.jpg",
          itemId: "1",
          itemName: "Nike Sport Shoes Running Man Blue Black",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Apple Tech",
      id: "2",
      img: "assets/imgBrand/appleHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgBrand/brandApple.jpg",
          itemId: "1",
          itemName: "Mackbook Pro SSD 500 GB",
          itemPrice: "\$ 1500",
          itemRatting: "4.5",
          itemSale: "250 Sale")),
  const Brand(
      name: "Fendi Fashion",
      id: "3",
      img: "assets/imgBrand/fendiHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgItem/fashion1.jpg",
          itemId: "1",
          itemName: "Fendi Fashion",
          itemPrice: "\$ 250",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Gucci Fashion",
      id: "4",
      img: "assets/imgBrand/gucciHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgItem/flashsale2.jpg",
          itemId: "1",
          itemName: "Dress Swite For Girl Brown",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Samsung Tech",
      id: "5",
      img: "assets/imgBrand/samsungHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgPromo/imgPromo2.jpg",
          itemId: "1",
          itemName: "Samsung Galaxy S8+ 256 GB",
          itemPrice: "\$ 800",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Sony Tech",
      id: "6",
      img: "assets/imgBrand/sonyHeader.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/imgPromo/imgPromo8.jpg",
          itemId: "1",
          itemName: "SmartWarch Sonny",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
];
