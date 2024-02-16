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
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDigit((number ~/ 10) % 10), // tens digit
                    _buildDigit(number % 10), // ones digit
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
      margin: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 7; i++) _buildRow(i, digit),
        ],
      ),
    );
  }
Widget _buildRow(int rowIndex, int digit) {
  List<bool> pattern = _getDigitPattern(digit);//0
  return Row(
    children: [
      for (var i = 0; i < 5; i++)
        _buildDot(pattern[i  *7+ rowIndex]), // Adjusting index to match pattern
    ],
  );
}

  Widget _buildDot(bool isActive) {
    return Container(
      width: 16,
      height: 16,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color.fromARGB(255, 178, 255, 89) : Color.fromARGB(255, 51, 51, 51),
      ),
    );
  }
  List<bool> _getDigitPattern(int digit) {
    List<List<bool>> patterns = [
      // 0
      [
        false,true,true,true,true,true,false,
        true,false,false,false,false,false,true,
        true,false,false,false,false,false,true,
        true,false,false,false,false,false,true,
        false,true,true,true,true,true,false,
      ], 
      // 1
      [
        false, false, false, false, false, false, false,
        false, true, false, false, false, false, true,
        true, true, true, true, true, true, true,
        false, false, false, false, false, false, true,
        false, false, false, false, false, false, false,
      ],  // row 7
      // 2
      [
        false, true, false, false, false, false, true,
        true, false, false, false, false, true, true,
        true, false, false, false, true, false, true,
        true, false, false, true, false, false, true,
        false, true, true, false, false, false, true
      ],  // row 7
      // 3
      [
        false, true, false, false, false, true, false,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        false, true, true, false, true, true, false
      ], // row 7
      // 4
       [
        false, false, false, true, true, false, false,
        false, false, true, false, true, false, false,
        false, true, false, false, true, false, false,
        true, true, true, true, true, true, true,
        false, false, false, false, true, false, false
      ], // row 7
      // 5
       [
        true, true, true, false, false, true, false,
        true, false, true, false, false, false, true,
        true, false, true, false, false, false, true,
        true, false, true, false, false, false, true,
        true, false, false, true, true, true, false
      ],
      // 6
      [
        false, true, true, true, true, true, false,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        false, true, false, false, true, true, false
      ],  // row 7
      // 7
       [
        true, false, false, false, false, false, false,
        true, false, false, false, true, true, true,
        true, false, false, true, false, false, false,
        true, false, true, false, false, false, false,
        true, true, false, false, false, false, false
      ], // row 7
      // 8
       [
        false, true, true, false, true, true, false,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        false, true, true, false, true, true, false
      ], // row 7
      // 9
       [
        false, true, true, false, false, true, false,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        true, false, false, true, false, false, true,
        false, true, true, true, true, true, false
      ],
    ];
    return patterns[digit];
  }

  Widget buildButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Container(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Icon(
            icon,
            size: 80.0,
          ),
        ),
      ),
    );
  }
  AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255,111, 67, 192),
    title: Center(
      child: Text(
        'LED Matrix Display',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

}
