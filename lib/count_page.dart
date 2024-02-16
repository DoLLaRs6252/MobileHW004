import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 187, 255),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: buildButton(
                icon: Icons.arrow_drop_up_outlined,
                onPressed: () {
                  setState(() {
                    number++;
                    if (number > 99) number = 0;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 254, 254),
                    width: 10.0,
                  ),
                  color: Color.fromARGB(255, 0, 0, 0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(118, 0, 0, 0).withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDigit((number ~/ 10) % 10),
                    SizedBox(width: 30.0),
                    _buildDigit(number % 10),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: buildButton(
                icon: Icons.arrow_drop_down_outlined,
                onPressed: () {
                  setState(() {
                    number--;
                    if (number < 0) number = 99;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDigit(int digit) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 7; i++) _buildRow(i, digit),
        ],
      ),
    );
  }

  Widget _buildRow(int rowIndex, int digit) {
    List<bool> pattern = _getDigitPattern(digit);
    return Row(
      children: [
        for (var i = 0; i < 5; i++) _buildDot(pattern[i * 7 + rowIndex]),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color.fromARGB(255, 178, 255, 89)
            : Color.fromARGB(255, 51, 51, 51),
      ),
    );
  }

  List<bool> _getDigitPattern(int digit) {
    List<List<bool>> patterns = [
      // 0
      [
        false,
        true,
        true,
        true,
        true,
        true,
        false,
        true,
        false,
        false,
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
        true,
        false,
        true,
        true,
        true,
        true,
        true,
        false,
      ],
      // 1
      [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        false,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ], // row 7
      // 2
      [
        false,
        true,
        false,
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        true,
        true,
        true,
        false,
        false,
        false,
        true,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        true,
        true,
        false,
        false,
        false,
        true
      ], // row 7
      // 3
      [
        false,
        true,
        false,
        false,
        false,
        true,
        false,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false
      ], // row 7
      // 4
      [
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        false
      ],
      // 5
      [
        true,
        true,
        true,
        false,
        false,
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        true,
        true,
        false,
        true,
        false,
        false,
        false,
        true,
        true,
        false,
        true,
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        true,
        true,
        false
      ],
      // 6
      [
        false,
        true,
        true,
        true,
        true,
        true,
        false,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        true,
        false,
        false,
        true,
        true,
        false
      ],
      // 7
      [
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        true,
        true,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false
      ],
      // 8
      [
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false
      ],
      // 9
      [
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        true,
        false,
        false,
        true,
        false,
        false,
        true,
        false,
        true,
        true,
        true,
        true,
        true,
        false
      ],
    ];
    return patterns[digit];
  }

Widget buildButton({required IconData icon, required VoidCallback onPressed}) {
  return Container(
    child: Ink(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // กำหนดให้รูปร่างเป็นวงกลม
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(44.0), // กำหนดให้ขอบเป็นวงกลม
        child: Container(
          width: 88.0,
          height: 88.0,
          child: Icon(
            icon,
            size: 80.0,
          ),
        ),
      ),
    ),
  );
}
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 111, 67, 192),
      title: Center(
        child: Text(
          'LED Matrix',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
