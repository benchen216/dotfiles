# ========== Zsh 基本設定 ==========

# 固定 zcompdump 檔案路徑（避免產生多個快取檔案）
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Set editor default keymap to emacs
bindkey -e

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# ========== Zsh-autosuggestions ==========
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# ========== Zsh-syntax-highlighting ==========
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ========== Locale 設定 ==========
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
