# 时毅 — Android APK 打包工程

- 应用名称：时毅
- 包名 (Application ID)：com.shiyi.yijing
- 版本号：1.0.0 (versionCode: 1)
- 屏幕方向：竖屏锁定

---

## 方式一：GitHub 云端自动生成 APK（无需本地安装 Android Studio）

1. 在 GitHub 新建一个仓库（公开或私有均可）。
2. 将本压缩包内的所有文件（注意包含隐藏目录 `.github/`）上传并推送到仓库的 `main` 分支。
3. 打开仓库顶部的 **Actions** 页面，等待约 2 分钟，`Build Android APK` 任务完成后，在底部 **Artifacts** 即可直接下载 `时毅-debug-apk`（内含可安装的 `app-debug.apk`）。

---

## 方式二：本机命令行一键打包 APK

需提前安装：Node.js 18+、JDK 17、Android SDK（或 Android Studio）。

- **macOS / Linux**：
  ```bash
  chmod +x build-apk.sh
  ./build-apk.sh
  ```
- **Windows**：
  双击或命令行运行 `build-apk.bat`。

编译成功后，APK 输出在：
`android/app/build/outputs/apk/debug/app-debug.apk`

---

## 方式三：导入 Android Studio 生成正式签名 Release APK

1. 执行 `npm install && npx cap add android && npx cap sync android`
2. 删除 `android/app/src/main/res/mipmap-anydpi-v26` 并将 `res/mipmap-*` 复制到 `android/app/src/main/res/`
3. 执行 `npx cap open android` 在 Android Studio 中打开工程
4. 菜单栏选择 **Build -> Generate Signed Bundle / APK -> APK**，创建或选择 keystore 签名即可发布正式版 APK。
