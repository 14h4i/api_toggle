# ApiToggle

------

[![Pub](https://img.shields.io/pub/v/api_toggle.svg)](https://pub.dev/packages/api_toggle)

API toggle widget - it helps not to call the API multiple times when repeatedly clicking on a widget.

## Usage 
Find the example wiring in the [example app](https://github.com/14h4i/api_toggle/blob/master/example/lib/main.dart)
### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  api_toggle: ^1.0.0
```

Add the following import to your Dart code:

```dart
import 'package:api_toggle/api_toggle.dart';
```


### Api Toggle Widget


```dart
ApiToggle(
  activated: isActivated,
  delay: 1000,
  disabledChild: const Icon(
    Icons.favorite,
    color: Colors.grey,
    size: 100,
  ),
  enabledChild: const Icon(
    Icons.favorite,
    color: Colors.redAccent,
    size: 100,
  ),
  onTrigger: (activated) {
    if (activated) {
      // write functions call API
      setState(() {
        callApiCount = callApiCount + 1;
      });
    }
  },
  onTap: (activated) {
    // write other functions that are not API calls
    setState(() {
      heartCount = activated ? heartCount + 1 : heartCount - 1;
      isActivated = activated;
    });
  },
);
```


## ScreenShots

> ### Android
| <img src="https://raw.githubusercontent.com/14h4i/api_toggle/master/screenshots/demo.gif" width="360" /> 
| :------------:




## Issues and feedback

Please file [issues](https://github.com/14h4i/api_toggle/issues) to send feedback or report a bug. Thank you!


## License

[MIT](https://mit-license.org) License

<a href="https://www.buymeacoffee.com/14h4i" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

