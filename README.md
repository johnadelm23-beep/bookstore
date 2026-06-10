# 📚 Bookia - Book Store App

A modern **Flutter E-commerce Book Store Application** built with clean architecture and BLoC state management.  
Bookia allows users to browse books, manage cart, place orders, and track order history with a smooth and responsive UI.

---

## ✨ Features

- 📖 Browse books and featured collections  
- 🔍 View book details  
- 🛒 Add / remove items from cart  
- ➕ Increase / decrease product quantity  
- 💳 Checkout & place orders  
- 🏠 Select governorate dynamically from API  
- 📦 Order history tracking  
- ⚡ Smooth UI with responsive design  
- 🌐 REST API integration using Dio  
- 🧠 State management using BLoC / Cubit  
- 📱 Fully responsive using ScreenUtil  

---

## 🧱 Architecture

The project follows a **feature-based clean architecture structure**:

lib/
 ├── core/ 
 │    ├── theme/
 │    ├── widgets/
 │    └── helper/
 │
 ├── features/
 │    ├── auth/
 │    ├── home/
 │    ├── cart/
 │    ├── place_order/
 │    ├── order/
 │    └── profile/




Each feature contains:

data/   → Models + Repository  
cubit/  → State Management (Bloc/Cubit)  
ui/     → Screens + Widgets  

---

## 🛠️ Tech Stack

- Flutter 💙  
- Dart  
- BLoC / Cubit  
- Dio (Networking)  
- ScreenUtil (Responsive UI)  
- Lottie Animations  
- EasyLocalization (optional)  
- REST API  

---

## 🌐 API Integration

This app integrates with real backend APIs:

📦 Cart API  
- Add / remove items  
- Update quantity  

🧾 Checkout API  
- Fetch checkout summary  

🏁 Place Order API  
- Submit order with user data  

🗺️ Governorates API  
- Dynamic dropdown selection  

📜 Order History API  
- Fetch user orders list  

---

## 📸 Screenshots

 |  |   
---|---|---  
![home](https://github.com/user-attachments/assets/eb641ec4-67a1-49ad-9c39-1506820d82a0) | ![cart](https://github.com/user-attachments/assets/0fb97fc1-efc3-4392-9ca2-6d65b3d8cef9) | ![checkout](https://github.com/user-attachments/assets/735fe148-b35f-4fa7-a448-26917c88e709)

  |   
---|---  
![orders](https://github.com/user-attachments/assets/bb38ff4f-798c-418a-844c-c6dc33f109d7) | ![details](https://github.com/user-attachments/assets/3eab555c-0a85-4cc5-8f31-54f26f4080d0)

---

## 🚀 Getting Started

### Clone the repository
```bash
git clone https://github.com/your-username/bookia.git
cd bookia
