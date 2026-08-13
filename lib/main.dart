import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
// Persistence package imported
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const RailOneApp());
}

class RailOneApp extends StatelessWidget {
  const RailOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RailOne',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Acherus',
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 1. LOGIN SCREEN
// ==========================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isBiometricEnabled = false;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(fontSize: 22, color: Color(0xFF1E293B)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.lightBlue.shade200, width: 1.5),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F6FB), Colors.white],
            stops: [0.0, 0.6],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset('assets/home/logo.png', height: 42),
                  const SizedBox(height: 60),
                  const Text(
                    'Login using mPIN',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF475569),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Debmalya!',
                    style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Enter mPIN below',
                    style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 16),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          color: Colors.blue.shade400,
                          width: 2,
                        ),
                      ),
                    ),
                    obscureText: true,
                    obscuringCharacter: '•',
                    showCursor: true,
                    onCompleted: (pin) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF1E3A8A),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF1E3A8A),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Reset mPIN?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          child: Divider(
                            color: Colors.grey.shade400,
                            height: 36,
                          ),
                        ),
                      ),
                      const Text(
                        "Enable biometric ?",
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Divider(
                            color: Colors.grey.shade400,
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/home/bio_face.png',
                        width: 40,
                        height: 40,
                        color: const Color(0xFF1F2430),
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        'assets/home/bio_finger.png',
                        width: 40,
                        height: 40,
                        color: const Color(0xFF1F2430),
                      ),
                      const Spacer(),
                      Switch(
                        value: isBiometricEnabled,
                        onChanged: (value) =>
                            setState(() => isBiometricEnabled = value),
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'By enabling biometric authentication you will be able to login through your device set biometric.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 60),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF1E3A8A),
                    ),
                    child: const Text(
                      'Different User?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. MAIN SCREEN (Handles Global State & Drawer)
// ==========================================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // ================= GLOBAL STATES =================
  // These variables hold the app's dynamic data.
  // Their default values are used only on the very first app launch.
  String _globalUserName = 'Debmalya';
  String _ticketType = 'MONTHLY';
  String _fromLocation = 'CHANDAN NAGAR';
  String _toLocation = 'BIDHANNAGAR ROAD';
  String _distance = '— 36 km —';
  String _bookingDate = 'Mon, 23 Mar 26';

  // New States added
  String _bookedOn = '23/03/2026 18:35';
  String _panCard = 'CRMPC3965M';
  String _viaStation = 'BLY-BLYH';
  String _age = '51';
  String _mobileNumber = '9874755795';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Persistence state
  late Future<SharedPreferences> _prefsFuture;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    // Start the shared preferences initialization immediately
    _prefsFuture = SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      _loadSavedData(); // Load any previously saved data
      return prefs;
    });
  }

  // Keys for SharedPreferences
  static const String _keyUserName = 'global_user_name';
  static const String _keyTicketType = 'ticket_type';
  static const String _keyFromLocation = 'from_location';
  static const String _keyToLocation = 'to_location';
  static const String _keyDistance = 'distance';
  static const String _keyBookingDate = 'booking_date';
  static const String _keyBookedOn = 'booked_on';
  static const String _keyPanCard = 'pan_card';
  static const String _keyViaStation = 'via_station';
  static const String _keyAge = 'age';
  static const String _keyMobileNumber = 'mobile_number';

  // Loads saved data from SharedPreferences, providing fallback default values
  void _loadSavedData() {
    setState(() {
      _globalUserName = _prefs.getString(_keyUserName) ?? _globalUserName;
      _ticketType = _prefs.getString(_keyTicketType) ?? _ticketType;
      _fromLocation = _prefs.getString(_keyFromLocation) ?? _fromLocation;
      _toLocation = _prefs.getString(_keyToLocation) ?? _toLocation;
      _distance = _prefs.getString(_keyDistance) ?? _distance;
      _bookingDate = _prefs.getString(_keyBookingDate) ?? _bookingDate;
      _bookedOn = _prefs.getString(_keyBookedOn) ?? _bookedOn;
      _panCard = _prefs.getString(_keyPanCard) ?? _panCard;
      _viaStation = _prefs.getString(_keyViaStation) ?? _viaStation;
      _age = _prefs.getString(_keyAge) ?? _age;
      _mobileNumber = _prefs.getString(_keyMobileNumber) ?? _mobileNumber;
    });
  }

  // Function to switch back to Home tab
  void _goToHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  // ================= SAVE & UPDATE LOGIC =================
  // Each update function now also saves the new value to shared preferences.
  void _updateName(String newName) {
    setState(() {
      _globalUserName = newName;
    });
    _prefs.setString(_keyUserName, newName); // Save
  }

  // Updated save function to receive all 10 dynamic fields and persist them.
  void _updateTicketData(
    String type,
    String from,
    String to,
    String dist,
    String date,
    String bookedOn,
    String pan,
    String via,
    String age,
    String mobile,
  ) {
    setState(() {
      _ticketType = type;
      _fromLocation = from;
      _toLocation = to;
      _distance = dist;
      _bookingDate = date;
      _bookedOn = bookedOn;
      _panCard = pan;
      _viaStation = via;
      _age = age;
      _mobileNumber = mobile;
    });
    // Persist all the new data
    _prefs.setString(_keyTicketType, type);
    _prefs.setString(_keyFromLocation, from);
    _prefs.setString(_keyToLocation, to);
    _prefs.setString(_keyDistance, dist);
    _prefs.setString(_keyBookingDate, date);
    _prefs.setString(_keyBookedOn, bookedOn);
    _prefs.setString(_keyPanCard, pan);
    _prefs.setString(_keyViaStation, via);
    _prefs.setString(_keyAge, age);
    _prefs.setString(_keyMobileNumber, mobile);
  }

  @override
  Widget build(BuildContext context) {
    // Array of tab screens. Using the dynamic global state variables.
    final List<Widget> screens = [
      HomeContentScreen(userName: _globalUserName),
      const SizedBox(), // Dummy for My Bookings (Pushed instead)
      YouScreen(
        onBackPressed: _goToHome,
        userName: _globalUserName,
        onNameChanged: _updateName,
      ),
      const SizedBox(), // Menu is handled via Drawer
    ];

    // Wrap the Scaffold in a FutureBuilder to ensure SharedPreferences is ready.
    return FutureBuilder<SharedPreferences>(
      future: _prefsFuture,
      builder: (context, snapshot) {
        // If shared preferences aren't ready, show a loading indicator.
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            backgroundColor: Color(0xFFE8F6FB),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Color(0xFF0066FF)),
                  SizedBox(height: 20),
                  Text(
                    'Loading settings...',
                    style: TextStyle(color: Color(0xFF1E3A8A)),
                  ),
                ],
              ),
            ),
          );
        }

        // If shared preferences are loaded, build the normal app UI.
        return Scaffold(
          key: _scaffoldKey,
          body: screens[_currentIndex],

          // The Right-Side Menu Drawer
          endDrawer: _buildMenuDrawer(),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex == 3
                ? 0
                : _currentIndex, // Prevent visual bug if menu is tapped
            onTap: (index) {
              if (index == 1) {
                // Pass completely everything down into MyBookingsScreen.
                // The values are loaded from persistence already.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBookingsScreen(
                      userName: _globalUserName,
                      ticketType: _ticketType,
                      fromLocation: _fromLocation,
                      toLocation: _toLocation,
                      distance: _distance,
                      bookingDate: _bookingDate,
                      bookedOn: _bookedOn,
                      panCard: _panCard,
                      viaStation: _viaStation,
                      age: _age,
                      mobileNumber: _mobileNumber,
                    ),
                  ),
                );
              } else if (index == 3) {
                // First redirect to Home Screen
                setState(() {
                  _currentIndex = 0;
                });
                // Then pop open the side menu
                _scaffoldKey.currentState?.openEndDrawer();
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFF0066FF),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num_outlined),
                activeIcon: Icon(Icons.confirmation_num),
                label: 'My Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'You',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                activeIcon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
          ),
        );
      },
    );
  }

  // --- MENU DRAWER BUILDER ---
  Widget _buildMenuDrawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F4FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: const Color(0xFF4CB3E6),
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.blue.shade100,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _globalUserName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -35,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FF),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9FA8DA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'R-Wallet',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '₹ 0.00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0066FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            minimumSize: const Size(0, 36),
                          ),
                          child: const Text(
                            'Add Money',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildDrawerItem(
                    icon: Icons.map_outlined,
                    title: 'Show/Hide Services',
                    onTap: () {
                      Navigator.pop(context);
                      // Push to the configuration panel, passing all current persistent data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowHideServicesScreen(
                            currentType: _ticketType,
                            currentFrom: _fromLocation,
                            currentTo: _toLocation,
                            currentDistance: _distance,
                            currentDate: _bookingDate,
                            currentBookedOn: _bookedOn,
                            currentPanCard: _panCard,
                            currentVia: _viaStation,
                            currentAge: _age,
                            currentMobile: _mobileNumber,
                            onSave: _updateTicketData,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.forum_outlined,
                    title: 'FAQs',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.support_agent,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.thumb_up_outlined,
                    title: 'Rate Us',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.share_outlined,
                    title: 'Share',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: Text(
                'V-2.1.49-214',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF7E84F3)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      horizontalTitleGap: 8,
    );
  }
}

// ==========================================
// SHOW/HIDE SERVICES (Configuration Panel)
// ==========================================
class ShowHideServicesScreen extends StatefulWidget {
  final String currentType,
      currentFrom,
      currentTo,
      currentDistance,
      currentDate;
  final String currentBookedOn,
      currentPanCard,
      currentVia,
      currentAge,
      currentMobile;
  // This callback accepts all 10 dynamic fields to pass them back to the parent global state.
  final Function(
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
  )
  onSave;

  const ShowHideServicesScreen({
    super.key,
    required this.currentType,
    required this.currentFrom,
    required this.currentTo,
    required this.currentDistance,
    required this.currentDate,
    required this.currentBookedOn,
    required this.currentPanCard,
    required this.currentVia,
    required this.currentAge,
    required this.currentMobile,
    required this.onSave,
  });

  @override
  State<ShowHideServicesScreen> createState() => _ShowHideServicesScreenState();
}

class _ShowHideServicesScreenState extends State<ShowHideServicesScreen> {
  // Input controllers for each of the 10 dynamic fields
  late TextEditingController _typeController,
      _fromController,
      _toController,
      _distanceController,
      _dateController;
  late TextEditingController _bookedOnController,
      _panController,
      _viaController,
      _ageController,
      _mobileController;

  @override
  void initState() {
    super.initState();
    // Initialize each controller with its corresponding current value passed from MainScreen
    _typeController = TextEditingController(text: widget.currentType);
    _fromController = TextEditingController(text: widget.currentFrom);
    _toController = TextEditingController(text: widget.currentTo);
    _distanceController = TextEditingController(text: widget.currentDistance);
    _dateController = TextEditingController(text: widget.currentDate);
    _bookedOnController = TextEditingController(text: widget.currentBookedOn);
    _panController = TextEditingController(text: widget.currentPanCard);
    _viaController = TextEditingController(text: widget.currentVia);
    _ageController = TextEditingController(text: widget.currentAge);
    _mobileController = TextEditingController(text: widget.currentMobile);
  }

  @override
  void dispose() {
    // Dispose all controllers to free up resources
    _typeController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _distanceController.dispose();
    _dateController.dispose();
    _bookedOnController.dispose();
    _panController.dispose();
    _viaController.dispose();
    _ageController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modify Ticket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0066FF),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change the details below to update the upcoming ticket view.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Basic Info
            _buildInputField('Ticket Type', _typeController),
            const SizedBox(height: 16),
            _buildInputField('From Location', _fromController),
            const SizedBox(height: 16),
            _buildInputField('To Location', _toController),
            const SizedBox(height: 16),
            _buildInputField('Distance', _distanceController),
            const SizedBox(height: 16),
            _buildInputField('Via Station', _viaController),
            const SizedBox(height: 16),

            // Date Info
            _buildInputField(
              'Booking Date (e.g. Mon, 23 Mar 26)',
              _dateController,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              'Booked On (e.g. 23/03/2026 18:35)',
              _bookedOnController,
            ),
            const SizedBox(height: 16),

            // Personal Info
            _buildInputField('PAN Card ID Number', _panController),
            const SizedBox(height: 16),
            _buildInputField('Age (e.g. 51)', _ageController),
            const SizedBox(height: 16),
            _buildInputField('Mobile Number', _mobileController),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Pass all 10 update strings back via the callback.
                  // MainScreen's function will pick this up and persist it.
                  widget.onSave(
                    _typeController.text,
                    _fromController.text,
                    _toController.text,
                    _distanceController.text,
                    _dateController.text,
                    _bookedOnController.text,
                    _panController.text,
                    _viaController.text,
                    _ageController.text,
                    _mobileController.text,
                  );
                  Navigator.pop(context); // Go back one screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Ticket Updated Successfully! Check "My Bookings"',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0066FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue.shade800),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF0066FF), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.blue.shade50.withOpacity(0.3),
      ),
    );
  }
}

// ==========================================
// 3. HOME CONTENT SCREEN
// ==========================================
class HomeContentScreen extends StatelessWidget {
  final String userName;
  const HomeContentScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    const sectionHeaderStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0D2160),
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(
                      'assets/home/lang.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Image.asset('assets/home/logo.png', height: 34),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.black87,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Hi, $userName!',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF16307A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Journey Planner', style: sectionHeaderStyle),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildJourneyCard('Reserved', 'assets/home/jp0.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildJourneyCard(
                      'Unreserved',
                      'assets/home/jp1.png',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildJourneyCard('Platform', 'assets/home/jp2.png'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('More Offerings', style: sectionHeaderStyle),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOfferingItem('assets/home/off0.png', 'Search\nTrains'),
                      _buildOfferingItem('assets/home/off1.png', 'PNR\nStatus'),
                      _buildOfferingItem(
                        'assets/home/off2.png',
                        'Coach\nPosition',
                      ),
                      _buildOfferingItem(
                        'assets/home/off3.png',
                        'Track Your\nTrain',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOfferingItem('assets/home/off4.png', 'Order\nFood'),
                      _buildOfferingItem('assets/home/off5.png', 'File\nRefund'),
                      _buildOfferingItem('assets/home/off6.png', 'Rail\nMadad'),
                      _buildOfferingItem('assets/home/off7.png', 'Go To\nWAVES'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Do You know?', style: sectionHeaderStyle),
              const SizedBox(height: 12),
              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFactCard(
                      'assets/home/dyk0.png',
                      'First ever passenger train was run between Bori Bandar to Thane on April 16, 1853.',
                    ),
                    _buildFactCard(
                      'assets/home/dyk1.png',
                      'Chenab Railway Bridge in Dharot, Jammu & Kashmir is the World\'s highest Railway Bridge.',
                    ),
                    _buildFactCard(
                      'assets/home/dyk2.png',
                      'Noney Bridge is going to be world\'s tallest railway bridge pier at a height of 141 meters.',
                    ),
                    _buildFactCard(
                      'assets/home/dyk3.png',
                      'Shree Siddharoodha Swamiji Railway Station Hubballi is world\'s longest Railway Platform with length of 1505 meters.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Follow Us On Social Media Platforms',
                style: sectionHeaderStyle,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 971 / 448,
                  child: Image.asset('assets/home/follow.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJourneyCard(String title, String asset) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: AspectRatio(
            aspectRatio: 312 / 264,
            child: Image.asset(asset, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF33475F),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildOfferingItem(String asset, String label) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Image.asset(asset, width: 74, height: 66, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF16324F),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactCard(String asset, String text) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              asset,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. MY BOOKINGS SCREEN
// ==========================================
class MyBookingsScreen extends StatefulWidget {
  // Constructor now receives all 10 dynamic variables to pass them down further.
  final String userName,
      ticketType,
      fromLocation,
      toLocation,
      distance,
      bookingDate;
  final String bookedOn, panCard, viaStation, age, mobileNumber;

  const MyBookingsScreen({
    super.key,
    required this.userName,
    required this.ticketType,
    required this.fromLocation,
    required this.toLocation,
    required this.distance,
    required this.bookingDate,
    required this.bookedOn,
    required this.panCard,
    required this.viaStation,
    required this.age,
    required this.mobileNumber,
  });

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  String _selectedTab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0066FF),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Bookings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildBodyContent()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FD),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border.all(color: Colors.blue.shade100, width: 1),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomTabItem(
                    'Upcoming',
                    Icons.confirmation_num_outlined,
                  ),
                  _buildBottomTabItem('Completed', Icons.task_alt),
                  _buildBottomTabItem('Cancelled', Icons.cancel_outlined),
                  _buildBottomTabItem('All', Icons.receipt_long_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyContent() {
    switch (_selectedTab) {
      case 'Upcoming':
        return _buildUpcomingView();
      case 'Completed':
        return _buildCompletedView();
      default:
        return Center(
          child: Text(
            'No $_selectedTab Bookings',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  Widget _buildUpcomingView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Upcoming (1)',
                  style: TextStyle(
                    color: Color(0xFFF57C00),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.autorenew, color: Colors.grey.shade600),
              ],
            ),
            const SizedBox(height: 16),
            // Pass all persistence data through to the TicketCard
            TicketCard(
              userName: widget.userName,
              ticketStatus: 'Unreserved',
              refLabel: 'UTS:',
              refNumber: 'XEMBEBH037',
              leftLabel: 'Ticket Type',
              leftValue: widget.ticketType,
              rightLabel: 'Booking Date',
              rightValue: widget.bookingDate,
              fromStation: widget.fromLocation,
              toStation: widget.toLocation,
              durationOrDistance: widget.distance,
              // Passing new dynamic fields further down
              bookedOn: widget.bookedOn,
              panCard: widget.panCard,
              viaStation: widget.viaStation,
              age: widget.age,
              mobileNumber: widget.mobileNumber,
              borderColor: const Color(0xFFF57C00),
              bookAgainBlue: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Completed (7)',
                  style: TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.autorenew, color: Colors.grey.shade600),
              ],
            ),
            const SizedBox(height: 16),
            TicketCard(
              userName: widget.userName,
              ticketStatus: 'Reserved',
              refLabel: 'PNR:',
              refNumber: '6363552201',
              leftLabel: 'Train No.',
              leftValue: '13149 (KANCHAN KANYA)',
              rightLabel: 'Journey Date',
              rightValue: 'Tue, 3 Mar 26',
              fromStation: 'SEALDAH',
              toStation: 'SILIGURI JN.',
              durationOrDistance: '—11h:40m—',
              bookedOn: widget.bookedOn,
              panCard: widget.panCard,
              viaStation: widget.viaStation,
              age: widget.age,
              mobileNumber: widget.mobileNumber,
              borderColor: const Color(0xFF81C784),
              bookAgainBlue: true,
            ),
            const SizedBox(height: 16),
            TicketCard(
              userName: widget.userName,
              ticketStatus: 'Reserved',
              refLabel: 'PNR:',
              refNumber: '6940086863',
              leftLabel: 'Train No.',
              leftValue: '22302 (VANDE BHARAT EXP)',
              rightLabel: 'Journey Date',
              rightValue: 'Mon, 9 Mar 26',
              fromStation: 'NEW JALPAIGURI JN.',
              toStation: 'HOWRAH',
              durationOrDistance: '—7h:35m—',
              bookedOn: widget.bookedOn,
              panCard: widget.panCard,
              viaStation: widget.viaStation,
              age: widget.age,
              mobileNumber: widget.mobileNumber,
              borderColor: const Color(0xFF81C784),
              bookAgainBlue: true,
            ),
            const SizedBox(height: 16),
            TicketCard(
              userName: widget.userName,
              ticketStatus: 'Unreserved',
              refLabel: 'UTS:',
              refNumber: 'XEDKEBE030',
              leftLabel: 'Ticket Type',
              leftValue: 'JOURNEY',
              rightLabel: 'Booking Date',
              rightValue: 'Fri, 20 Mar 26',
              fromStation: 'BELGHARIA',
              toStation: 'BIDHANNAGAR ROAD',
              durationOrDistance: '— 8 km —',
              bookedOn: widget.bookedOn,
              panCard: widget.panCard,
              viaStation: widget.viaStation,
              age: widget.age,
              mobileNumber: widget.mobileNumber,
              borderColor: const Color(0xFF81C784),
              bookAgainBlue: true,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomTabItem(String title, IconData icon) {
    bool isSelected = _selectedTab == title;
    Color activeColor = title == 'Upcoming'
        ? const Color(0xFFF57C00)
        : title == 'Completed'
        ? const Color(0xFF4CAF50)
        : const Color(0xFF0066FF);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/home/tab_icon.png',
              width: 32,
              color: isSelected ? activeColor : Colors.grey.shade600,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? activeColor : Colors.grey.shade600,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. YOU SCREEN
// ==========================================
class YouScreen extends StatefulWidget {
  final VoidCallback onBackPressed;
  final String userName;
  final ValueChanged<String> onNameChanged;

  const YouScreen({
    super.key,
    required this.onBackPressed,
    required this.userName,
    required this.onNameChanged,
  });

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  bool _isBiometricOn = false;

  void _editNameDialog() {
    TextEditingController controller = TextEditingController(
      text: widget.userName,
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Details'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Enter Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0066FF),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                widget.onNameChanged(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE8F6FB),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: widget.onBackPressed,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFF0066FF),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color(0xFF4CB3E6),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.blue.shade100,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 16,
                                  color: Color(0xFF0066FF),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: Color(0xFF0066FF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '|',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _editNameDialog,
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: Color(0xFF0066FF),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Edit Details',
                                  style: TextStyle(
                                    color: Color(0xFF0066FF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'R-Wallet',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '₹ 0.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.sync, color: Color(0xFF0066FF)),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0066FF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              child: const Text(
                                'Add',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Incomplete',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: 0.8,
                                  minHeight: 8,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF689F38),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              '80%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9ED),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.people_alt,
                                color: Color(0xFFFFA726),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Saved Passengers',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Add/Edit Passenger info',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.sync, color: Color(0xFFFFA726)),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFA726),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF3E0),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Color(0xFFFFA726),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.userName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.crop_square,
                                          size: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '22 Y, M, NC | No Food',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.edit_outlined,
                                color: Colors.orange.shade300,
                                size: 20,
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.orange.shade300,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.9,
                    children: [
                      _buildGridItem(
                        icon: Icons.password,
                        title: 'Change\nPassword',
                        bgColor: const Color(0xFFE0F7FA),
                        iconColor: const Color(0xFF00ACC1),
                      ),
                      _buildGridItem(
                        icon: Icons.credit_card,
                        title: 'My\nAccount',
                        bgColor: const Color(0xFFF1F8E9),
                        iconColor: const Color(0xFF4CAF50),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                value: _isBiometricOn,
                                onChanged: (val) {
                                  setState(() {
                                    _isBiometricOn = val;
                                  });
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.grey.shade700,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.grey.shade400,
                              ),
                            ),
                            const Text(
                              'Biometric',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF1E3A8A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildGridItem(
                        icon: Icons.local_activity,
                        title: 'Transfer\nTicket',
                        bgColor: const Color(0xFFE3F2FD),
                        iconColor: const Color(0xFF2196F3),
                      ),
                      _buildGridItem(
                        icon: Icons.receipt_long,
                        title: 'My\nTransaction',
                        bgColor: const Color(0xFFFFF3E0),
                        iconColor: const Color(0xFFFF9800),
                      ),
                      _buildGridItem(
                        icon: Icons.branding_watermark,
                        title: 'Link Your\nAadhar',
                        bgColor: const Color(0xFFF9FBE7),
                        iconColor: const Color(0xFFAFB42B),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String title,
    required Color bgColor,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TICKET WIDGET & PAINTERS
// ==========================================
class TicketCard extends StatelessWidget {
  final String userName;
  final String ticketStatus;
  final String refLabel,
      refNumber,
      leftLabel,
      leftValue,
      rightLabel,
      rightValue;
  final String fromStation, toStation, durationOrDistance;
  // Dynamic fields from persistence
  final String bookedOn, panCard, viaStation, age, mobileNumber;
  final Color borderColor;
  final bool bookAgainBlue;

  const TicketCard({
    super.key,
    required this.userName,
    required this.ticketStatus,
    required this.refLabel,
    required this.refNumber,
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
    required this.fromStation,
    required this.toStation,
    required this.durationOrDistance,
    // Receiving new fields
    required this.bookedOn,
    required this.panCard,
    required this.viaStation,
    required this.age,
    required this.mobileNumber,
    required this.borderColor,
    required this.bookAgainBlue,
  });

  @override
  Widget build(BuildContext context) {
    Color badgeBgColor = ticketStatus == 'Reserved'
        ? const Color(0xFFE0F7FA)
        : const Color(0xFFF0E6F6);
    Color badgeTextColor = ticketStatus == 'Reserved'
        ? const Color(0xFF00ACC1)
        : const Color(0xFFA24FBE);

    return CustomPaint(
      painter: TicketPainter(borderColor: borderColor),
      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: badgeBgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    ticketStatus,
                    style: TextStyle(
                      color: badgeTextColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, fontFamily: 'Acherus'),
                    children: [
                      TextSpan(
                        text: '$refLabel ',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: refNumber,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leftLabel,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  rightLabel,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leftValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  rightValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Text Wrapping Fix for From/To locations. Station names wrap to next line cleanly.
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Top align for wrapping
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    fromStation,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    durationOrDistance,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    toStation,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            DashedDivider(color: borderColor.withOpacity(0.5)),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Book Again',
                      style: TextStyle(
                        color: bookAgainBlue
                            ? const Color(0xFF1976D2)
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(width: 1, height: 20, color: Colors.grey.shade300),
                  TextButton(
                    onPressed: () {
                      // Navigate to Full Booking Details Screen, passing ALL persistent data down.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailsScreen(
                            userName: userName,
                            ticketType: leftValue,
                            fromLocation: fromStation,
                            toLocation: toStation,
                            distance: durationOrDistance,
                            bookingDate: rightValue,
                            refNumber: refNumber,
                            bookedOn: bookedOn,
                            panCard: panCard,
                            viaStation: viaStation,
                            age: age,
                            mobileNumber: mobileNumber,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  TicketPainter({required this.borderColor});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final path = Path();
    const radius = 12.0;
    const cutoutRadius = 10.0;
    final cutoutY = size.height - 50.0;
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(size.width, cutoutY - cutoutRadius);
    path.arcToPoint(
      Offset(size.width, cutoutY + cutoutRadius),
      radius: const Radius.circular(cutoutRadius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(0, cutoutY + cutoutRadius);
    path.arcToPoint(
      Offset(0, cutoutY - cutoutRadius),
      radius: const Radius.circular(cutoutRadius),
      clockwise: false,
    );
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
    );
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TicketPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor;
  }
}

class DashedDivider extends StatelessWidget {
  final Color color;
  const DashedDivider({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: CustomPaint(painter: DashedLinePainter(color: color)),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  DashedLinePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 4, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

// ==========================================
// 6. BOOKING DETAILS (TICKET) SCREEN
// ==========================================
class BookingDetailsScreen extends StatefulWidget {
  final String userName,
      ticketType,
      fromLocation,
      toLocation,
      distance,
      bookingDate,
      refNumber;
  final String bookedOn, panCard, viaStation, age, mobileNumber;

  const BookingDetailsScreen({
    super.key,
    required this.userName,
    required this.ticketType,
    required this.fromLocation,
    required this.toLocation,
    required this.distance,
    required this.bookingDate,
    required this.refNumber,
    required this.bookedOn,
    required this.panCard,
    required this.viaStation,
    required this.age,
    required this.mobileNumber,
  });

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  // Timer State now starts at 04:59 (299 seconds)
  int _secondsRemaining = 299;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Timer loops infinitely back to 04:59 when it ends
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _secondsRemaining = 299; // Reset/Loop back to 04:59
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Helper function to format seconds into MM:SS format
  String get _formattedTime {
    int m = _secondsRemaining ~/ 60;
    int s = _secondsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // --- Date Parsers ---

  // Converts '23/03/2026 18:35' string to '23 Mar 2026, 18:35' format for the dark ticket header.
  String getTicketBookingDateTime(String bookedOnStr) {
    try {
      List<String> parts = bookedOnStr.split(' ');
      List<String> dateParts = parts[0].split('/');
      int month = int.parse(dateParts[1]);
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${dateParts[0]} ${months[month - 1]} ${dateParts[2]}, ${parts[1]}';
    } catch (e) {
      return bookedOnStr; // Fallback in case of parse error
    }
  }

  // Takes '23/03/2026 18:35' and automatically calculates the exact next day for 'Valid Till'.
  String getValidTill(String bookedOnStr) {
    try {
      List<String> parts = bookedOnStr.split(' ')[0].split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);
      DateTime dt = DateTime(
        year,
        month,
        day,
      ).add(const Duration(days: 1)); // Automatically Adds 1 Day
      return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    } catch (e) {
      return '24/03/2026'; // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    // Neutral light grey page background (matches real app)
    const bgColor = Color(0xFFE9E7EC);

    // Dynamically derived date strings based on the 'Booked On' persistent state.
    String topTicketDate = getTicketBookingDateTime(widget.bookedOn);
    String validFromDate = widget.bookedOn.split(' ')[0]; // Just the date part
    String validTillDate = getValidTill(widget.bookedOn); // Next day calculated

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1255EA), // RailOne vivid blue
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2A72F5), Color(0xFF0F49D6)],
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Mobile: ${widget.mobileNumber}',
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ), // Dynamic Mobile
          ],
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.receipt_long), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dynamic Greeting Banner
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              child: Text(
                'Thank You ${widget.userName}, Happy Journey !',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // ================= FULL TICKET CARD =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Main background container of the ticket
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDECEE),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // --- GREEN ROUNDED TOP STRIP ---
                        Container(
                          height: 14,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFAFD599),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                        ),
                        // --- DYNAMIC PREVIEW CARD (dark diamond panel) ---
                        LayoutBuilder(
                          builder: (context, c) {
                            final double w = c.maxWidth;
                            final double h = w / 1.884;
                            return SizedBox(
                              width: w,
                              height: h,
                              child: ClipRect(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned.fill(
                                      child: CustomPaint(
                                        painter: HarlequinPainter(),
                                      ),
                                    ),
                                    Positioned(
                                      left: w * 0.02,
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Text(
                                            'INDIAN RAILWAYS',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.032,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: w * 0.02,
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Text(
                                            'भारतीय रेल',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.036,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: w * 0.115,
                                      top: w * 0.03,
                                      bottom: w * 0.03,
                                      width: 1.5,
                                      child: CustomPaint(painter: VDashPainter()),
                                    ),
                                    Positioned(
                                      right: w * 0.115,
                                      top: w * 0.03,
                                      bottom: w * 0.03,
                                      width: 1.5,
                                      child: CustomPaint(painter: VDashPainter()),
                                    ),
                                    SizedBox(
                                      width: w * 0.74,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Dynamic preview will close in',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: w * 0.044,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Technica',
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: w * 0.004),
                                          Text(
                                            _formattedTime,
                                            style: TextStyle(
                                              color: const Color(0xFFEC1C24),
                                              fontSize: w * 0.135,
                                              height: 1.0,
                                              fontFamily: 'TimerFont',
                                            ),
                                          ),
                                          SizedBox(height: w * 0.006),
                                          Text(
                                            'Ticket Booking Date & Time',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.038,
                                              fontFamily: 'Technica',
                                            ),
                                          ),
                                          SizedBox(height: w * 0.004),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              topTicketDate,
                                              style: TextStyle(
                                                color: const Color(0xFFFFA21C),
                                                fontSize: w * 0.066,
                                                fontFamily: 'AftikaSoft',
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: w * 0.006),
                                          Text(
                                            widget.refNumber,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.036,
                                            ),
                                          ),
                                          SizedBox(height: w * 0.002),
                                          Text(
                                            'Ticket is Non-Transferable',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // --- MIDDLE SECTION (JOURNEY DETAILS) ---
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Season Ticket',
                                    style: TextStyle(
                                      color: Color(0xFF2A2A30),
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    widget.refNumber,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Corrected Wrapping for Location Names: names wrap underneath start position.
                              Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align wrap to top
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.fromLocation,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ), // Dynamic From
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      widget.distance,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ), // Dynamic Distance
                                  Expanded(
                                    child: Text(
                                      widget.toLocation,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ), // Dynamic To
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Via',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          widget.viaStation,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), // Dynamic Via
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'Booked on',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          widget.bookedOn,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), // Dynamic Booked On date/time
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Valid From',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        validFromDate,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ), // Dynamic Valid From (Date part of Booked On)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        '*Valid Till',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        validTillDate,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ), // Dynamic Calculated Next Day Valid Till
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${widget.ticketType} | ORDINARY | SECOND | ₹ 185.00',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ), // Dynamic Type
                            ],
                          ),
                        ),

                        // --- DIVIDER AREA (Overlay Cutouts happen here) ---
                        const SizedBox(height: 10),

                        // --- BOTTOM SECTION (PASSENGER DETAILS) ---
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Name',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          widget.userName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), // DYNAMIC USER NAME
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Age',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${widget.age} years',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ), // Dynamic Age
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID Type',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'ID Number',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        widget.panCard,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ), // Dynamic PAN Card number
                                ],
                              ),
                            ],
                          ),
                        ),
                        // --- GREEN ROUNDED BOTTOM STRIP ---
                        Container(
                          height: 14,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFAFD599),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================= INDENTED TICKET CUTOUT OVERLAYS =================
                  // Creates semi-circle indent look using overlays.
                  Positioned(
                    bottom: 125,
                    left: -15,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: bgColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 125,
                    right: -15,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: bgColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Red Warning Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFBE4EF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Note: This ticket is non refundable. Ticket is stored locally on the device. Please do not change your handset or perform factory reset.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE23B7A),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Upgrade Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0052D4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Upgrade to Superfast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // DENSE STATIC QR CODE IMAGE from instructions/artifact.
            // Shows exact provided appearance, not a functional replica.
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/ticket_qr.png', // The artifact image
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 250,
                  height: 250,
                  child: Icon(Icons.qr_code, size: 200, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Do you know text section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEDECEE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you know?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'IR recovers only 57% of cost of travel on an average.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This ticket is booked on a personal user ID. It\'s sale/purchase is an offence u/s 143 of the Railways Act, 1989',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'For enquiry and integrated railway helpline. please dial 139.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}


class VDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 1.5;
    const dash = 3.0, gap = 4.0;
    double y = 0;
    final x = size.width / 2;
    while (y < size.height) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dash), paint);
      y += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HarlequinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.black,
    );
    final grey = Paint()..color = const Color(0xFF1A1A1A);
    final double cw = size.width / 12; // half horizontal spacing (~6 across)
    final double ch = cw * 1.5; // diamonds elongated vertically
    final int iMax = 14;
    final int jMax = (size.height / ch).ceil() + 2;
    for (int jj = -1; jj <= jMax; jj++) {
      for (int ii = -1; ii <= iMax; ii++) {
        if ((ii + jj) % 2 != 0) continue; // checkerboard: grey cells only
        final double cx = ii * cw;
        final double cy = jj * ch;
        final path = Path()
          ..moveTo(cx, cy - ch)
          ..lineTo(cx + cw, cy)
          ..lineTo(cx, cy + ch)
          ..lineTo(cx - cw, cy)
          ..close();
        canvas.drawPath(path, grey);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}