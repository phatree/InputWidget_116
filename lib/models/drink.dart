class  Drink {
  String? thName;
  // String? enName;
  int? price;
  bool? checked;

  //Constructor
  Drink(this.thName,this.price, this.checked);

  static getDrink() {
    return [
     Drink('กาแฟ', 259, true),
      Drink('ชานมไข่มุก', 25, false),
      Drink('มะม่วงปั่นโยเกิร์ต',  59, true),
      Drink('น้ำเปล่า',  20, false),
    ];
  }
}