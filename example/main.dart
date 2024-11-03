import 'package:animated_clock_indicator/animated_clock_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedClockApp());
}

class AnimatedClockApp extends StatelessWidget {
  const AnimatedClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animated Clock Indicator Examples',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title and Example 1: Minimal clock with default settings
              Text(
                'Default Clock',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(),
                ),
              ),
              SizedBox(height: 20),

              // Title and Example 2: Customized clock with golden ratio length, distinct colors, and faster minute rotation
              Text(
                'Customized Clock',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 3.0,
                    minuteHandWidth: 2.5,
                    hourHandWidth: 3.0,
                    handInset: 3.0,
                    clockHandsLengthRatio: 0.618,
                    minuteHandRotationDuration: Duration(milliseconds: 800),
                    minuteToHourRotationRatio: 12.0,
                    borderColor: Colors.orange,
                    minuteHandColor: Colors.deepOrange,
                    hourHandColor: Colors.orangeAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Title and Example 3: Uniform color clock with custom stroke width for all elements
              Text(
                'Uniform Color Clock',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 120.0,
                height: 120.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions.withUniformColor(
                    color: Colors.blue,
                    borderWidth: 4.0,
                    minuteHandWidth: 2.5,
                    hourHandWidth: 3.0,
                    handInset: 3.0,
                    minuteHandRotationDuration: Duration(milliseconds: 1000),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Title and Example 4: Clock with distinct stroke caps for hour and minute hands
              Text(
                'Clock with Distinct Stroke Caps',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 140.0,
                height: 140.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 3.5,
                    minuteHandWidth: 3.0,
                    hourHandWidth: 4.0,
                    handInset: 2.5,
                    clockHandsLengthRatio: 0.75,
                    minuteHandRotationDuration: Duration(milliseconds: 900),
                    borderColor: Colors.red,
                    minuteHandColor: Colors.blue,
                    hourHandColor: Colors.green,
                    minuteHandStrokeCap: StrokeCap.butt,
                    hourHandStrokeCap: StrokeCap.square,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Title and Example 5: Clock without hour hand (clockHandsLengthRatio set to 0)
              Text(
                'Clock without Hour Hand',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 160.0,
                height: 160.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 4.0,
                    minuteHandWidth: 3.0,
                    hourHandWidth: 3.0,
                    handInset: 4.0,
                    clockHandsLengthRatio: 0,
                    // Only minute hand visible
                    minuteHandRotationDuration: Duration(milliseconds: 700),
                    borderColor: Colors.green,
                    minuteHandColor: Colors.lightGreen,
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
