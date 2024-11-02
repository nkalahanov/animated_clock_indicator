import 'package:animated_clock_indicator/animated_clock_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedClockApp());
}

class AnimatedClockApp extends StatelessWidget {
  const AnimatedClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Clock Indicator Example',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Default AnimatedClockIndicator with no customization.
              const SizedBox(
                width: 20.0,
                height: 20.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(),
                ),
              ),
              const SizedBox(height: 5),

              // Custom AnimatedClockIndicator with specific properties for each part.
              const SizedBox(
                width: 30.0,
                height: 30.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 3.0,
                    minuteHandWidth: 2.0,
                    hourHandWidth: 2.5,
                    handInset: 2.5,
                    clockHandsLengthRatio: 0.618,
                    minuteHandRotationDuration: Duration(milliseconds: 800),
                    minuteToHourRotationRatio: 12.0,
                    borderColor: Colors.orange,
                    minuteHandColor: Colors.deepOrange,
                    hourHandColor: Colors.orangeAccent,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // AnimatedClockIndicator using withUniformColor constructor
              const SizedBox(
                width: 40.0,
                height: 40.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions.withUniformColor(
                    color: Colors.blue,
                    // Applies the same color to all parts.
                    borderWidth: 3.0,
                    minuteHandWidth: 2.0,
                    hourHandWidth: 2.5,
                    handInset: 2.5,
                    minuteHandRotationDuration: Duration(milliseconds: 800),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions.withCustomColor(
                    borderColor: Colors.red.shade700,
                    minuteHandColor: Color(0xFF42A5F5),
                    hourHandColor: Colors.green,
                    borderWidth: 3.5,
                    minuteHandWidth: 2.5,
                    hourHandWidth: 3.0,
                    handInset: 3.0,
                    minuteHandRotationDuration: Duration(milliseconds: 700),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(
                width: 70.0,
                height: 70.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 5.0,
                    minuteHandWidth: 4.0,
                    hourHandWidth: 4.5,
                    handInset: 4.5,
                    clockHandsLengthRatio: 0.85,
                    minuteHandRotationDuration: Duration(milliseconds: 400),
                    minuteToHourRotationRatio: 12.0,
                    borderColor: Colors.green,
                    minuteHandColor: Colors.lightGreen,
                    hourHandColor: Colors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(
                width: 150.0,
                height: 150.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 5.5,
                    minuteHandWidth: 4.5,
                    hourHandWidth: 5.0,
                    handInset: 5.0,
                    clockHandsLengthRatio: 0.9,
                    minuteHandRotationDuration: Duration(milliseconds: 6300),
                    minuteToHourRotationRatio: 12.0,
                    borderColor: Colors.purple,
                    minuteHandColor: Colors.deepPurple,
                    hourHandColor: Colors.purpleAccent,
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
