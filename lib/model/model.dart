import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelModel {
  final String id;
  final String title;
  final String location;
  final String address;
  final String description;
  final String thumbnailPath;
  final List<String> imagePaths;
  final int totalReview;
  final double ratingScore;
  final double price;
  final LatLng coordinate;

  const HotelModel({
    required this.id,
    required this.title,
    required this.location,
    required this.address,
    required this.description,
    required this.thumbnailPath,
    required this.imagePaths,
    required this.price,
    required this.coordinate,
    this.ratingScore = 0,
    this.totalReview = 0,
  });

  static List<HotelModel> sampleHotels = const [
    HotelModel(
      id: '1',
      thumbnailPath: 'assets/images/crownplaza.jpg',  
      title: 'crown plaza',
      location: 'Bantul Regency, Yogyakarta',
      address: 'Jl. Parangtritis km 8.5, Yogyakarta 55186',
      description:
          'We are only a 10-minute drive from the Water Castle (Tamansari) and Yogyakarta Palace. An airport shuttle is provided for a surcharge (available 24 hours).',
      ratingScore: 4.25,
      coordinate: LatLng(9.9341,76.3187),
      price: 4580,
      imagePaths: [
        'assets/images/thumbnail1.png',
        'assets/images/thumbnail2.png',
        'assets/images/gallery3.png',
      ],
      totalReview: 134,
    ),
     HotelModel(
      id: '2',
      thumbnailPath: 'assets/images/holidayinn.jpeg',
      title: 'Holiday inn',
      location: 'Bantul Regency, Yogyakarta',
      address: 'Jl. Parangtritis km 8.5, Yogyakarta 55186',
      description:
          'We are only a 10-minute drive from the Water Castle (Tamansari) and Yogyakarta Palace. An airport shuttle is provided for a surcharge (available 24 hours).',
      ratingScore: 4.6,
      coordinate: LatLng(9.9902, 76.3158),
      price: 6980,
      imagePaths: [
        'assets/images/thumbnail1.png',
         'assets/images/thumbnail2.png',
        'assets/images/gallery3.png',
      ],
      totalReview: 99,
    ),
    HotelModel(
      id: '3',
      thumbnailPath: 'assets/images/marriot.jpg',
      title: 'Marriot suites',
      location: 'Bantul Regency, Yogyakarta',
      address: 'Jl. Parangtritis km 8.5, Yogyakarta 55186',
      description:
          'We are only a 10-minute drive from the Water Castle (Tamansari) and Yogyakarta Palace. An airport shuttle is provided for a surcharge (available 24 hours).',
      ratingScore: 3.6,
      coordinate: LatLng(10.0294, 76.3076),
      price: 3380,
      imagePaths: [
         'assets/images/thumbnail1.png',
      'assets/images/thumbnail2.png',
        'assets/images/gallery3.png',
      ],
      totalReview: 432,
    ),
   
    HotelModel(
      id: '4',
      thumbnailPath: 'assets/images/thumbnail2.png',
      title: 'Alana Hotel',
      location: 'Bantul Regency, Yogyakarta',
      address: 'Jl. Parangtritis km 8.5, Yogyakarta 55186',
      description:
          'We are only a 10-minute drive from the Water Castle (Tamansari) and Yogyakarta Palace. An airport shuttle is provided for a surcharge (available 24 hours).',
      ratingScore: 10,
      coordinate: LatLng(10.5235, 76.2141),
      price: 1230,
      imagePaths: [
        'assets/images/thumbnail1.png',
         'assets/images/thumbnail2.png',
        'assets/images/gallery3.png',
      ],
      totalReview: 5,
    ),
  ];
}

