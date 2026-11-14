#!/usr/bin/env bash
set -e

echo "1/4 安装 Capacitor 依赖..."
npm install

echo "2/4 生成 Android 原生工程..."
if [ ! -d "android" ]; then
  npx cap add android
fi
npx cap sync android

echo "3/4 替换应用图标与版本配置..."
rm -rf android/app/src/main/res/mipmap-anydpi-v26
cp -r res/mipmap-* android/app/src/main/res/
sed -i.bak 's/versionCode 1/versionCode 1/' android/app/build.gradle && rm -f android/app/build.gradle.bak
sed -i.bak 's/versionName "1.0"/versionName "1.0.0"/' android/app/build.gradle && rm -f android/app/build.gradle.bak

echo "4/4 使用 Gradle 编译 Debug APK..."
cd android
chmod +x gradlew
./gradlew assembleDebug

echo ""
echo "打包完成！APK 路径："
echo "android/app/build/outputs/apk/debug/app-debug.apk"
