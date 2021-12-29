class Food {
  String? thName;
  String? enName;
  int? price;
  String? foodValue;

  //Constructor
  Food(this.thName, this.enName, this.price, this.foodValue );

  static getFood() {
    return [
      Food('พิซซ่า', 'Pizza', 99, 'piaaz'),
      Food('สเต็ก', 'Steak', 129, 'steak'),
      Food('ชาบู', 'Shabu', 399, 'shabu'),
      Food('ซูซิ', 'Sushi', 29, 'sushi'),
      Food('กิมจิ', 'Kimji', 59, 'kimji'),

    ];
  }
}