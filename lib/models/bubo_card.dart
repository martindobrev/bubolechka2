///
/// Data structure for cards
///
/// Each card must have the following fields:
/// - id: unique integer for identification
/// - categoryId: id of the category the card belongs to
/// - backgroundFile: file to be used for the card background
/// - audioFile: file to be used for the audio (only bg files are available)
///              For foreign languages we will use
/// - translatedLabels: Map consisting of labels for all available languages
///   Here is a simple examlpe:
///   {"us": "English label", "de": "German label", "bg": "име на български"}
///
///
class BuboCard {
  final int id;
  final int categoryId;
  final String backgroundFile;
  final String file;
  final String audioFile;
  final Map<String, String> translatedLabels;

  const BuboCard(this.id, this.categoryId, this.backgroundFile, this.file,
      this.audioFile, this.translatedLabels);
}
