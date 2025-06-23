# 🎨 Common Components Documentation

## 📖 Overview

Common components được thiết kế để tái sử dụng across toàn bộ Weather App, đảm bảo consistency trong UI/UX và giảm code duplication.

## 🧩 Available Components

### 1. **CommonScaffold**
Enhanced Scaffold với các tính năng bổ sung.

```dart
CommonScaffold(
  hideKeyboardWhenTouchOutside: true,
  appBar: CommonAppBar(title: 'Title'),
  body: YourBodyWidget(),
  floatingActionButton: FloatingActionButton(...),
)
```

**Features:**
- Auto hide keyboard when tap outside
- Consistent background color handling
- Support cho tất cả Scaffold properties

### 2. **CommonAppBar**
Flexible AppBar với nhiều style options.

```dart
CommonAppBar(
  title: 'Settings',
  leadingIcon: LeadingIcon.back,
  appBarType: AppBarType.gradient,
  gradientColors: [Colors.blue, Colors.purple],
  actions: [IconButton(...)],
)
```

**Types:**
- `AppBarType.normal` - Standard AppBar
- `AppBarType.transparent` - Transparent background
- `AppBarType.gradient` - Gradient background

**Leading Icons:**
- `LeadingIcon.none` - No leading icon
- `LeadingIcon.back` - Back arrow
- `LeadingIcon.close` - Close X
- `LeadingIcon.menu` - Hamburger menu
- `LeadingIcon.custom` - Custom widget

### 3. **CommonDialog**
Cross-platform dialog với adaptive design.

```dart
// Info Dialog
CommonDialog.showInfo(
  context: context,
  title: 'Information',
  message: 'This is an info message',
  onOk: () => print('OK pressed'),
);

// Confirmation Dialog
final result = await CommonDialog.showConfirm(
  context: context,
  title: 'Confirm',
  message: 'Are you sure?',
);

// Delete Confirmation
final deleteConfirmed = await CommonDialog.showDelete(
  context: context,
  title: 'Delete Item',
  message: 'This action cannot be undone',
);
```

**Features:**
- Platform adaptive (Material/Cupertino)
- Pre-built helper methods
- Customizable button styles

### 4. **CommonButton**
Consistent button styling với multiple variants.

```dart
// Primary Button
CommonButton.primary(
  text: 'Save',
  onPressed: () => save(),
  size: ButtonSize.large,
  icon: Icon(Icons.save),
)

// Secondary Button
CommonButton.secondary(
  text: 'Cancel',
  onPressed: () => cancel(),
)

// Outlined Button
CommonButton.outlined(
  text: 'Learn More',
  onPressed: () => openLink(),
)

// Text Button
CommonButton.text(
  text: 'Skip',
  onPressed: () => skip(),
)
```

**Sizes:**
- `ButtonSize.small` - Height: 32px
- `ButtonSize.medium` - Height: 40px (default)
- `ButtonSize.large` - Height: 48px

**States:**
- Loading state với spinner
- Disabled state
- Icon support

### 5. **CommonTextField**
Enhanced TextField với built-in validation và formatting.

```dart
CommonTextField(
  labelText: 'Email',
  type: TextFieldType.email,
  isRequired: true,
  prefixIcon: Icon(Icons.email),
  validator: (value) => validateEmail(value),
  onChanged: (value) => handleEmailChange(value),
)

// Password Field
CommonTextField(
  labelText: 'Password',
  type: TextFieldType.password, // Auto toggle visibility
  isRequired: true,
)

// Multi-line Text
CommonTextField(
  labelText: 'Description',
  type: TextFieldType.multiline,
  maxLines: 4,
)
```

**Types:**
- `TextFieldType.text` - Standard text
- `TextFieldType.email` - Email input với keyboard
- `TextFieldType.password` - Password với visibility toggle
- `TextFieldType.number` - Number input only
- `TextFieldType.phone` - Phone number formatting
- `TextFieldType.url` - URL input
- `TextFieldType.multiline` - Multi-line text

### 6. **CommonLoadingWidget**
Loading indicators với customizable styling.

```dart
// Simple Loading
CommonLoadingWidget()

// Loading with Message
CommonLoadingWidget(
  message: 'Loading weather data...',
  size: 32,
)

// Full Screen Loading
CommonFullScreenLoading(
  message: 'Please wait...',
)

// Refresh Indicator
CommonRefreshIndicator(
  onRefresh: () => refreshData(),
  child: ListView(...),
)
```

### 7. **CommonErrorWidget**
Error displays với retry functionality.

```dart
// Basic Error
CommonErrorWidget(
  message: 'Something went wrong',
  onRetry: () => retry(),
)

// Network Error
CommonNetworkErrorWidget(
  onRetry: () => retryConnection(),
)

// Timeout Error
CommonTimeoutErrorWidget(
  onRetry: () => retryRequest(),
)
```

### 8. **CommonEmptyWidget**
Empty state displays.

```dart
// Basic Empty State
CommonEmptyWidget(
  message: 'No items found',
  icon: Icon(Icons.inbox_outlined),
)

// No Search Results
CommonNoSearchResultsWidget(
  searchQuery: 'weather',
  onClearSearch: () => clearSearch(),
)
```

### 9. **CommonCard**
Consistent card styling.

```dart
CommonCard(
  padding: EdgeInsets.all(16),
  onTap: () => handleTap(),
  child: Column(
    children: [
      Text('Title'),
      Text('Content'),
    ],
  ),
)
```

### 10. **CommonListTile**
Enhanced ListTile với consistent styling.

```dart
CommonListTile(
  leading: Icon(Icons.settings),
  title: Text('Settings'),
  subtitle: Text('App preferences'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () => openSettings(),
)
```

## 🎯 Usage in Screens

### WeatherScreen Example
```dart
@override
Widget buildPage(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  return CommonScaffold(
    hideKeyboardWhenTouchOutside: true,
    appBar: CommonAppBar(
      title: l10n.title,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => navigateToSettings(),
        ),
      ],
    ),
    body: Column(
      children: [
        CommonTextField(
          labelText: l10n.searchCity,
          type: TextFieldType.text,
          prefixIcon: Icon(Icons.location_city),
          onSubmitted: (value) => searchWeather(value),
        ),
        Expanded(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return state.when(
                loading: () => CommonLoadingWidget(
                  message: l10n.loading,
                ),
                loaded: (weather) => CommonCard(
                  child: WeatherInfoWidget(weather),
                ),
                error: (message) => CommonErrorWidget(
                  message: message,
                  onRetry: () => retryWeather(),
                ),
                initial: () => CommonEmptyWidget(
                  message: l10n.initialMessage,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
```

## 🎨 Theming & Customization

All common components respect Material Design 3 theming:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
  // Components will automatically use theme colors
)
```

## 📱 Platform Adaptivity

Components automatically adapt to platform:
- **Android**: Material Design components
- **iOS**: Cupertino-style dialogs and interactions
- **Adaptive**: Automatically chooses based on platform

## ✅ Best Practices

1. **Always use common components** instead of raw Flutter widgets
2. **Pass localized strings** to text properties
3. **Handle loading and error states** consistently
4. **Use semantic properties** for accessibility
5. **Follow Material Design 3 guidelines**

## 🔧 Extension Points

Easy to extend common components:

```dart
class CustomWeatherCard extends CommonCard {
  const CustomWeatherCard({
    required WeatherEntity weather,
    super.key,
  }) : super(
    padding: EdgeInsets.all(24),
    child: WeatherDisplay(weather),
  );
}
```

## 📊 Benefits

✅ **Consistency**: Uniform look and feel across app
✅ **Maintainability**: Single source of truth for styling
✅ **Productivity**: Faster development với pre-built components
✅ **Accessibility**: Built-in accessibility support
✅ **Theming**: Automatic theme adaptation
✅ **Platform Support**: Cross-platform compatibility
✅ **Localization**: Built-in i18n support

## 🚀 Getting Started

1. Import common components:
```dart
import '../../app.dart'; // Exports all common components
```

2. Replace existing widgets:
```dart
// Before
Scaffold(
  appBar: AppBar(title: Text('Title')),
  body: Container(...),
)

// After
CommonScaffold(
  appBar: CommonAppBar(title: 'Title'),
  body: Container(...),
)
```

3. Use throughout your app for consistency!
