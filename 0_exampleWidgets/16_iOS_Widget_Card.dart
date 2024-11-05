import 'package:flutter/cupertino.dart';

class CupertinoCardExample extends StatefulWidget {
  @override
  _CupertinoCardExampleState createState() => _CupertinoCardExampleState();
}

class _CupertinoCardExampleState extends State<CupertinoCardExample> {
  int _selectedRating = 0;

  void _showRatingModal(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Your Rating'),
          content: Text('You rated this item $_selectedRating star(s).'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _updateRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Card with Rating'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Card with Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  color: CupertinoColors.systemGrey6,
                  child: Column(
                    children: [
                      const Image(
                          image: AssetImage('assets/images/coding.jpg')),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // 5-Star Rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () => _updateRating(index + 1),
                                  child: Icon(
                                    CupertinoIcons.star_fill,
                                    color: index < _selectedRating
                                        ? CupertinoColors.systemYellow
                                        : CupertinoColors.systemGrey,
                                    size: 32.0,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 16.0),

                            // OK Button
                            CupertinoButton(
                              color: CupertinoColors.activeBlue,
                              onPressed: () => _showRatingModal(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CupertinoApp(
    home: CupertinoCardExample(),
  ));
}
