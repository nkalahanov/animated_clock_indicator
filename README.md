## Animated Clock Indicator ⏰

An animated clock indicator widget for Flutter, allowing you to display customizable clock animations in your app.
![Animated Clock Indicator](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExMWg3OHU3emFnOXNjcnc2encxOTlpbzVzYmhmeDUxcnBjZG04aW9oaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Ovi28qe2giNFCkh9Xj/giphy.gif)

## Features

- ✅ **Customizable** clock appearance and behavior
- 🎨 **Flexible styling** options for clock border, minute hand, and hour hand
- 🕒 **Control** over animation durations and rotation ratios
- 💬 **Suitable** for chat message bubbles and other UI elements
- 🔍 **Supports** hiding the hour hand for added flexibility


## Installation

Add the following to your pubspec.yaml:

```yaml
dependencies:
animated_clock_indicator: ^1.0.0
```
Then, run:
```bash
flutter pub get
```
## Usage

### Important 📝

You **must provide size constraints** to the `AnimatedClockIndicator` widget using `SizedBox`, `Container`, or any other widget that provides size constraints to ensure proper rendering.

## Basic Usage


```dart
const SizedBox(
width: 20.0,
height: 20.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions(),
),
),
```
## Customized Clock Indicator

```dart
const SizedBox(
width: 30.0,
height: 30.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions(
borderWidth: 3.0,
minuteHandWidth: 2.0,
hourHandWidth: 2.5,
handInset: 2.5,
clockHandsLengthRatio: 0.618, // Golden ratio for harmonious proportions
minuteHandRotationDuration: Duration(milliseconds: 800),
minuteToHourRotationRatio: 12.0,
borderColor: Colors.orange,
minuteHandColor: Colors.deepOrange,
hourHandColor: Colors.orangeAccent,
),
),
),
```
## Uniform Color Clock Indicator

```dart
const SizedBox(
width: 40.0,
height: 40.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions.withUniformColor(
color: Colors.blue, // Applies the same color to all parts
borderWidth: 3.0,
minuteHandWidth: 2.0,
hourHandWidth: 2.5,
handInset: 2.5,
minuteHandRotationDuration: Duration(milliseconds: 800),
),
),
),
```
## Custom Color Clock Indicator

```dart
SizedBox(
width: 50.0,
height: 50.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions.withCustomColor(
borderColor: Colors.red.shade700,
minuteHandColor: const Color(0xFF42A5F5),
hourHandColor: Colors.green,
borderWidth: 3.5,
minuteHandWidth: 2.5,
hourHandWidth: 3.0,
handInset: 3.0,
minuteHandRotationDuration: Duration(milliseconds: 700),
),
),
),

```
## Clock Indicator without Hour Hand

```dart
SizedBox(
width: 70.0,
height: 70.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions(
borderWidth: 5.0,
minuteHandWidth: 4.0,
hourHandWidth: 0.0, // Setting to zero hides the hour hand
handInset: 4.5,
clockHandsLengthRatio: 0.0, // Setting to zero hides the hour hand
minuteHandRotationDuration: Duration(milliseconds: 400),
minuteToHourRotationRatio: 12.0,
borderColor: Colors.green,
minuteHandColor: Colors.lightGreen,
hourHandColor: Colors.greenAccent,
),
),
),
```
## Large Clock Indicator

```dart
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
```
## Customization Options ✨

You can customize various aspects of the `AnimatedClockIndicator` by providing an instance of `AnimatedClockIndicatorOptions`.

### Properties

- **`borderWidth`** *(double)*: The thickness of the clock's border in logical pixels.
- **`minuteHandWidth`** *(double)*: The thickness of the minute hand.
- **`hourHandWidth`** *(double)*: The thickness of the hour hand.
- **`handInset`** *(double)*: The distance from the edge of the clock to the tip of the hands.
- **`clockHandsLengthRatio`** *(double)*: The ratio of the hour hand length to the minute hand length (`0 < ratio ≤ 1`).
- **`minuteHandRotationDuration`** *(Duration)*: The duration for the minute hand to complete one full rotation.
- **`minuteToHourRotationRatio`** *(double)*: The ratio between the rotation speeds of the minute and hour hands.
- **`borderColor`** *(Color)*: The color of the clock's border.
- **`minuteHandColor`** *(Color)*: The color of the minute hand.
- **`hourHandColor`** *(Color)*: The color of the hour hand.

### Constructors

- **`AnimatedClockIndicatorOptions()`**: Default constructor with optional parameters.
- **`AnimatedClockIndicatorOptions.withUniformColor({Color color, ...})`**: Applies the same color to the border, minute hand, and hour hand.
- **`AnimatedClockIndicatorOptions.withCustomColor({Color borderColor, Color minuteHandColor, Color hourHandColor, ...})`**: Allows you to specify custom colors for each part of the clock.


## Example App

You can find a full example of how to use the AnimatedClockIndicator below. This example reflects the result shown in the GIF above and demonstrates the flexibility of the widget, including hiding the hour hand.

```dart
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

              // Custom AnimatedClockIndicator with specific properties.
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

              // AnimatedClockIndicator using withUniformColor constructor.
              const SizedBox(
                width: 40.0,
                height: 40.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions.withUniformColor(
                    color: Colors.blue,
                    borderWidth: 3.0,
                    minuteHandWidth: 2.0,
                    hourHandWidth: 2.5,
                    handInset: 2.5,
                    minuteHandRotationDuration: Duration(milliseconds: 800),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // AnimatedClockIndicator with custom colors.
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions.withCustomColor(
                    borderColor: Colors.red.shade700,
                    minuteHandColor: const Color(0xFF42A5F5),
                    hourHandColor: Colors.green,
                    borderWidth: 3.5,
                    minuteHandWidth: 2.5,
                    hourHandWidth: 3.0,
                    handInset: 3.0,
                    minuteHandRotationDuration: const Duration(milliseconds: 700),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // AnimatedClockIndicator without hour hand.
              SizedBox(
                width: 70.0,
                height: 70.0,
                child: AnimatedClockIndicator(
                  options: AnimatedClockIndicatorOptions(
                    borderWidth: 5.0,
                    minuteHandWidth: 4.0,
                    hourHandWidth: 0.0,
                    // Setting to zero hides the hour hand
                    handInset: 4.5,
                    clockHandsLengthRatio: 0.0,
                    // Setting to zero hides the hour hand
                    minuteHandRotationDuration: const Duration(milliseconds: 400),
                    minuteToHourRotationRatio: 12.0,
                    borderColor: Colors.green,
                    minuteHandColor: Colors.lightGreen,
                    hourHandColor: Colors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Large AnimatedClockIndicator.
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
```
## Contributions and Issues

Contributions are welcome! If you encounter any issues or have suggestions, please file an issue or submit a pull request.
## License

[MIT License](https://opensource.org/licenses/MIT)
