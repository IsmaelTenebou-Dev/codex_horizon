import 'package:flutter/material.dart';
import '../../domain/entities/nft_entity.dart';
import '../../domain/entities/creator_entity.dart';
import '../../domain/entities/history_item_entity.dart';
import '../../data/models/nft_model.dart';
import '../../data/models/creator_model.dart';
import '../../data/models/history_item_model.dart';

class NFTMarketplaceViewModel extends ChangeNotifier {
  // Filter categories for the Trending NFTs section
  final List<String> filterCategories = ['Art', 'Music', 'Collectibles', 'Sports'];
  String _selectedCategory = 'Art';
  
  String get selectedCategory => _selectedCategory;
  
  void setSelectedCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }
  
  // Sample trending NFTs
  List<NFTEntity> get trendingNfts => [
    const NFTModel(
      id: '1',
      title: 'Abstract Colors',
      artist: 'Esthere Jackson',
      image: 'https://images.unsplash.com/photo-1634986666676-ec8fd927c23d?q=80&w=1935&auto=format&fit=crop',
      currentBid: 0.99,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/women/44.jpg',
        'https://randomuser.me/api/portraits/men/78.jpg'
      ],
    ),
    const NFTModel(
      id: '2',
      title: 'ETH AI Brain',
      artist: 'Neil Wilson',
      image: 'https://images.unsplash.com/photo-1621075160523-b936ad96132a?q=80&w=1470&auto=format&fit=crop',
      currentBid: 2.82,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/women/44.jpg',
        'https://randomuser.me/api/portraits/men/45.jpg',
        'https://randomuser.me/api/portraits/women/19.jpg'
      ],
    ),
    const NFTModel(
      id: '3',
      title: 'Mesh Gradients',
      artist: 'Will Smith',
      image: 'https://images.unsplash.com/photo-1618005198919-d3d4b5a92ead?q=80&w=1374&auto=format&fit=crop',
      currentBid: 0.55,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/men/78.jpg',
        'https://randomuser.me/api/portraits/women/65.jpg'
      ],
    ),
  ];
  
  // Sample recently added NFTs
  List<NFTEntity> get recentlyAddedNfts => [
    const NFTModel(
      id: '4',
      title: 'Swipe Circles',
      artist: 'Peter Will',
      image: 'https://images.unsplash.com/photo-1633537243153-9f86f5f28de9?q=80&w=1480&auto=format&fit=crop',
      currentBid: 2.30,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/men/45.jpg',
        'https://randomuser.me/api/portraits/women/76.jpg'
      ],
    ),
    const NFTModel(
      id: '5',
      title: 'Colorful Heaven',
      artist: 'Mark Jackson',
      image: 'https://images.unsplash.com/photo-1614102073832-030967418971?q=80&w=1469&auto=format&fit=crop',
      currentBid: 1.10,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/women/19.jpg'
      ],
    ),
    const NFTModel(
      id: '6',
      title: '3D Cubes Art',
      artist: 'Manny Gates',
      image: 'https://images.unsplash.com/photo-1603344204980-4edb0ea63148?q=80&w=1469&auto=format&fit=crop',
      currentBid: 6.50,
      ownerAvatars: [
        'https://randomuser.me/api/portraits/men/78.jpg',
        'https://randomuser.me/api/portraits/women/65.jpg',
        'https://randomuser.me/api/portraits/women/76.jpg'
      ],
    ),
  ];
  
  // Top creators
  List<CreatorEntity> get topCreators => [
    const CreatorModel(
      username: '@madhison_c21',
      avatar: 'https://randomuser.me/api/portraits/men/32.jpg',
      artworks: 9821,
      ranking: 1,
    ),
    const CreatorModel(
      username: '@akarl602',
      avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      artworks: 7032,
      ranking: 2,
    ),
    const CreatorModel(
      username: '@andrea.lz',
      avatar: 'https://randomuser.me/api/portraits/men/78.jpg',
      artworks: 5204,
      ranking: 3,
    ),
    const CreatorModel(
      username: '@dhruvansh47y',
      avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
      artworks: 4309,
      ranking: 4,
    ),
    const CreatorModel(
      username: '@amovieple.web',
      avatar: 'https://randomuser.me/api/portraits/women/19.jpg',
      artworks: 3871,
      ranking: 5,
    ),
    const CreatorModel(
      username: '@venus.syx',
      avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
      artworks: 3162,
      ranking: 6,
    ),
    const CreatorModel(
      username: '@ape.spsd',
      avatar: 'https://randomuser.me/api/portraits/women/76.jpg',
      artworks: 2607,
      ranking: 7,
    ),
  ];
  
  // History items
  List<HistoryItemEntity> get historyItems => [
    const HistoryItemModel(
      id: '1',
      title: 'Colorful Heaven',
      image: 'https://images.unsplash.com/photo-1614102073832-030967418971?q=80&w=300&auto=format&fit=crop',
      price: 1.30,
      timeAgo: '30s ago',
    ),
    const HistoryItemModel(
      id: '2',
      title: 'Abstract Colors',
      image: 'https://images.unsplash.com/photo-1634986666676-ec8fd927c23d?q=80&w=300&auto=format&fit=crop',
      price: 0.91,
      timeAgo: '58s ago',
    ),
    const HistoryItemModel(
      id: '3',
      title: 'ETH AI Brain',
      image: 'https://images.unsplash.com/photo-1621075160523-b936ad96132a?q=80&w=300&auto=format&fit=crop',
      price: 2.82,
      timeAgo: '1m ago',
    ),
    const HistoryItemModel(
      id: '4',
      title: 'Swipe Circles',
      image: 'https://images.unsplash.com/photo-1633537243153-9f86f5f28de9?q=80&w=300&auto=format&fit=crop',
      price: 2.30,
      timeAgo: '1m ago',
    ),
    const HistoryItemModel(
      id: '5',
      title: 'Mesh Gradients',
      image: 'https://images.unsplash.com/photo-1618005198919-d3d4b5a92ead?q=80&w=300&auto=format&fit=crop',
      price: 0.56,
      timeAgo: '2m ago',
    ),
    const HistoryItemModel(
      id: '6',
      title: '3D Cubes Art',
      image: 'https://images.unsplash.com/photo-1603344204980-4edb0ea63148?q=80&w=300&auto=format&fit=crop',
      price: 6.58,
      timeAgo: '3m ago',
    ),
  ];
}
