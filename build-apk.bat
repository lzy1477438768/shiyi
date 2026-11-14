@echo off
chcp 65001 >nul
echo 1/4 安装 Capacitor 依赖...
call npm install || goto :error

echo 2/4 生成 Android 原生工程...
if not exist android (
  call npx cap add android || goto :error
)
call npx cap sync android || goto :error

echo 3/4 替换应用图标...
if exist android\app\src\main\res\mipmap-anydpi-v26 rmdir /S /Q android\app\src\main\res\mipmap-anydpi-v26
xcopy /E /I /Y res\mipmap-* android\app\src\main\res\ >nul

echo 4/4 使用 Gradle 编译 Debug APK...
cd android
call gradlew.bat assembleDebug || goto :error

echo.
echo 打包完成！APK 路径：
echo android\app\build\outputs\apk\debug\app-debug.apk
pause
exit /b 0

:error
echo 打包过程中出现错误，请确认已安装 Node.js 18+、JDK 17 与 Android SDK。
pause
exit /b 1
