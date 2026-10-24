# Yourtube - keep serialization models
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.**
-keep,includedescriptorclasses class com.app.yourtube.**$$serializer { *; }
-keep class com.app.yourtube.data.remote.dto.** { *; }
-keepclassmembers @kotlinx.serialization.Serializable class com.app.yourtube.** { *** Companion; }
-keepclasseswithmembers class com.app.yourtube.** { kotlinx.serialization.KSerializer serializer(...); }
# Dipanggil lewat refleksi (ClientHeaders.extractorUserAgent): jangan di-rename/dibuang oleh R8.
-keepclassmembers class org.schabi.newpipe.extractor.services.youtube.YoutubeParsingHelper { public static java.lang.String get*UserAgent(...); }

# NewPipeExtractor di build release (R8): tanpa aturan ini ekstraksi gagal atau build berhenti karena kelas Rhino/JSR-223 yang tak ada.
# Pola "x waktu lalu" dimuat lewat refleksi berdasarkan nama kelas.
-keep class org.schabi.newpipe.extractor.timeago.patterns.** { *; }
-keep class org.mozilla.javascript.** { *; }
-keep class org.mozilla.classfile.ClassFileWriter
-dontwarn org.mozilla.javascript.JavaToJSONConverters
-dontwarn org.mozilla.javascript.tools.**
-dontwarn javax.script.**
-dontwarn jdk.dynalink.**
-dontwarn com.google.protobuf.**
