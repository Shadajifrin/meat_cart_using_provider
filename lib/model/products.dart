class Product {
  String name;
  String price;
  String color;
  String description;
  int count;
  String image;

  Product(this.name, this.price, this.color, this.description, this.count,
      this.image);
}

List<Product> productlist = [
  Product(
    "item1",
    "100\$",
    "Meat1",
    "Meats come in various types, including beef, pork, poultry (chicken, turkey, duck), lamb, veal, and game meats (such as venison, elk, and boar), each with its unique taste and texture.",
    0,
    "assets/images/meat1.jpeg",
  ),
  Product(
    "item2",
    "200\$",
    "Meat2",
    "Meats are high in protein, which is essential for muscle repair, growth, and overall body function. They also contain essential vitamins and minerals like iron, zinc, and B vitamins.",
    0,
    "assets/images/meat2.jpeg",
  ),
  Product(
    "item3",
    "300\$",
    "Meat3",
    " Different cultures have distinct preferences and traditions regarding meat consumption. For example, beef is a staple in American cuisine, while pork is prevalent in many European and Asian dishes.",
    0,
    "assets/images/meat3.jpeg",
  ),
  Product(
    "item4",
    "400\$",
    "Meat4",
    "Meats can be prepared in various ways, including grilling, roasting, frying, stewing, and smoking, each method imparting different flavors and textures to the meat.",
    0,
    "assets/images/meat4.jpeg",
  ),
  Product(
    "item5",
    "500\$",
    "Meat5",
    "While meats are nutritious, the type and quantity consumed can impact health. Lean cuts of meat are generally healthier than fatty cuts, and moderation is key to a balanced diet.",
    0,
    "assets/images/meat5.jpeg",
  ),
  Product(
    "item6",
    "600\$",
    "Meat6",
    "While meats are nutritious, the type and quantity consumed can impact health. Lean cuts of meat are generally healthier than fatty cuts, and moderation is key to a balanced diet.",
    0,
    "assets/images/meat2.jpeg",
  ),
  Product(
    "item7",
    "700\$",
    "Meat7",
    " Different cuts of meat have varying levels of tenderness and flavor. Grading systems, such as USDA beef grades, help consumers identify the quality and characteristics of meat products.",
    0,
    "assets/images/meat1.jpeg",
  ),
  Product(
    "item8",
    "800\$",
    "Meat8",
    " Different cuts of meat have varying levels of tenderness and flavor. Grading systems, such as USDA beef grades, help consumers identify the quality and characteristics of meat products.",
    0,
    "assets/images/meat3.jpeg",
  ),
];
