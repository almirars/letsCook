class CarouselModel{
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "image/slider/chicken.png"},
  {"image": "image/slider/lumpia.jpg"},
  {"image": "image/slider/sandwich.jpg"},
];