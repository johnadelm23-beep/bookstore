# 📚 Bookia - Book Store App

A modern **Flutter E-commerce Book Store Application** built with clean architecture and BLoC state management.  
Bookia allows users to browse books, manage cart, place orders, and track order history with a smooth and responsive UI.

---

## ✨ Features

- 📖 Browse books and featured collections  
- 🔍 View detailed product pages  
- 🛒 Add / remove items from cart  
- ➕ Increase / decrease product quantity  
- 💳 Checkout & place orders  
- 🏠 Select governorate dynamically from API  
- 📦 Order history tracking  
- 🔐 Authentication support (if integrated)  
- ⚡ Clean UI with smooth animations  
- 🌐 API integration using Dio  
- 🧠 State management using BLoC / Cubit  

---

## 🧱 Architecture

This project follows **Clean Architecture (Feature-first structure)**:
lib/
├── core/
├── features/
│ ├── cart/
│ ├── home/
│ ├── auth/
│ ├── place_order/
│ ├── order/
│ └── profile/


Each feature contains:
- data (models + repo)
- cubit (state management)
- ui (screens + widgets)

---

## 🛠️ Tech Stack

- Flutter 💙
- Dart
- BLoC / Cubit
- Dio (API calls)
- ScreenUtil (responsive UI)
- EasyLocalization (multi-language support)
- Lottie animations
- REST API integration

---

## 🌐 API Integration

The app integrates with:

- 📦 Cart API  
- 🧾 Checkout API  
- 🏁 Place Order API  
- 🗺️ Governorates API  
- 📜 Order History API  

Example response:

```json
{
  "data": {
    "orders": [
      {
        "id": 51,
        "order_code": "00051",
        "order_date": "2023-08-14",
        "status": "New",
        "total": "130.51"
      }
    ]
  }
}

📸 Screenshots
Home	Cart	Checkout

	
	
Order History	Details

🚀 Getting Started
1. Clone the repository
git clone https://github.com/your-username/bookia.git
cd bookia
2. Install dependencies
flutter pub get
3. Run the app
flutter run
📦 Dependencies
flutter_bloc: ^8.1.3
dio: ^5.4.0
flutter_screenutil: ^5.9.0
easy_localization: ^3.0.3
lottie: ^3.0.0
iconly: ^1.0.1
📂 Project Structure
core/        → Shared widgets, helpers, theme
features/    → App modules (cart, order, auth...)
data/        → Models & repositories
cubit/       → State management
ui/          → Screens & widgets
🎯 Future Improvements
Payment gateway integration 💳
Push notifications 🔔
Admin dashboard 📊
Offline mode support 📱
Better caching system ⚡
👨‍💻 Developer

John Adel
Flutter Developer
📍 Egypt


