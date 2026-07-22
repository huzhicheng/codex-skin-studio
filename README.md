# Codex Skin Studio

[中文](README.md) · [English](README.en.md)

给 macOS Codex 桌面应用换上由本地图片或 MP4 驱动的完整界面皮肤。它会统一处理左侧导航、标题栏、工作区、卡片、输入区、菜单、设置页和弹窗，而不是在每个区域重复平铺一张壁纸。

<p align="center">
  <video src="https://github.com/user-attachments/assets/95fe8248-2b05-43fa-a326-4b05a29722eb" width="60%" autoplay muted loop playsinline controls></video>
  <br>
  <em>“彩色” · 一段完整界面巡览：首页 → 皮肤管理 → 站点 → 已安排 → 插件</em>
</p>

> [!IMPORTANT]
> 这是非 OpenAI 官方项目。目前仅支持 macOS 与签名有效的 Codex 桌面应用（bundle id：`com.openai.codex`）。项目不会修改 Codex 应用包、`app.asar`、代码签名或 `~/.codex/config.toml`。

## 效果预览

皮肤可以使用静态图片，也可以使用本地循环 MP4。背景媒体始终保持原始色调；界面色板、层次、控件形态和可读性由 Skin Studio 单独处理。以下均为真实保存的本机皮肤。

### 视频主题（本地 MP4 · 界面实时动态）

预览为高清循环动图。

<table>
  <tr>
    <td width="50%" align="center"><img src="docs/images/地球.webp" width="100%" alt="地球"><br><b>地球</b></td>
    <td width="50%" align="center"><img src="docs/images/猫咪.webp" width="100%" alt="猫咪"><br><b>猫咪</b></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/清冷.webp" width="100%" alt="清冷"><br><b>清冷</b></td>
    <td align="center"><img src="docs/images/山谷.webp" width="100%" alt="山谷"><br><b>山谷</b></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/浪花.webp" width="100%" alt="浪花"><br><b>浪花</b></td>
    <td align="center"><img src="docs/images/旷野.webp" width="100%" alt="旷野"><br><b>旷野</b></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/发光刀刃.webp" width="100%" alt="发光刀刃"><br><b>发光刀刃</b></td>
    <td align="center"><img src="docs/images/伏提庚.webp" width="100%" alt="伏提庚"><br><b>伏提庚</b></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/古风美女.webp" width="100%" alt="古风美女"><br><b>古风美女</b></td>
  
  </tr>

</table>

### 图片主题（高清静态截图）

<table>
  <tr>
    <td colspan="2" align="center"><img src="docs/images/户外.webp" width="80%" alt="户外"><br><b>户外</b></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="docs/images/小野花.webp" width="100%" alt="小野花"><br><b>小野花</b></td>
    <td width="50%" align="center"><img src="docs/images/毛绒.webp" width="100%" alt="毛绒"><br><b>毛绒</b></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/绿感.webp" width="100%" alt="绿感"><br><b>绿感</b></td>
    <td align="center"><img src="docs/images/鸣人.webp" width="100%" alt="鸣人"><br><b>鸣人</b></td>
  </tr>
</table>

![Codex Skin Studio 皮肤管理器](docs/images/skin-manager.webp)

截图来自真实保存的本地皮肤，仅用于展示界面效果；仓库不包含截图中的原始主题图片或视频。

## 主要能力

- 一张图片或一个 MP4 覆盖整个 Codex 窗口，自动 `cover` 铺满并支持焦点位置、透明度、内容清晰度和模糊调节。
- 原生风格的“皮肤”侧栏入口，以及应用内的保存、切换、重命名、删除和暂停管理。
- **内敛**、**灵动**和 Skill 生成的 **AI 设计**三种界面语言。
- 从媒体提取可访问的界面色板，但不对背景媒体做增艳、变色、黑白、双色或电影调色。
- “设计UI”会根据当前图片或 MP4 封面帧生成受约束的结构化 Open 方案，可独立设计导航节奏、标题、首页构图、卡片和按钮。
- 自动适配 Codex 的浅色/深色状态，并保护导航图标、文字、发送/停止按钮的对比度。
- Codex 更新后的兼容性预检、异常回滚、视频封面回退和一键恢复官方界面。

## 安装

### ⭐ 最省事：让你的 AI 帮你装（推荐，不用懂命令行）

你既然在用 Codex 或 Claude Code，那最简单的装法就是把下面这句话，**直接发给它**：

> 帮我安装 github.com/huzhicheng/codex-skin-studio 这个 skill

它会自动装好，并在你的**桌面**放三个中文入口：「Codex皮肤 - 启动」「Codex皮肤 - 一键启动」「Codex皮肤 - 恢复官方」。装完，把 Codex 完全退出、重新打开一次，就能用了。

万一装完桌面没出现那三个入口，就再对它说一句：「用 codex-skin-studio 安装桌面启动器」。

### 或者：下载后双击安装

1. 在本页面点绿色的 **Code → Download ZIP**，下载后解压。
2. 打开解压出来的文件夹，**右键**点里面的 `Install Codex Skin Studio.command`，选「打开」。
3. 它会自动装好、并在桌面建好入口。装完把 Codex 重新打开一次即可。

（macOS 第一次打开这个文件，可能提示"来源不明"，右键选「打开」就行，不用关任何安全设置。）

### 熟悉终端的话

```bash
git clone https://github.com/huzhicheng/codex-skin-studio.git
cd codex-skin-studio
./install.sh
```

重复运行 `./install.sh` 就是升级，不会删掉你已经保存的皮肤。

## 第一次使用

最简单的方式是对 Codex 说：

> 使用 codex-skin-studio 启动皮肤管理器。

也可以双击桌面入口：

- `Codex皮肤 - 启动.command`：按需启动；如确实需要重启，会先询问。
- `Codex皮肤 - 一键启动.command`：用户主动双击后允许完成一次启动切换。
- `Codex皮肤 - 恢复官方.command`：清除皮肤并以官方方式正常重启 Codex。

启动成功后，“皮肤”会出现在 Codex 主侧栏动作区。接下来的典型流程是：

1. 点击“皮肤”，选择一张图片或一个 MP4。
2. 调整媒体焦点，让人物或主体保持在合适位置。
3. 在 **内敛**、**灵动**之间即时切换。
4. 想要当前媒体专属的界面语言时，选择生成胆量并点击 **设计UI**。
5. 生成完成后切换到 **AI 设计**；不满意可以重新生成，或随时退回自动的灵动模板。

## 面板和 Skill 分别做什么

应用内面板负责高频、可视化操作：导入媒体、切换皮肤、调整强度、删除主题和恢复外观。

`codex-skin-studio` Skill 负责需要推理或系统边界的工作：首次安装、兼容性诊断、安全启动、异常恢复，以及读取当前媒体后生成符合结构化安全约束的独立 UI 设计。换一张图片后再次点击“设计UI”，得到的是属于这张图片的新方案，不是固定模板换色。

## 界面风格

- **内敛**：保留 Codex 原生控件比例，用主题色和半透明材质统一全窗口。
- **灵动**：自动 Open 模板，会改变首页、导航选中态、按钮、卡片和输入区的表现。
- **AI 设计**：由 Skill 为当前媒体生成的独立结构化方案；生成前不可选，生成后会和当前皮肤一起保存。
- **生成胆量**：沉稳、奔放、疯狂只影响下一次“设计UI”的结构大胆程度，不会改变原图色调。

## 常用命令

```bash
SKILL_ROOT="${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio"

/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" doctor
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" install-launchers
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" start
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" status
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" restore
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" restore --restart
```

## 恢复与卸载

只恢复官方界面、不重启 Codex：

```bash
/bin/bash "${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio/scripts/skin-studio.sh" restore
```

完全恢复并正常重启：

```bash
/bin/bash "${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio/scripts/skin-studio.sh" restore --restart
```

卸载 Skill 和桌面入口，但保留本地主题：

```bash
./uninstall.sh
```

同时删除本地主题和日志：

```bash
./uninstall.sh --restart --purge-data
```

## 常见问题

### 安装后没有“皮肤”入口

先重启一次 Codex 让 Skill 被发现，然后双击 `Codex皮肤 - 一键启动.command`，或运行 `doctor` 后再执行 `start`。如果纯净启动正常而皮肤启动失败，Skin Studio 会回滚注入并保持 Codex 可用，不会自动反复重启。

### Codex 升级后界面卡住或入口消失

先执行 `doctor` 和 `status`。选择器不兼容时项目会失败关闭，不会扩大匹配范围或修改应用包。可先执行 `restore` 使用官方界面，再更新 Skin Studio。

### 图片没有铺满，或人物太大

背景默认使用整窗 `cover`，不会为了显示完整图片而缩小留边。使用管理器里的焦点位置保护主体；横竖比差异很大时，窗口边缘会按 `cover` 规则裁切。

### MP4 无法播放

视频解码或播放失败只影响视觉层，Skin Studio 会保留本地提取的封面帧；异常不会触发 Codex 重启。

### 深浅色切换后文字或停止按钮看不清

从 v0.16.3 起，Skin Studio 会在 ChatGPT/Codex 工作区切换时重新校准皮肤变量，并单独保护导航文字、图标和发送/停止按钮的语义对比度。v0.16.4 进一步隔离头像菜单、设置页等原生弹层导航，避免皮肤装饰重绘阻塞界面。v0.16.5 适配新版合并式侧栏容器，并把启动健康检查改为有上限的连续稳定检查，避免一次短暂重绘误判后回滚成功注入。

## 隐私与安全

- 图片和 MP4 默认只保存在本机的 Skin Studio 数据中。
- 只有你主动点击 **设计UI** 时，当前图片或 MP4 的本地封面帧才会交给一次临时 Codex 设计请求；MP4 文件本身不会发送。
- 生成结果必须通过版本化结构化方案校验，不接受任意 CSS、HTML、JavaScript、URL、远程字体或 shell 命令。
- 调试端口只绑定 `127.0.0.1`，目标还必须通过 `app://` 与 Codex 壳层校验。
- 皮肤模式使用独立 Chromium 用户目录，不复制官方配置中的 Cookies、Local Storage、Preferences 或会话文件。
- 启动只有一次有界尝试；检查失败时回滚皮肤并保留 Codex，不进入自动重启循环。

完整边界见 [安全策略](SECURITY.md) 与 [运行时安全模型](skills/codex-skin-studio/references/security.md)。

## 许可

[MIT License](LICENSE)。本项目与 OpenAI 无隶属或背书关系。截图中的主题媒体不包含在软件发行包中。
