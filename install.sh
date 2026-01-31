#!/bin/bash

# ========================================
# Dotfiles 安裝腳本
# 支援 macOS 和 Linux
# ========================================

set -e

# 顏色輸出
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

echo_warn() {
  echo -e "${YELLOW}[WARN]${NC} $1"
}

echo_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# 檢測作業系統
detect_os() {
  case "$(uname -s)" in
    Darwin)
      OS="macos"
      ;;
    Linux)
      OS="linux"
      ;;
    *)
      echo_error "不支援的作業系統: $(uname -s)"
      exit 1
      ;;
  esac
  echo_info "檢測到作業系統: $OS"
}

# 備份現有檔案
backup_file() {
  local file=$1
  if [ -f "$file" ] || [ -L "$file" ]; then
    local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
    echo_warn "備份現有檔案: $file -> $backup"
    mv "$file" "$backup"
  fi
}

# 創建 symlink
create_symlink() {
  local source=$1
  local target=$2

  # 備份現有檔案
  backup_file "$target"

  # 創建 symlink
  echo_info "創建 symlink: $target -> $source"
  ln -s "$source" "$target"
}

# 主要安裝流程
main() {
  echo_info "開始安裝 dotfiles..."

  detect_os

  # Zsh 配置
  echo_info "設定 Zsh..."
  create_symlink "$HOME/dotfiles/zsh/zshrc" "$HOME/.zshrc"

  # 創建 local.zsh（如果不存在）
  if [ ! -f "$HOME/dotfiles/zsh/local.zsh" ]; then
    echo_info "創建 local.zsh 範例檔案..."
    cp "$HOME/dotfiles/zsh/local.zsh.example" "$HOME/dotfiles/zsh/local.zsh"
    echo_warn "請編輯 ~/dotfiles/zsh/local.zsh 加入本機特定設定"
  fi

  # 可以在這裡加入其他配置檔案的 symlink
  # 例如：git, vim, tmux 等

  echo_info "✓ 安裝完成！"
  echo_info "請執行以下命令重新載入 shell："
  echo_info "  source ~/.zshrc"
  echo ""
  echo_warn "記得編輯 ~/dotfiles/zsh/local.zsh 加入本機特定設定"
}

main "$@"
