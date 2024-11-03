# Animated Clock Indicator ⏰

## An animated clock indicator widget for Flutter, allowing you to display customizable clock animations in your app.

![Animated Clock Indicator](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2VtYnU1cG9pZjQwbnN3ZHVvbTNodnRkMTNjMnR2ZnNwZnd6cGJ6MCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/4TzmCUvqE7MnQtdFFj/giphy.gif)

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
animated_clock_indicator: ^1.0.3
```

Then, run:

```bash
flutter pub get
```

## Usage

### Important 📝

You **must provide size constraints** to the `AnimatedClockIndicator` widget
using `SizedBox`, `Container`, or any other widget that provides size constraints to ensure proper
rendering.

## Basic Usage

```dart
const SizedBox(
width: 80.0,
height: 80.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions(),
),
),
```

## Customized Clock Indicator

```dart
const SizedBox(
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
```

## Uniform Color Clock Indicator

```dart
const SizedBox(
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
```

## Custom Color Clock Indicator

```dart
const SizedBox(
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
```

## Clock Indicator without Hour Hand

```dart
const SizedBox(
width: 160.0,
height: 160.0,
child: AnimatedClockIndicator(
options: AnimatedClockIndicatorOptions(
borderWidth: 4.0,
minuteHandWidth: 3.0,
hourHandWidth: 3.0,
handInset: 4.0,
clockHandsLengthRatio: 0, // Only minute hand visible
minuteHandRotationDuration: Duration(milliseconds: 700),
borderColor: Colors.green,
minuteHandColor: Colors.lightGreen,
),
),
),
```

## Customization Options ✨

You can customize various aspects of the `AnimatedClockIndicator` by providing an instance
of `AnimatedClockIndicatorOptions`.

### Properties

- **`borderWidth`** *(double)*: The thickness of the clock's border in logical pixels.
- **`minuteHandWidth`** *(double)*: The thickness of the minute hand.
- **`hourHandWidth`** *(double)*: The thickness of the hour hand.
- **`handInset`** *(double)*: The distance from the edge of the clock to the tip of the hands.
- **`clockHandsLengthRatio`** *(double)*: The ratio of the hour hand length to the minute hand
  length (`0 < ratio ≤ 1`).
- **`minuteHandRotationDuration`** *(Duration)*: The duration for the minute hand to complete one
  full rotation.
- **`minuteToHourRotationRatio`** *(double)*: The ratio between the rotation speeds of the minute
  and hour hands.
- **`borderColor`** *(Color)*: The color of the clock's border.
- **`minuteHandColor`** *(Color)*: The color of the minute hand.
- **`hourHandColor`** *(Color)*: The color of the hour hand.
- **`minuteHandStrokeCap`** *(StrokeCap)*: The style of the minute hand's stroke cap (
  e.g., `StrokeCap.round`, `StrokeCap.square`, `StrokeCap.butt`).
- **`hourHandStrokeCap`** *(StrokeCap)*: The style of the hour hand’s stroke cap.

### Constructors

- **`AnimatedClockIndicatorOptions()`**: Default constructor with optional parameters.
- **`AnimatedClockIndicatorOptions.withUniformColor({Color color, ...})`**: Applies the same color to the border, minute hand, and hour hand.
- **`AnimatedClockIndicatorOptions.withCustomColor({Color borderColor, Color minuteHandColor, Color hourHandColor, ...})`**: Allows you to specify custom colors for each part of the clock individually.


## Example App

You can find a full example of how to use the AnimatedClockIndicator below. This example reflects
the result shown in the GIF above and demonstrates the flexibility of the widget, including hiding
the hour hand.

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
```

## Contributions and Issues

Contributions are welcome! If you encounter any issues or have suggestions, please file an issue or
submit a pull request.

## License

[MIT License](https://opensource.org/licenses/MIT)
