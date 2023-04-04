import 'package:flutter/material.dart';

import '../models/account.dart';
import '../utils/app_utils.dart';
import '../controllers/account_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late AccountController controller;

  @override
  void initState() {
    controller = AccountController(context: context, account: Account(email: '', userName: '', password: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.getAccount(),
      builder: (context, snapshotAccount) {
        if (snapshotAccount.hasData) {
          controller.account = snapshotAccount.data!;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Column(
              children: [
                FutureBuilder(
                  future: controller.getAccountImage(),
                  builder: (context, snapshotImage) {
                    if (snapshotImage.connectionState == ConnectionState.waiting) {
                      return const CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color.fromRGBO(225, 232, 238, 100),
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 123, 118, 155),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => controller.updateImage(),
                      onLongPress: () => controller.deleteImage(),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          snapshotImage.data.toString(),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.account!.userName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(0, 0, 0, 08),
                                shape: const StadiumBorder(),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              child: const Text(
                                'Изменить',
                              ),
                              onPressed: () => AppUtils(controller: controller).showEditUsernameDialog(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.account!.email,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.redAccent,
                                shape: const StadiumBorder(),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              child: const Text(
                                'Редактировать',
                              ),
                              onPressed: () => AppUtils(controller: controller).showEditEmailDialog(context),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            shape: const StadiumBorder(),
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          child: const Text(
                            'Смена пароля',
                          ),
                          onPressed: () => AppUtils(controller: controller).showEditPasswordDialog(context),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            shape: const StadiumBorder(),
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          child: const Text(
                            'Выход',
                          ),
                          onPressed: () => controller.signOut(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                 backgroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                child: const Text(
                  'Удалить',
                ),
                onPressed: () => controller.deleteAccount(),
              ),
            ),
          ],
        );
      },
    );
  }
}
