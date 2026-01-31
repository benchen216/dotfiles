# ========== macOS 特定軟體版本 ==========
# 注意：這些路徑會因為 Homebrew 版本而改變
# 使用條件判斷來檢查是否存在

# Java (OpenJDK)
# 優先順序：openjdk@25 > openjdk@17 > 系統預設
if [ -d "/opt/homebrew/opt/openjdk@25" ]; then
  export PATH="/opt/homebrew/opt/openjdk@25/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@25/include"
  export JAVA_HOME="/opt/homebrew/opt/openjdk@25"
elif [ -d "/opt/homebrew/opt/openjdk@17" ]; then
  export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
  export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
elif [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

# MySQL
# 優先檢查 mysql@8.4，如果沒有則嘗試其他版本
if [ -d "/opt/homebrew/opt/mysql@8.4" ]; then
  export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/mysql@8.4/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.4/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.4/lib/pkgconfig"
elif [ -d "/opt/homebrew/opt/mysql@8.0" ]; then
  export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
elif [ -d "/opt/homebrew/opt/mysql" ]; then
  export PATH="/opt/homebrew/opt/mysql/bin:$PATH"
fi

# FreeTDS & OpenSSL (for database connectivity)
if [ -d "/opt/homebrew/opt/freetds" ]; then
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/freetds/lib"
  export CFLAGS="-I/opt/homebrew/opt/freetds/include"
fi

if [ -d "/opt/homebrew/opt/openssl@3" ]; then
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include"
fi

# Flutter (如果有安裝)
if [ -d "$HOME/development/flutter" ]; then
  export PATH="$PATH:$HOME/development/flutter/bin"
fi

# Google Cloud SDK (如果有安裝)
if [ -f "$HOME/development/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/development/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/development/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/development/google-cloud-sdk/completion.zsh.inc"
fi

# Windsurf
if [ -d "$HOME/.codeium/windsurf/bin" ]; then
  export PATH="$HOME/.codeium/windsurf/bin:$PATH"
fi

# Claude Code
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000

# 自定義別名 (macOS 特定)
alias senv="source $HOME/sdd.os/.venv/bin/activate"
