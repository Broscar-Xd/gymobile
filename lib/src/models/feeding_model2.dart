class Feeding{
  late final String id;
  late final String food;
  late final String ingredients;
  late final String preparation;
  late final String calories;

  Feeding({required this.id, required this.food, required this.ingredients, required this.preparation, required this.calories });

  Map<String, dynamic> toMap(){
    return {'id': id, 'food': food, 'ingredients': ingredients, 'preparation': preparation, 'calories': calories};
  }

}