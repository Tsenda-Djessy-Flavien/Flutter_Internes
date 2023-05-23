import 'package:flutter/material.dart';

class DemoButtoms extends StatefulWidget {
  const DemoButtoms({super.key});

  @override
  State<DemoButtoms> createState() => _DemoButtomsState();
}

class _DemoButtomsState extends State<DemoButtoms> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('DemoButtons BUILD called');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        // dans le cas de cette application, les updates de l'Etat ne conserne que ce text
        // qui sont declenchés par les bouttons ci-dessus.
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
