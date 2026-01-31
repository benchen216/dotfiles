# ========== Linux 特定軟體版本 ==========

# Java (通常透過 SDKMAN 或系統套件管理)
# 檢查 SDKMAN
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# 如果沒有 SDKMAN，使用系統 Java
if [ -z "$JAVA_HOME" ] && command -v java >/dev/null 2>&1; then
  export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
fi

# MySQL client (通常透過系統套件管理安裝)
# 不需要特別設定路徑

# Flutter (如果有安裝)
if [ -d "$HOME/development/flutter" ]; then
  export PATH="$PATH:$HOME/development/flutter/bin"
fi

# Google Cloud SDK (如果有安裝)
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
