import '../models/account.dart';
import '../pages/files_page.dart';
import '../pages/profile_page.dart';
import '../pages/accounts_page.dart';
import '../controllers/account_controller.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int currentIndex = 0;
  late AccountController controller = AccountController(context: context, account: Account(email: '', userName: '', password: ''));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 232, 238, 100),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          FilesPage(),
          AccountsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(225, 232, 238, 100),
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(
              size: 30,
              Icons.filter_sharp,
            ),
          ),
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(
              size: 30,
              Icons.emoji_people_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: StreamBuilder(
              stream: controller.getAccount(),
              builder: (context, snapshotAccount) {
                if (snapshotAccount.hasData) {
                  controller.account = snapshotAccount.data;
                }
                return FutureBuilder(
                  future: controller.getAccountImage(),
                  builder: (context, snapshotImage) {
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        snapshotImage.data.toString(),
                      ),
                     
                    );
                  },
                );
              },
            ),
          ),
        ],
        onTap: (value) => setState(() => currentIndex = value),
      ),
    );
  }
}
