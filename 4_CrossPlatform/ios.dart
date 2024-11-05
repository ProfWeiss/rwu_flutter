import 'package:flutter/cupertino.dart';

class IosHome extends StatelessWidget {
  IosHome({super.key});
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('iOS'),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // 20px space below the menu bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CupertinoTextField(
                controller: _textController,
                placeholder: 'iOS App',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
