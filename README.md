# 📱 تطبيق اشربها - Ashrabha App

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

---

## 🎯 ما هو اشربها؟

**اشربها** تطبيق ذكي لتتبع شرب الماء والمشروبات الصحية، مصمم لمساعدتك على البقاء رطباً طوال اليوم.

---

## ✨ المميزات الرئيسية

### 📊 تتبع ذكي
- تتبع يومي لشرب الماء والمشروبات
- مؤشر دائري جميل يوضح تقدمك
- أزرار سريعة لإضافة كميات مختلفة

### 📈 إحصائيات متقدمة
- رسم بياني أسبوعي ملون
- إحصائيات يومية وشهرية
- ملخص الاستهلاك والأهداف

### ⚙️ قابل للتخصيص
- حدد هدفك اليومي المخصص
- اختر كميات الإضافة السريعة
- تخصيص الألوان والمظهر

### 💾 حفظ آمن
- حفظ محلي على الجهاز
- لا تحتاج إنترنت
- بيانات آمنة وخاصة

### 🌙 واجهة حديثة
- دعم الوضع الليلي والفاتح
- تصميم استجابي
- أيقونات وسيمات جميلة

---

## 🚀 البدء السريع

### المتطلبات
- Flutter 3.0+
- Dart 3.0+
- Android Studio أو VS Code

### التثبيت

```bash
# 1. Clone المستودع
git clone https://github.com/hassanwecare-maker/ashrabha-app.git
cd ashrabha-app

# 2. تثبيت المكتبات
flutter pub get

# 3. تشغيل التطبيق
flutter run
```

---

## 📁 البنية

```
lib/
├── models/              # نماذج البيانات
│   └── water_entry.dart
├── providers/           # إدارة الحالة
│   └── water_provider.dart
├── screens/             # الشاشات الرئيسية
│   ├── home_screen.dart
│   └── settings_screen.dart
├── widgets/             # الـ Widgets المخصصة
│   ├── water_tracker_widget.dart
│   ├── water_history_widget.dart
│   └── weekly_chart_widget.dart
└── main.dart            # نقطة البداية
```

---

## 🛠️ التكنولوجيا المستخدمة

| التقنية | الإصدار | الاستخدام |
|---------|---------|----------|
| Flutter | 3.0+ | إطار العمل |
| Dart | 3.0+ | لغة البرمجة |
| Provider | 6.0.0 | إدارة الحالة |
| SharedPreferences | 2.2.2 | تخزين البيانات |
| FL Chart | 0.65.0 | الرسوم البيانية |
| Intl | 0.19.0 | التنسيقات |

---

## 🤝 المساهمة

نرحب بمساهماتك! اتبع هذه الخطوات:

1. Fork المستودع
2. أنشئ فرع ميزة (`git checkout -b feature/amazing-feature`)
3. Commit التغييرات (`git commit -m 'إضافة: ميزة رائعة'`)
4. Push الفرع (`git push origin feature/amazing-feature`)
5. افتح Pull Request

اقرأ [CONTRIBUTING.md](CONTRIBUTING.md) للتفاصيل.

---

## 📋 قواعس السلوك

يرجى قراءة [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) قبل المساهمة.

---

## 📝 الترخيص

هذا المشروع مرخص تحت **MIT License** - اقرأ [LICENSE](LICENSE) للتفاصيل.

---

## 📞 التواصل

- 👤 **المطور:** Hassan Wecare
- 📧 **البريد:** hassan.wecare@gmail.com
- 🐙 **GitHub:** [@hassanwecare-maker](https://github.com/hassanwecare-maker)

---

## 🙏 شكراً!

شكراً لاستخدامك واهتمامك بمشروع **اشربها**!

**ابقَ رطباً! 💧**
