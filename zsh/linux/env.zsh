# ========== Linux 特定環境變數 ==========

# Homebrew on Linux (如果有安裝)
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Snap (如果使用 Ubuntu/Debian)
if [ -d "/snap/bin" ]; then
  export PATH="/snap/bin:$PATH"
fi
