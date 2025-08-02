import 'package:riverpod/riverpod.dart';

class SearchHintNotifier extends StateNotifier<int> {
  List<String> hints = ["Apartment with Mountain View in Dibba"];

  SearchHintNotifier() : super(0) {
    _fetchHints();
    _startHintRotation();
  }

  Future<void> _fetchHints() async {
    try {
      hints = [
        "Luxury Apartment in Downtown Dubai",
        "Townhouse in Dubai Hills",
        "Studio in Business Bay",
        "Penthouse in Palm Jumeirah",
        "Affordable 1 BHK in International City",
        "2 BHK in Al Reem Island",
        "Villa in Khalifa City",
        "Sea view Apartment in Corniche Road",
        "Apartment near Al Majaz Waterfront",
        "Villa for Sale in Muwailih",
        "1 BHK Flat in Ajman Downtown",
        "Sea facing Apartment in Corniche Ajman",
        "Studio in Al Hamra Village",
        "Beach Villa in Mina Al Arab",
        "Residential Plot in Fujairah City",
        "Apartment with Mountain View in Dibba",
        "Affordable Studio in UAQ Marina",
      ];

      state = 0;
    } catch (e) {
      print('Error fetching hints: $e');
    }
  }

  void _startHintRotation() {
    Future.delayed(const Duration(seconds: 3), () {
      nextHint();
      _startHintRotation();
    });
  }

  void nextHint() {
    if (hints.isNotEmpty) {
      state = (state + 1) % hints.length;
    }
  }
}

final searchHintProvider = StateNotifierProvider<SearchHintNotifier, int>((
  ref,
) {
  return SearchHintNotifier();
});
