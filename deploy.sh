#!/usr/bin/env sh

# 確保腳本拋出遇到的錯誤
set -e

# 生成靜態文件
npm run build

# 進入生成的文件夾
cd docs/.vuepress/dist

# 如果是發佈到自定義域名
# echo 'www.zhangyunchen.cc' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果你想要部署到 https://<USERNAME>.github.io
git push -f git@github.com:tclung/tclung.github.io.git master

# 如果發佈到 https://<USERNAME>.github.io/<REPO>  REPO=github上的項目
# git push -f git@github.com:<USERNAME>/vuepress.git master:gh-pages

cd -
