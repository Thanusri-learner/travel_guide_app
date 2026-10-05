import 'package:flutter/material.dart';

void main() {
  runApp(const TravelGuideApp());
}

// ============================================================
// APP
// ============================================================

class TravelGuideApp extends StatelessWidget {
  const TravelGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Guide',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.travel_explore,
                  size: 55,
                  color: Color(0xFF1565C0),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Travel Guide',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Explore. Discover. Experience.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ExplorePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DESTINATION DATA
// ============================================================

final List<Map<String, dynamic>> destinations = [
  {
    'name': 'Goa',
    'category': 'Beaches',
    'location': 'Goa, India',
    'bestFor': 'Friends & Relaxation',
    'image':
        'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=900&q=80',
    'description': 'Beaches • Relaxation • Fun',
    'about':
        'Goa is famous for its beautiful beaches, lively atmosphere, Portuguese heritage and unforgettable sunsets. It is a popular destination for relaxation, adventure and exploring coastal culture.',
    'highlights': [
      'Baga Beach',
      'Calangute Beach',
      'Fort Aguada',
      'Basilica of Bom Jesus',
    ],
    'food':
        'Goan fish curry, seafood, pork vindaloo and bebinca are popular local choices.',
    'bestTime':
        'November to February is ideal for pleasant weather and beach activities.',
    'budget':
        'Approx. ₹2,500–₹5,000 per day depending on stay and activities.',
    'tips':
        'Carry sunscreen, stay hydrated and explore both beaches and heritage locations.',
  },
  {
    'name': 'Visakhapatnam',
    'category': 'Beaches',
    'location': 'Andhra Pradesh, India',
    'bestFor': 'Family & Relaxation',
    'image':
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
    'description': 'Beach • Coast • City',
    'about':
        'Visakhapatnam is a beautiful coastal city known for scenic beaches, green hills and wonderful views of the Bay of Bengal. It combines natural beauty with a lively city atmosphere.',
    'highlights': [
      'RK Beach',
      'Kailasagiri',
      'Yarada Beach',
      'Submarine Museum',
    ],
    'food':
        'Try Andhra-style seafood, spicy meals, local snacks and traditional sweets.',
    'bestTime':
        'October to March is comfortable for sightseeing and beach visits.',
    'budget':
        'Approx. ₹2,000–₹4,000 per day depending on accommodation and travel.',
    'tips':
        'Visit beaches during early morning or evening and carry sun protection.',
  },
  {
    'name': 'Ooty',
    'category': 'Mountains & Hills',
    'location': 'Tamil Nadu, India',
    'bestFor': 'Nature & Couples',
    'image':
        'https://images.unsplash.com/photo-1593693411515-c20261bcad6e?auto=format&fit=crop&w=900&q=80',
    'description': 'Hills • Nature • Peace',
    'about':
        'Ooty is a peaceful hill station surrounded by green mountains, tea gardens and pleasant weather. It is known for its scenic landscapes and relaxing atmosphere.',
    'highlights': [
      'Ooty Lake',
      'Botanical Garden',
      'Doddabetta Peak',
      'Tea Gardens',
    ],
    'food':
        'Enjoy homemade chocolates, fresh tea, bakery items and South Indian dishes.',
    'bestTime':
        'October to June is generally suitable for enjoying Ooty and its surroundings.',
    'budget':
        'Approx. ₹2,000–₹4,500 per day depending on accommodation and activities.',
    'tips':
        'Carry warm clothes and comfortable footwear for sightseeing in hilly areas.',
  },
  {
    'name': 'Munnar',
    'category': 'Mountains & Hills',
    'location': 'Kerala, India',
    'bestFor': 'Nature & Adventure',
    'image':
        'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=900&q=80',
    'description': 'Tea Gardens • Hills • Nature',
    'about':
        'Munnar is a spectacular hill destination famous for tea plantations, misty mountains, waterfalls and peaceful valleys. It is perfect for nature lovers and adventure seekers.',
    'highlights': [
      'Tea Plantations',
      'Eravikulam National Park',
      'Mattupetty Dam',
      'Top Station',
    ],
    'food':
        'Try Kerala-style meals, appam, stew, puttu and local tea from the plantations.',
    'bestTime':
        'September to May is a good period for sightseeing and outdoor activities.',
    'budget':
        'Approx. ₹2,500–₹5,000 per day depending on accommodation and tours.',
    'tips':
        'Carry a light jacket, comfortable shoes and keep your travel plan flexible for weather.',
  },
  {
    'name': 'Jaipur',
    'category': 'Heritage & Culture',
    'location': 'Rajasthan, India',
    'bestFor': 'History & Culture',
    'image':
        'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=900&q=80',
    'description': 'History • Culture • Heritage',
    'about':
        'Jaipur, the Pink City, is known for magnificent forts, royal palaces, colourful markets and traditional Rajasthani culture. It is an excellent destination for history and architecture lovers.',
    'highlights': [
      'Amber Fort',
      'Hawa Mahal',
      'City Palace',
      'Jantar Mantar',
    ],
    'food':
        'Popular choices include dal baati churma, ghewar, kachori and traditional Rajasthani thali.',
    'bestTime':
        'October to March offers comfortable weather for exploring forts and markets.',
    'budget':
        'Approx. ₹2,500–₹5,000 per day depending on hotel and sightseeing.',
    'tips':
        'Start sightseeing early, carry water and keep time for local markets and handicrafts.',
  },
  {
    'name': 'Agra',
    'category': 'Heritage & Culture',
    'location': 'Uttar Pradesh, India',
    'bestFor': 'History & Architecture',
    'image':
        'https://images.unsplash.com/photo-1564507592333-c60657eea523?auto=format&fit=crop&w=900&q=80',
    'description': 'Monuments • History • Architecture',
    'about':
        'Agra is one of India’s most famous heritage destinations and is home to the iconic Taj Mahal. The city offers magnificent Mughal architecture and important historical sites.',
    'highlights': [
      'Taj Mahal',
      'Agra Fort',
      'Mehtab Bagh',
      'Fatehpur Sikri',
    ],
    'food':
        'Try petha, Mughlai cuisine, Agra-style paratha and local street food.',
    'bestTime':
        'October to March is comfortable for visiting the major historical attractions.',
    'budget':
        'Approx. ₹2,000–₹4,500 per day depending on accommodation and sightseeing.',
    'tips':
        'Visit the Taj Mahal early to avoid crowds and check monument timings before visiting.',
  },
  {
    'name': 'Hyderabad',
    'category': 'Food & Cuisine',
    'location': 'Telangana, India',
    'bestFor': 'Food & History',
    'image':
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=900&q=80',
    'description': 'Biryani • Culture • History',
    'about':
        'Hyderabad is famous for its rich food culture, especially Hyderabadi biryani, along with historic monuments, traditional markets and a modern city lifestyle.',
    'highlights': [
      'Hyderabadi Biryani',
      'Charminar',
      'Laad Bazaar',
      'Haleem',
    ],
    'food':
        'Must-try dishes include Hyderabadi biryani, haleem, kebabs, double ka meetha and Irani chai.',
    'bestTime':
        'October to February is generally more comfortable for city sightseeing.',
    'budget':
        'Approx. ₹2,000–₹4,500 per day depending on food, stay and activities.',
    'tips':
        'Explore the Old City early or in the evening and leave time to enjoy the local food.',
  },
  {
    'name': 'Amritsar',
    'category': 'Food & Cuisine',
    'location': 'Punjab, India',
    'bestFor': 'Food & Culture',
    'image':
        'https://images.unsplash.com/photo-1590077428593-a55bb07c4665?auto=format&fit=crop&w=900&q=80',
    'description': 'Punjabi Food • Culture • Heritage',
    'about':
        'Amritsar offers a memorable combination of Punjabi cuisine, cultural experiences and important heritage sites. The city is especially known for the Golden Temple and its welcoming atmosphere.',
    'highlights': [
      'Golden Temple',
      'Amritsari Kulcha',
      'Jallianwala Bagh',
      'Wagah Border',
    ],
    'food':
        'Try Amritsari kulcha, chole, lassi, tandoori dishes and traditional Punjabi meals.',
    'bestTime':
        'October to March is comfortable for sightseeing and outdoor activities.',
    'budget':
        'Approx. ₹2,000–₹4,000 per day depending on stay and food choices.',
    'tips':
        'Dress respectfully when visiting religious places and follow local visitor guidelines.',
  },
  {
    'name': 'Wayanad',
    'category': 'Nature & Wildlife',
    'location': 'Kerala, India',
    'bestFor': 'Nature & Wildlife',
    'image':
        'https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=900&q=80',
    'description': 'Forests • Waterfalls • Wildlife',
    'about':
        'Wayanad is a green paradise filled with forests, waterfalls, wildlife and peaceful natural landscapes. It is a great choice for travellers who enjoy nature and outdoor experiences.',
    'highlights': [
      'Edakkal Caves',
      'Soochipara Falls',
      'Banasura Sagar Dam',
      'Wayanad Wildlife Sanctuary',
    ],
    'food':
        'Enjoy Kerala meals, appam, puttu, local snacks and traditional Malabar dishes.',
    'bestTime':
        'October to May is generally suitable for sightseeing and outdoor activities.',
    'budget':
        'Approx. ₹2,000–₹4,500 per day depending on stay and activities.',
    'tips':
        'Wear comfortable shoes and follow safety instructions while visiting forests and waterfalls.',
  },
  {
    'name': 'Coorg',
    'category': 'Nature & Wildlife',
    'location': 'Karnataka, India',
    'bestFor': 'Nature & Relaxation',
    'image':
        'https://images.unsplash.com/photo-1596178065887-1198b6148b2b?auto=format&fit=crop&w=900&q=80',
    'description': 'Coffee • Forests • Waterfalls',
    'about':
        'Coorg is known for coffee plantations, green forests, waterfalls and peaceful mountain scenery. Its cool climate and natural beauty make it a popular getaway.',
    'highlights': [
      'Abbey Falls',
      'Raja Seat',
      'Coffee Plantations',
      'Dubare Elephant Camp',
    ],
    'food':
        'Try traditional Kodava cuisine, pandi curry, local coffee and regional snacks.',
    'bestTime':
        'October to March is a pleasant period for exploring Coorg.',
    'budget':
        'Approx. ₹2,000–₹4,500 per day depending on accommodation and activities.',
    'tips':
        'Carry comfortable footwear and a light jacket, especially for outdoor sightseeing.',
  },
  {
    'name': 'Mumbai',
    'category': 'City & Lifestyle',
    'location': 'Maharashtra, India',
    'bestFor': 'City Life & Entertainment',
    'image':
        'https://images.unsplash.com/photo-1529253355930-ddbe423a2ac7?auto=format&fit=crop&w=900&q=80',
    'description': 'City • Entertainment • Lifestyle',
    'about':
        'Mumbai is a vibrant metropolitan city famous for Bollywood, food, shopping, entertainment and iconic landmarks. It combines a fast-paced modern lifestyle with historic locations.',
    'highlights': [
      'Gateway of India',
      'Marine Drive',
      'Colaba',
      'Juhu Beach',
    ],
    'food':
        'Try vada pav, pav bhaji, bhel puri, misal pav and Mumbai-style street food.',
    'bestTime':
        'October to February is comfortable for exploring the city and its attractions.',
    'budget':
        'Approx. ₹3,000–₹6,000 per day depending on accommodation and activities.',
    'tips':
        'Use public transport when convenient and plan sightseeing according to traffic conditions.',
  },
  {
    'name': 'Bengaluru',
    'category': 'City & Lifestyle',
    'location': 'Karnataka, India',
    'bestFor': 'Technology & Lifestyle',
    'image':
        'https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=900&q=80',
    'description': 'Technology • Parks • City Life',
    'about':
        'Bengaluru combines technology, modern lifestyle, green spaces, cafes and a vibrant urban culture. It is known as a major technology and startup hub in India.',
    'highlights': [
      'Bangalore Palace',
      'Cubbon Park',
      'Lalbagh',
      'Vidhana Soudha',
    ],
    'food':
        'Try masala dosa, idli-vada, filter coffee, Bengaluru-style meals and local snacks.',
    'bestTime':
        'October to February is generally pleasant for exploring the city.',
    'budget':
        'Approx. ₹2,500–₹5,000 per day depending on stay, food and activities.',
    'tips':
        'Plan travel around traffic, use metro services where convenient and keep comfortable footwear.',
  },
];

// ============================================================
// CATEGORY DATA
// ============================================================

final List<Map<String, dynamic>> categories = [
  {
    'name': 'Beaches',
    'description': 'Sea, sand & relaxation',
    'icon': Icons.beach_access,
    'image':
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
  },
  {
    'name': 'Mountains & Hills',
    'description': 'Peace & scenic views',
    'icon': Icons.terrain,
    'image':
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=900&q=80',
  },
  {
    'name': 'Heritage & Culture',
    'description': 'History & architecture',
    'icon': Icons.account_balance,
    'image':
        'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=900&q=80',
  },
  {
    'name': 'Food & Cuisine',
    'description': 'Taste local flavours',
    'icon': Icons.restaurant,
    'image':
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=80',
  },
  {
    'name': 'Nature & Wildlife',
    'description': 'Green & adventurous',
    'icon': Icons.forest,
    'image':
        'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=900&q=80',
  },
  {
    'name': 'City & Lifestyle',
    'description': 'Modern city experiences',
    'icon': Icons.location_city,
    'image':
        'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?auto=format&fit=crop&w=900&q=80',
  },
];

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'All';

  List<Map<String, dynamic>> get filteredDestinations {
    List<Map<String, dynamic>> result = destinations;

    if (selectedCategory != 'All') {
      result = result
          .where(
            (destination) =>
                destination['category'] == selectedCategory,
          )
          .toList();
    }

    final searchText =
        searchController.text.trim().toLowerCase();

    if (searchText.isNotEmpty) {
      result = result
          .where(
            (destination) =>
                destination['name']
                    .toString()
                    .toLowerCase()
                    .contains(searchText) ||
                destination['category']
                    .toString()
                    .toLowerCase()
                    .contains(searchText) ||
                destination['location']
                    .toString()
                    .toLowerCase()
                    .contains(searchText),
          )
          .toList();
    }

    return result;
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredDestinations;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.travel_explore,
              color: Color(0xFF1565C0),
            ),
            SizedBox(width: 8),
            Text(
              'Travel Guide',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Where do you want to go?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Discover places based on your travel interests.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search destination or category...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 22),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1565C0),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.explore,
                    color: Colors.white,
                    size: 34,
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Explore the World',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Choose a category and discover places made for you.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore by Interest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (selectedCategory != 'All')
                  TextButton(
                    onPressed: () {
                      selectCategory('All');
                    },
                    child: const Text('Clear'),
                  ),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 205,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return premiumCategoryCard(
                    categories[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedCategory == 'All'
                        ? 'Popular Destinations'
                        : selectedCategory,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${results.length} places',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            if (results.isEmpty)
              noResultsWidget()
            else
              ...results.map(
                (destination) =>
                    destinationCard(destination),
              ),
          ],
        ),
      ),
    );
  }

  Widget premiumCategoryCard(
      Map<String, dynamic> category) {
    final bool isSelected =
        selectedCategory == category['name'];

    return GestureDetector(
      onTap: () {
        selectCategory(category['name']);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 250,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF1565C0),
                  width: 3,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                category['image'],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE3F2FD),
                    child: Icon(
                      category['icon'],
                      size: 55,
                      color: const Color(0xFF1565C0),
                    ),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    category['icon'],
                    color: const Color(0xFF1565C0),
                    size: 20,
                  ),
                ),
              ),

              Positioned(
                right: 14,
                top: 14,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSelected
                        ? Icons.check
                        : Icons.arrow_forward,
                    color: const Color(0xFF1565C0),
                    size: 19,
                  ),
                ),
              ),

              Positioned(
                left: 17,
                right: 17,
                bottom: 17,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category['description'],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isSelected
                          ? 'Selected'
                          : 'Tap to explore',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget destinationCard(
      Map<String, dynamic> destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DestinationPage(
              destination: destination,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                destination['image'],
                height: 88,
                width: 110,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    height: 88,
                    width: 110,
                    color: const Color(0xFFE3F2FD),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          destination['location'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                          overflow:
                              TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    destination['description'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 14,
                        color: Color(0xFF1565C0),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          destination['bestFor'],
                          style: const TextStyle(
                            color: Color(0xFF1565C0),
                            fontSize: 11,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget noResultsWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.travel_explore,
            size: 48,
            color: Colors.grey,
          ),
          SizedBox(height: 12),
          Text(
            'No destinations found',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Try another category or search.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXPLORE PAGE
// ============================================================

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Discover India',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Find destinations based on what you love.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          ...categories.map(
            (category) => exploreCategoryCard(
              context,
              category,
            ),
          ),
        ],
      ),
    );
  }

  Widget exploreCategoryCard(
    BuildContext context,
    Map<String, dynamic> category,
  ) {
    final matchingPlaces = destinations
        .where(
          (destination) =>
              destination['category'] ==
              category['name'],
        )
        .length;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryPage(
              categoryName: category['name'],
            ),
          ),
        );
      },
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                category['image'],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE3F2FD),
                    child: Icon(
                      category['icon'],
                      color: const Color(0xFF1565C0),
                      size: 45,
                    ),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Icon(
                      category['icon'],
                      color: Colors.white,
                      size: 32,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            category['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$matchingPlaces destinations',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CATEGORY PAGE
// ============================================================

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final places = destinations
        .where(
          (destination) =>
              destination['category'] ==
              categoryName,
        )
        .toList();

    final category = categories.firstWhere(
      (item) => item['name'] == categoryName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    category['image'],
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE3F2FD),
                        child: Icon(
                          category['icon'],
                          size: 60,
                          color: const Color(0xFF1565C0),
                        ),
                      );
                    },
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${places.length} destinations to explore',
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          ...places.map(
            (destination) => destinationListTile(
              context,
              destination,
            ),
          ),
        ],
      ),
    );
  }

  Widget destinationListTile(
    BuildContext context,
    Map<String, dynamic> destination,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DestinationPage(
              destination: destination,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                destination['image'],
                height: 85,
                width: 105,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    height: 85,
                    width: 105,
                    color: const Color(0xFFE3F2FD),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    destination['location'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    destination['bestFor'],
                    style: const TextStyle(
                      color: Color(0xFF1565C0),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FAVORITES PAGE
// ============================================================

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 48,
                  color: Colors.red.shade400,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'No Favorites Yet',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Save your favourite destinations here and access them quickly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE PAGE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              height: 95,
              width: 95,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 55,
                color: Color(0xFF1565C0),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Travel Explorer',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Discovering new places',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            profileOption(
              Icons.person_outline,
              'Edit Profile',
            ),

            profileOption(
              Icons.bookmark_border,
              'Saved Places',
            ),

            profileOption(
              Icons.settings_outlined,
              'Settings',
            ),

            profileOption(
              Icons.help_outline,
              'Help & Support',
            ),

            profileOption(
              Icons.logout,
              'Logout',
            ),
          ],
        ),
      ),
    );
  }

  Widget profileOption(
    IconData icon,
    String title,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF1565C0),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ============================================================
// DESTINATION DETAILS PAGE — 2C
// ============================================================

class DestinationPage extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DestinationPage({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final List highlights =
        destination['highlights'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF1565C0),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                destination['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    destination['image'],
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE3F2FD),
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 70,
                          color: Color(0xFF1565C0),
                        ),
                      );
                    },
                  ),

                  Container(
                    decoration:
                        const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  // CATEGORY
                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Text(
                      destination['category'],
                      style: const TextStyle(
                        color: Color(0xFF1565C0),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // LOCATION
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF1565C0),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          destination['location'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // BEST FOR
                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline,
                        color: Color(0xFF1565C0),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Best for: ${destination['bestFor']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ABOUT
                  sectionTitle('About the Destination'),

                  const SizedBox(height: 10),

                  Text(
                    destination['about'],
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // HIGHLIGHTS
                  sectionTitle('Top Highlights'),

                  const SizedBox(height: 14),

                  ...highlights.map(
                    (highlight) => Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.04),
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF1565C0),
                            size: 21,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              highlight,
                              style:
                                  const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FOOD
                  infoCard(
                    icon: Icons.restaurant,
                    title: 'Must-Try Food',
                    text: destination['food'],
                  ),

                  const SizedBox(height: 14),

                  // BEST TIME
                  infoCard(
                    icon: Icons.calendar_month,
                    title: 'Best Time to Visit',
                    text: destination['bestTime'],
                  ),

                  const SizedBox(height: 14),

                  // BUDGET
                  infoCard(
                    icon: Icons.currency_rupee,
                    title: 'Approximate Budget',
                    text: destination['budget'],
                  ),

                  const SizedBox(height: 14),

                  // TIPS
                  infoCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Travel Tips',
                    text: destination['tips'],
                  ),

                  const SizedBox(height: 25),

                  // MAP BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.map_outlined,
                      ),
                      label: const Text(
                        'Explore on Map',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF1565C0),
                        foregroundColor:
                            Colors.white,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget infoCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F2FD),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Color(0xFF1565C0),
              size: 21,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FORGOT PASSWORD PAGE
// ============================================================

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  final TextEditingController emailController =
      TextEditingController();

  void resetPassword() {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link sent!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Reset your password',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Enter your email address and we will send you a password reset link.',
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon:
                    const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: resetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SIGN UP PAGE
// ============================================================

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() =>
      _SignUpPageState();
}

class _SignUpPageState
    extends State<SignUpPage> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  void signUp() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.person_add_alt_1,
              size: 70,
              color: Color(0xFF1565C0),
            ),

            const SizedBox(height: 20),

            const Text(
              'Join Travel Guide',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon:
                    const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon:
                    const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon:
                    const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword =
                          !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}