---
title: 使用 VuePress 架設個人部落格
sidebar: auto
sidebarDepth: 2
---

# 使用 VuePress 架設個人部落格

::: tip 提示
有閱讀障礙的同學，可以跳過第一至四節，下載我寫好的[工具包](https://github.com/tclung/vuepressBlog.git): 
`git clone https://github.com/tclung/vuepressBlog.git` 然後從第五節開始看。
:::

## 一、為什麼你需要一個部落格？
優秀的資訊人員都在寫部落格，寫部落格有很多好處：
- 幫助自己梳理、總結、理解知識點（個人提升）
- 幫助別人理解知識點（好人一生平安）
- 簡歷更好看，更多面試機會（升職加薪）

## 二、什麼是 VuePress，為什麼要使用 VuePress ？
**VuePress** 是尤雨溪（vue.js 框架作者）4月12日發佈的一個全新的基於 vue 的靜態網站生成器，實際上就是一個 vue 的 spa 應用，內置 webpack，可以用來寫文檔。詳見 [VuePress中文網](https://vuepress.docschina.org/)

其實類似的建站工具有很多，比如 WordPress、Jekyll、Hexo 等，其中 WordPress 需要自己購買虛擬主機，不考慮；Jekyll 是 Github-Page 默認支持的，聽說操作比較複雜，沒有用過不做過多評價了；Hexo 讓人一直覺得主題不好看，風格不夠簡潔優雅。自從遇見 VuePress，嗯，就是它了~ 

VuePress 有很多優點：
- 界面簡潔優雅（個人感覺比 HEXO 好看）
- 容易上手（半小時能搭好整個項目）
- 更好的兼容、擴展 Markdown 語法
- 響應式佈局，PC端、手機端
- Google Analytics 集成
- 支持 PWA

## 三、開始架設

### 創建項目文件夾
可以右鍵手動新建，也可以使用 mkdir 命令新建：

    mkdir vuepressBlogDemo

### 全局安裝 VuePress

    npm install -g vuepress

### 進入 vuepressBlogDemo 文件夾，初始化項目
使用 `npm init` 或 `npm init -y`（默認yes）

    npm init -y

### 創建文件夾和文件
在 vuepressBlogDemo 文件夾中創建 docs 文件夾，在 docs 中創建 .vuepress 文件夾，在.vuepress中創建 public 文件夾和 config.js 文件，最終項目結構如下所示：

    vuepressBlogDemo
    ├─── docs
    │   ├── README.md
    │   └── .vuepress
    │       ├── public
    │       └── config.js
    └── package.json

### 在 config.js 文件中配置網站標題、描述、主題等信息

```js
module.exports = {
  title: 'Chen\'s blog',
  description: '我的個人網站',
  head: [ // 注入到當前頁面的 HTML <head> 中的標籤
    ['link', { rel: 'icon', href: '/logo.jpg' }], // 增加一個自定義的 favicon(網頁標籤的圖標)
  ],
  base: '/', // 這是部署到github相關的配置
  markdown: {
    lineNumbers: false // 代碼塊顯示行號
  },
  themeConfig: {
    nav:[ // 導航欄配置
      {text: '前端基礎', link: '/accumulate/' },
      {text: '算法題庫', link: '/algorithm/'},
      {text: '微博', link: 'https://baidu.com'}      
    ],
    sidebar: 'auto', // 側邊欄配置
    sidebarDepth: 2, // 側邊欄顯示2級
  }
};
```

### 在 package.json 文件裡添加兩個啟動命令
```json
"scripts": {
  "dev": "vuepress dev docs",
  "build": "vuepress build docs"
}
```

### 一切就緒 :tada: 跑起來看看吧

    npm run dev

## 四、一些小亮點
完成了基礎架設後，就可以在docs目錄下新建 `.md` 文件寫文章了（.md 是 Markdown 語法文件，你需要知道 Markdown 的一些基本寫法，很簡單，這裡給大家一份 [Markdown 語法整理大集合](https://www.jianshu.com/p/b03a8d7b1719)）

下面給大家安利一些實用的方法。

### 代碼塊高亮
在 .md 文件中書寫代碼時，可在 \`\`\` 後增加 js、html、json等格式類型，代碼塊即可按照指定類型高亮

代碼：

<pre class="language-text"><code>``` js
export default {
  data () {
    return {
      msg: 'Highlighted!'
    }
  }
}
```</code></pre>

效果：
``` js
export default {
  data () {
    return {
      msg: 'Highlighted!'
    }
  }
}
```

### 自定義容器

代碼：

    ::: tip 提示
    this is a tip
    :::

    ::: warning 注意
    this is a tip
    :::

    ::: danger 警告
    this is a tip
    :::

效果：
::: tip 提示
this is a tip
:::

::: warning 注意
this is a tip
:::

::: danger 警告
this is a tip
:::

### 支持 Emoji
代碼：

    :tada: :100: :bamboo: :gift_heart: :fire:

效果：
:tada: :100: :bamboo: :gift_heart: :fire:

:point_right: 這裡有一份 [Emoji 大全](https://www.webpagefx.com/tools/emoji-cheat-sheet/) 

### 支持 PWA
VuePress 默認支持 [PWA](https://segmentfault.com/a/1190000012353473)，配置方法如下：

config.js 文件中增加

```js
head: [ // 注入到當前頁面的 HTML <head> 中的標籤
  ['link', { rel: 'manifest', href: '/photo.jpg' }],
  ['link', { rel: 'apple-touch-icon', href: '/photo.jpg' }],
],
serviceWorker: true // 是否開啟 PWA
```

public 文件夾下新建 manifest.json 文件，添加

```json
{
  "name": "張三",
  "short_name": "張三",
  "start_url": "index.html",
  "display": "standalone",
  "background_color": "#2196f3",
  "description": "張三的個人主頁",
  "theme_color": "blue",
  "icons": [
    {
      "src": "./photo.jpg",
      "sizes": "144x144",
      "type": "image/png"
    }
  ],
  "related_applications": [
    {
      "platform": "web"
    },
    {
      "platform": "play",
      "url": "https://play.google.com/store/apps/details?id=cheeaun.hackerweb"
    }
  ]
}
```

最後在 iPhone 的 safrai 瀏覽器中打開本網站，點擊 `+添加到主屏幕` 就能在桌面看到一個像原生 App 一樣的圖標（感覺自己寫了一個 App 有木有 :smile:）

## 五、部署上線
說了這麼多都是在本地進行的，現在我們要把本地的內容推送到某個服務器上，這樣只要有網絡，就可以隨時隨地看自己的網站了。

一般來說，有兩種方案可供選擇：
1. 自己買一個服務器，阿里雲、騰訊雲等，這種方式的好處是速度有保證、可以被搜索引擎收錄，壞處是要花錢啊 :moneybag: 土豪同學可以考慮。
2. 使用 [Github Pages](https://pages.github.com/) 。什麼是 Github Pages 呢？簡單說就是 Github 提供的、用於架設個人網站的靜態站點托管服務。很多人用它架設個人部落格。這種方式的好處是免費、方便，壞處是速度可能會有些慢、不能被國內的搜索引擎收錄。

最終我選擇了方案2，下面將給大家講解如何使用 Github Pages 服務。

### 登陸 [Github](https://github.com/) 
打開 github 網站，登陸自己的 github 賬號（沒有賬號的快去註冊並面壁思過作為一個優秀的資訊人員為啥連一個github賬號都沒有）

接著我們新建兩個倉庫：

### 新建倉庫一： USERNAME.github.io （不用克隆到本地）

<b>！！！注意：USERNAME 必須是你 Github 的賬號名稱，不是你的名字拼音，也不是你的非主流網名，不要瞎起，要保證和Github賬號名一模一樣！</b>

例如我的 Github 賬號名稱是 zhangyunchencc

![](/images/eg13.png)

那麼新建倉庫，Repository name 就填寫為：zhangyunchencc.github.io

![](/images/eg14.png)

<b>這個倉庫建好後，不用克隆到本地，內容更新修改都在倉庫二中進行。</b>

### 新建倉庫二：隨便起一個名字，比如：vuepressBlog （克隆到本地）

這個項目是用來開發部落格的，以後只需要改這個項目就夠了。

- 使用工具包的，將 [vuepress-devkit](https://github.com/zhangyunchencc/vuepress-devkit.git) 中的內容拷貝到 vuepressBlog 文件夾中

- 自己從頭架設的，將 vuepressBlogDemo 文件夾的內容拷貝到倉庫二，並在根目錄下創建 deploy.sh 文件，內容如下：

```sh
#!/usr/bin/env sh

# 確保腳本拋出遇到的錯誤
set -e

# 生成靜態文件
npm run build

# 進入生成的文件夾
cd docs/.vuepress/dist

# 如果是發佈到自定義域名
# echo 'www.yourwebsite.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果你想要部署到 https://USERNAME.github.io
git push -f git@github.com:USERNAME/USERNAME.github.io.git master

# 如果發佈到 https://USERNAME.github.io/<REPO>  REPO=github上的項目
# git push -f git@github.com:USERNAME/<REPO>.git master:gh-pages

cd -
```

### 修改倉庫二中的 deploy.sh 發佈腳本

把文件中的 USERNAME 改成 Github 賬號名，例如我的賬號名是 zhangyunchencc，那麼就可以改為：

```sh
# 如果你想要部署到 https://USERNAME.github.io
git push -f git@github.com:zhangyunchencc/zhangyunchencc.github.io.git master
```

這樣倉庫二和倉庫一就建立了關聯。

簡單說二者的關係是：倉庫一負責顯示網站內容，我們不需要改動它；日常開發和新增內容，都在倉庫二中，並通過 npm run deploy 命令，將代碼發佈到倉庫一。


### 在 package.json 文件夾中添加發佈命令（使用工具包的請忽略）

``` json
"scripts": {
  "deploy": "bash deploy.sh"
}
```

### :clap: 大功告成，運行發佈命令

    npm run deploy

此時打開 Github Settings 中下面的鏈接: [https://zhangyunchencc.github.io/](https://zhangyunchencc.github.io/) 即可看到自己的主頁啦~

![](/images/eg2.png)

#### PC 端頁面是這樣的：
![](/images/eg3.png)

#### 手機端頁面是這樣的：
![](/images/eg4.png=200x)
<img src="/images/eg4.png" style="width: 50%; display: block; margin: 0 auto;">

可以看到導航欄變成了左上角的小圖標，可以打開和收起。

## 六、發佈到自己的個人域名
如果你不滿足於 https://zhangyunchencc.github.io/ 這樣的域名，想要一個自己個人的專屬域名，比如 http://www.zhangyunchen.cc/ ，畢竟一些大牛（阮一峰 [http://www.ruanyifeng.com/blog/](http://www.ruanyifeng.com/blog/)） 都是自己名字的網址哦，很方便很酷呢 😎 

下面跟著步驟一步步來就好啦~

### 購買域名
推薦在 [新網](http://www.xinnet.com/domain/domain.html) 或 [萬網](https://wanwang.aliyun.com/) 購買。

我是在新網購買的，下面以新網為例，萬網是類似的。

購買完成後進入管理後台，點擊 」解析「 按鈕，添加下面兩條內容：
![](/images/eg5.png)

![](/images/eg6.png)

::: warning 注意！這裡有坑：
在 萬網 購買域名的同學請注意，第二條記錄中的 * 請用 @ 代替，萬網不支持 *
:::

記錄值裡的 IP 可以通過 ping Github 的域名得到：

    ping www.username.github.io

### 修改倉庫二中的 deploy.sh 文件

將倉庫二中的 deploy.sh 文件的第 13 行反註釋掉，並填上自己的域名，deploy.sh 文件的最終版：

```sh
#!/usr/bin/env sh

# 確保腳本拋出遇到的錯誤
set -e

# 生成靜態文件
npm run build

# 進入生成的文件夾
cd docs/.vuepress/dist

# 如果是發佈到自定義域名
echo 'www.zhangyunchen.cc' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果你想要部署到 https://<USERNAME>.github.io
git push -f git@github.com:zhangyunchencc/zhangyunchencc.github.io.git master

# 如果發佈到 https://<USERNAME>.github.io/<REPO>  REPO=github上的項目
# git push -f git@github.com:<USERNAME>/vuepress.git master:gh-pages

cd -

```

此時，我們運行 npm run deploy 即可發佈到自己的專屬域名啦~

### :clap: 大功告成，打開 [https://www.zhangyunchen.cc](https://www.zhangyunchen.cc) 看一下吧~~~

擁有自己專屬域名的個人部落格感覺很酷哦~

寫一些文章，記錄一點生活，把自己的網站發給同學朋友看看吧！ :sunglasses:

## 七、最後
- 你需要一些 [Markdown](https://www.jianshu.com/p/b03a8d7b1719) 語法的基礎知識；
- 你需要一個 [Github](https://github.com/) 賬號，並在裡面創建兩個 repo；
- Github 需要添加 ssh key，第一次使用的同學遇到問題可以百度解決；
- 個人部落格不只可以用來寫技術相關的內容，也可以有自己寫的文章、隨筆，甚至上傳一些照片。

我的 [vuepress-devkit](https://github.com/zhangyunchencc/vuepress-devkit.git) 已經開源放在了 Github 上，還有很多想要增加的功能，例如添加評論模塊、自動生成側邊欄目錄、增加網站分析工具等等，在這裡歡迎大家 Star 或者 Fork 。

以上，


張韻晨 | Front End Engineer | 2018.10


