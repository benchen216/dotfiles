# ========== Docker 別名 ==========
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dstop='docker stop $(docker ps -q)'
alias dclean='docker system prune -af'

# Docker Compose
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dclog='docker-compose logs -f'
alias dcrestart='docker-compose restart'

# ========== Maven 別名 ==========
alias mvnc='mvn clean'
alias mvni='mvn install'
alias mvnci='mvn clean install'
alias mvncs='mvn clean install -DskipTests'
alias mvnt='mvn test'
alias mvnbdd='mvn test -Dtest=RunCucumberTest -Dcucumber.filter.tags="not @ignore" -pl aicrm-main-parent/main-service-management'
alias mvnboot='mvn spring-boot:run'
alias mvnwip='mvn test -Dtest=RunCucumberTest -Dcucumber.filter.tags="@wip" -pl aicrm-main-parent/main-service-management -T8'

# ========== Git 別名 ==========
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate --all'
alias gclean='git clean -fd'

# ========== 分支查看 ==========
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gbv='git branch -v'
alias gbvv='git branch -vv'

# ========== 分支切換 ==========
alias gsw='git switch'
alias gswm='git switch main'
alias gswma='git switch master'
alias gswd='git switch dev'
alias gsw-='git switch -'

# ========== 建立並切換 ==========
alias gcb='git checkout -b'
alias gswc='git switch -c'

# ========== 分支管理 ==========
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbm='git branch -m'
alias gbprune='git remote prune origin'

# ========== 分支合併 ==========
alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/main'

# ========== 遠端分支操作 ==========
alias gpso='git push origin'
alias gpsoc='git push origin $(git branch --show-current)'
alias gpull='git pull'
alias gf='git fetch'
alias gfa='git fetch --all'

# ========== 測試相關 ==========
alias testexe='pytest tests/features/executors/test_executor.py::TestJsonTestCaseBasedCodeGenerator::test_all_json_cases -v'
