// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BMI Calculator',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'BMI Calculator'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   double _height = 0.0; // 身長を保存する変数 (m単位)
//   double _weight = 0.0; // 体重を保存する変数 (kg単位)
//   double _bmi = 0.0;
//
//   // BMIを計算する関数
//   double calculateBMI() {
//     if (_height > 0) {
//       return _weight / (_height * _height); // BMI = 体重 / (身長 * 身長)
//     } else {
//       return 0.0; // 身長が0のときはBMIを計算しない
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Udemy の中で扱われているProgramming
//             const Text('身長（cm）'),
//             TextField(
//               onChanged: (value){
//                 _height = (double.tryParse(value) ?? 0 )/100;
//               },
//             ),
//
//             const Text('体重(kg)'),
//             TextField(
//               onChanged: (value){
//                 _weight = double.tryParse(value) ?? 0;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_height <= 0) {
//                   setState(() {
//                     _bmi = 0;
//                   });
//                   return;
//                 }
//               setState(() {
//                 _bmi = _weight / (_height * _height);
//               });
//             },
//               child: const Text('計算する'),),
//
//             Text('BMIは$_bmiです。'),
//
//
//
//
//
//
//
//             // 下記からはChatGPTによってかんがえてもらったData
//
//             // const Text('身長(cm)と体重(kg)を入力してBMIを計算'),
//             // const SizedBox(height: 16),
//             //
//             // // 身長入力フィールド
//             // TextField(
//             //   decoration: const InputDecoration(
//             //     labelText: '身長 (cm)',
//             //     border: OutlineInputBorder(),
//             //   ),
//             //   keyboardType: TextInputType.number,
//             //   onChanged: (value) {
//             //     setState(() {
//             //       _height = (double.tryParse(value) ?? 0) / 100; // cmをmに変換
//             //     });
//             //   },
//             // ),
//             //
//             // const SizedBox(height: 16),
//             //
//             // // 体重入力フィールド
//             // TextField(
//             //   decoration: const InputDecoration(
//             //     labelText: '体重 (kg)',
//             //     border: OutlineInputBorder(),
//             //   ),
//             //   keyboardType: TextInputType.number,
//             //   onChanged: (value) {
//             //     setState(() {
//             //       _weight = double.tryParse(value) ?? 0;
//             //     });
//             //   },
//             // ),
//             //
//             // const SizedBox(height: 16),
//
//             // 計算されたBMIを表示
//             // Text(
//             //   'BMI値: ${calculateBMI().toStringAsFixed(2)}',
//             //   style: const TextStyle(fontSize: 24),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 0.0; // 身長を保存する変数 (m単位)
  double _weight = 0.0; // 体重を保存する変数 (kg単位)
  double _bmi = 0.0;

  // BMIを計算する関数
  double calculateBMI() {
    if (_height > 0) {
      return _weight / (_height * _height); // BMI = 体重 / (身長 * 身長)
    } else {
      return 0.0; // 身長が0のときはBMIを計算しない
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('身長（cm）'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _height = (double.tryParse(value) ?? 0) / 100; // cmからmへ変換
                });
              },
            ),

            const SizedBox(height: 16), // 間隔を空ける
            const Text('体重(kg)'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = double.tryParse(value) ?? 0;
                });
              },
            ),

            const SizedBox(height: 16), // 間隔を空ける
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bmi = calculateBMI(); // BMI計算を関数で実行
                });
              },
              child: const Text('計算する'),
            ),

            const SizedBox(height: 16), // 間隔を空ける
            Text('BMIは$_bmiです。'),
          ],
        ),
      ),
    );
  }
}