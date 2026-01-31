# Dotfiles

個人化的跨平台 shell 配置檔案，支援 macOS 和 Linux。

## 特色

- 🚀 **跨平台支援** - macOS 和 Linux 共用大部分配置
- 📦 **模組化設計** - 按功能分離配置檔案，易於維護
- 🔐 **安全** - 敏感資訊存放在 `local.zsh`（不會被 git 追蹤）
- 🎯 **版本靈活** - 自動偵測不同版本的軟體（Java, MySQL 等）
- ⚡ **效能優化** - 使用條件判斷，只載入存在的工具

## 目錄結構

```
dotfiles/
├── zsh/
│   ├── zshrc                  # 主配置檔案
│   ├── zim.zsh               # Zim 框架設定
│   ├── prompt.zsh            # 提示符設定 (Powerlevel10k)
│   ├── common/               # 跨平台共用配置
│   │   ├── aliases.zsh       # Git, Docker, Maven 別名
│   │   ├── settings.zsh      # Zsh 基本設定
│   │   └── tools.zsh         # 跨平台工具 (nvm, pyenv, bun)
│   ├── macos/                # macOS 特定配置
│   │   ├── env.zsh           # Homebrew, iTerm2 等
│   │   └── versions.zsh      # Java, MySQL 等版本設定
│   ├── linux/                # Linux 特定配置
│   │   ├── env.zsh           # Linux 環境變數
│   │   └── versions.zsh      # Linux 軟體版本
│   ├── local.zsh             # 本機特定設定（不追蹤）
│   └── local.zsh.example     # 範例檔案
├── install.sh                # 安裝腳本
├── .gitignore
└── README.md
```

## 安裝

### 首次安裝

```bash
# 1. Clone 這個 repo
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 2. 執行安裝腳本
chmod +x install.sh
./install.sh

# 3. 編輯本機特定設定
vim ~/dotfiles/zsh/local.zsh

# 4. 重新載入 shell
source ~/.zshrc
```

### 在新機器上安裝

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles && ./install.sh
source ~/.zshrc
```

## 本機特定設定

將不想提交到 git 的設定放在 `zsh/local.zsh`：

```bash
# 專案變數
export RLM_PROJECT="your-project"

# 機器特定路徑
export CUSTOM_PATH="/path/to/something"

# 不同的軟體版本
export JAVA_HOME="/custom/java/path"

# API Keys（絕對不要提交）
export OPENAI_API_KEY="sk-..."
```

## 軟體版本處理

配置檔案會自動偵測不同版本的軟體：

### Java
- macOS: 自動選擇 `openjdk@25` > `openjdk@17` > 系統預設
- Linux: 使用 SDKMAN 或系統預設

### MySQL
- macOS: 自動選擇 `mysql@8.4` > `mysql@8.0` > `mysql`
- Linux: 使用系統套件

### 其他工具
- **nvm**: 自動初始化（跨平台）
- **pyenv**: 自動初始化（跨平台）
- **bun**: 自動偵測並載入

如果你的機器使用不同版本，在 `local.zsh` 中覆蓋即可。

## 包含的別名

### Docker
- `d`, `dc`, `dps`, `di`, `dex`, `dlog`
- `dcup`, `dcdown`, `dclog`, `dcrestart`

### Git
- 基本：`g`, `gs`, `ga`, `gc`, `gp`, `gpl`
- 分支：`gb`, `gba`, `gco`, `gsw`, `gswm`
- 合併：`gm`, `gma`, `gmom`

### Maven
- `mvnc`, `mvni`, `mvnci`, `mvncs`, `mvnt`, `mvnboot`

完整列表請見 `zsh/common/aliases.zsh`。

## 更新

```bash
cd ~/dotfiles
git pull
source ~/.zshrc
```

## 自訂

- **新增別名**: 編輯 `zsh/common/aliases.zsh`
- **調整設定**: 編輯 `zsh/common/settings.zsh`
- **平台特定**: 編輯 `zsh/macos/` 或 `zsh/linux/`
- **本機專用**: 編輯 `zsh/local.zsh`

## 備份

安裝腳本會自動備份現有的 `.zshrc`：
```
~/.zshrc.backup.YYYYMMDD_HHMMSS
```

## License

MIT
