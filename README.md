# 📱 Flutter M3 Widget Showcase  

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Android Studio](https://img.shields.io/badge/android%20studio-346ac1?style=for-the-badge&logo=android%20studio&logoColor=white)





A **Flutter** application designed to demonstrate **Material 3 (M3) Components** with an interactive UI. This project showcases various **Flutter Widgets** while implementing **State Management** using `Riverpod`. It serves as a reference for UI components and state-handling practices in Flutter, making it an excellent resource for recruiters evaluating Flutter expertise.  

---

## 🚀 Features  

- **Material 3 (M3) Component Showcase** – Demonstrates modern UI components from [M3 Material Design](https://m3.material.io/components).  
- **State Management with Riverpod** – Implements **theme switching** and **counter state management** using Riverpod.  
- **Clean and Scalable Project Structure** – Organized using `config`, `presentation`, and `widgets` layers.  
- **Routing with GoRouter** – Handles navigation efficiently.  
- **Dark Mode Support** – Dynamic **light/dark theme** switching using a provider.  
- **Custom Side Menu** – A visually appealing **navigation drawer** for easy access to screens.  

---

## 📂 Project Structure  

```
---
...
lib/ 
  │── config/ # Application-level configurations 
  │ ├─ menu/ # Menu-related configurations 
  │ ├─ router/ # Handles app navigation (GoRouter)
  │ ├─ theme/ # App theme settings
  │── presentation/ # UI logic and state management
  │ ├── providers/ # Riverpod state providers 
  │ ├── screens/ # Various UI component demonstrations 
  │ │── widgets/ # Reusable UI components 
  │ ├── side_menu/ # Custom side navigation menu 
  │ │── main.dart # Entry point of the app
...
---
```

## 🎨 Screens & Demonstrations  

### ✅ **Material 3 Components Covered**
- **Buttons** (Elevated, Text, Icon, FloatingActionButton)
- **Snackbars** (Persistent and Temporary)
- **Cards** (Custom & Adaptive)
- **Progress Indicators** (Linear, Circular)
- **Theme Changer** (Light/Dark Mode)
- **Infinite Scroll Implementation**
- **Animated UI Elements**  

### 🔧 **State Management**
- **Counter Screen** – Simple `Riverpod` implementation for state updates.  
- **Theme Switching** – Using `Riverpod` for persistent theme changes.  

---

## 🛠️ Installation  

1️⃣ **Clone the repository**  
```sh
git clone https://github.com/yourusername/flutter-m3-showcase.git
cd flutter-m3-showcase

