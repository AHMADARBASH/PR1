import 'package:flutter/material.dart';

class UserDetailItem extends StatelessWidget {
  final String username;
  const UserDetailItem({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  username,
                  style: const TextStyle(fontSize: 28),
                ),
              )),
          Expanded(
              flex: 1,
              child: username.toLowerCase() == 'admin'
                  ? Icon(
                      Icons.admin_panel_settings,
                      color: Theme.of(context).colorScheme.primary,
                      size: 45,
                    )
                  : Icon(
                      Icons.person_outline_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 45,
                    )),
        ],
      ),
    );
  }
}
