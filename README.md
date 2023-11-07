# Web3 Global Hackathon 2023 AW (マツダ株式会社向け）
任意のアドレスを指定して任意のメッセージを送れるwebアプリ。  
メッセージを送るごとに愛トークン（ポイント）が取得できるというゲーム性を持っているDAOツール。

# ファイル
contractsフォルダーにスマートコントラクトのソース（Solidity)    
clitentフォルダーにwebアプリのhtmlファイル等  
が入っています。

# デモ
スマートコントラクトはAstarのテストネットShibuyaネットにデプロイしています。  
Shibuyaネットにメタマスクが接続している状態で以下にアクセスすると利用可能です。  
誰でも利用できます。  
http://eidensato.html.xdomain.jp/hasoto/index.html

# 利用方法（デモ）
“Connect　Wallet“ボタンを押し、成功するとアドレスが正常に表示される。  
メッセージを送りたい人のアドレスとメッセージを直接入力しSendボタンを押すとメッセージが送られる。  
メッセージを送り終わると、画像が変わり画面トップにポイントが表示される。  
point確認ボタン、更新ボタンを押すと、それぞれ、ポイント、メッセージが最新の状態に更新される。  
メッセージの青丸は自分が相手に送ったメッセージ。黄丸は相手からもらったメッセージ。丸の中の数字が取得したポイント。

# 資料
プレゼンテーション資料  
https://github.com/EidenSato/web3toyota/blob/main/web3_slides.pdf  
詳細マニュアル  
https://github.com/EidenSato/web3toyota/blob/main/web3_hasoto.pdf
 
# プレゼンテーション資料の説明
* Page.1  
私たちは直接プロジェクトや人材を管理するものだけではなく、ウエルビーイングな環境を構築し  
コミュニケーションを活発化させるためのDAOツールも重要なのではと考え”無償の愛”という  
ツールを開発しました。  
* Page.2  
説明は省略しますが、資料にあるように、ウエルビーイングが充実している会社が成長する会社  
だと考えています。  
* Page.3  
アプリとしては単純でメッセージを送り合うだけのものになります。メッセージを送り合うと  
お互いにポイントが貯まるというゲーム性を持たせていて、あまりメッセージを送られない人  
に対してメッセージを送ったほうが高いポイントが得られます。あえてゲームとして認識して、  
普段話しかけない人にも、気軽にメッセージを送ってほしいです。例えば、毎月ポイントを集計  
して勝敗が決められますが、これもあくまでゲームとして楽しんでもらえればと思います。   
* Page.4  
なぜこのアプリでブロックチェーンを使う必要があるのかというと、本人が書いたことが証明され  
改ざんができないということと、データがオープンになるのでいたずらでメッセージを送るという  
ことができないだろうという心理を利用するためです。  
また、暗号資産同様に、ブロックチェーンで管理することにより、このようなメッセージの蓄積は  
新たな価値を創造するのではないかと期待しています。ブロックチェーンに記録されたデータは  
全てが会社の財産となるでしょう。  
* Page.5  
アプリの仕様としては、スマートコントラクトとしてはメッセージ等必要なものを保存、読込する  
だけの簡単なもので、ユーザーはwebアプリからこれらにアクセスしてブロックチェーンに書き込  
みます。とても簡単なものなのでブロックチェーンの基本を理解するのにも役立つと思います。  
現時点では、何も制約かけてないので、いろいろチート、つまりずるすることもできるのですが、  
あくまでゲームなので、チートの方法を考えることでブロックチェーンをより学べるかもしれません。  
webアプリ側で他部署あるいは、他社向けの物を作ったり、メッセージをAI解析して人事関係に生かす  
事もできるかもしれません。
 
# Author
* 佐藤　総一(Soichi Sato)
* 営電株式会社　第二技術部(Eiden Co.,Ltd.)
* soichi@eiden-gp.co.jp
 
# License 
Copyright (c) 2023 Soichi Sato  
"無償の愛" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).


