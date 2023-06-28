// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
var cheesemomo = 0;
var cheesecornmomo = 0;
var cheesemaggi = 0;
var kathiroll = 0;
int paneerbuttermasala = 0;
// ignore: non_constant_identifier_names
int muttermushroom = 0;
int shahipaneer = 0;
int kajucurry = 0;
int chickenbiryani = 0;
int chickencurry = 0;
var sum = 0;
// ignore: non_constant_identifier_names
var no_of_selections = 0;

// ignore: non_constant_identifier_names
List<int> Items = [
  cheesemomo,
  cheesecornmomo,
  cheesemaggi,
  kathiroll,
  paneerbuttermasala,
  muttermushroom,
  shahipaneer,
  kajucurry,
  chickenbiryani,
  chickencurry,
];

// ignore: non_constant_identifier_names
var Names = [
  'Cheese MoMo',
  'Cheese Corn MoMo',
  'Cheese Maggi',
  'Kathi Roll',
  'Paneer Butter Masala',
  'Mutter Mushroom',
  'Shahi Paneer',
  'Kaju Curry',
  'Chicken Biryani',
  'Chicken Curry',
];
// ignore: non_constant_identifier_names
List<String> Item_images = [
  'assets/dispics/dishes/cheesemomo.jpg',
  'assets/dispics/dishes/cheesecornmomo.jpg',
  'assets/dispics/dishes/cheesemaggi.jpg',
  'assets/dispics/dishes/Kathiroll.jpg',
  'assets/dispics/dishes/paneer_butter_masala.png',
  'assets/dispics/dishes/Matar-mushroom.jpg',
  'assets/dispics/dishes/Shahi paneer.jpg',
  'assets/dispics/dishes/Kajucurry.jpg',
  'assets/dispics/dishes/Chickenbiryani.jpeg',
  'assets/dispics/dishes/chickencurry.jpg',
];

// ignore: non_constant_identifier_names
var Img = [];

// ignore: non_constant_identifier_names
var Fin_price = [];
// ignore: non_constant_identifier_names
var Price = [70, 80, 50, 60, 90, 100, 100, 120, 120, 120];

// ignore: non_constant_identifier_names
var Name = [];

// ignore: non_constant_identifier_names
void Summer() {
  for (var i = 0; i < 12; i++) {
    if (Items[i] > 0) {
      for (var j = 0; j < 100; j++) {
        if (Name[j] != Names[i] &&
            Img[j] != Item_images[i] &&
            Fin_price[j] != Price[i]) {
          Name.add(Names[i]);
          Img.add(Item_images[i]);
          Fin_price.add(Price[i]);
        }
      }
      // ignore: avoid_print
      no_of_selections++;
    } else {
      no_of_selections = 0;
    }
  }
}
