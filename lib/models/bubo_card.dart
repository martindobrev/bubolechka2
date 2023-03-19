class BuboCard {
  final int id;
  final String enName;
  final String deName;
  final String esName;

  BuboCard(this.id, this.enName, [this.deName = '', this.esName = '']);

  BuboCard.named(
      {required this.id,
      required this.enName,
      this.deName = '',
      this.esName = ''});
}
