package examples.users;

import com.intuit.karate.junit5.Karate;

class UiTestRunner {

    @Karate.Test
    Karate testAll() {
        // این دستور تمام فایل‌های .feature در همین پکیج را اجرا می‌کند
        return Karate.run().relativeTo(getClass());
    }

    // شما می‌توانید متدهای دیگری برای اجرای یک فایل خاص هم اضافه کنید
    // @Karate.Test
    // Karate testSpecificFeature() {
    //     return Karate.run("ui").relativeTo(getClass());
    // }
}