# Web3 Global Hackathon 2023 AW (マツダ株式会社向け）
楽しいドライブはメンテナンスから。  
車のメンテナンスをNFTで楽しく。  
車のメンテナンスにNFTを利用することにより、車のメンテナンスにより興味を持ってもらえるようにする。また、車のメンテナンス情報をブロックチェーンにて管理し誰もが参照できるようになる。  
今後のV2X等による通信でのNFTの利用などへの応用も広がると考えられ、その例を示した。  

# ファイル
contractsフォルダーにスマートコントラクトのソース（Solidity)   
clitentフォルダーにDAppのhtmlファイル  
が入っている。  

# デモ
スマートコントラクトはAstarのテストネットzKatanaネットにデプロイした。  
zKatanaネットにメタマスクが接続している状態で以下にアクセスすると利用可能。  
https://eiden.tv/nft/index.html  

# 利用方法（デモ）
“Connect　Wallet“ボタンを押し、成功するとアドレスが正常に表示される。  
”My NFT”ボタンは、zKatana上の全てのNFTを検索しておらず、今回デプロイしたスマートコントラクト上のNFTしか表示しない。（今回のDAppからNFT発行されていない場合は何も表示されない）  
Vehicle numberとして、10,11,20,30のいずれかの数字を入力して”Meintenance”ボタンを押すと、Addressに関わらず、その車に関するメンテナンス情報（NFT）が表示される。  
メニューバーの”Maintenance”のページは許可された管理者以外のオペレーションはエラーとなる。  

# 資料
プレゼンテーション資料  
https://github.com/EidenSato/web3mazda/blob/main/web3_hackathon_presentation_20231108.pdf  
 
# Author
* 佐藤　総一(Soichi Sato)  
* 営電株式会社　第二技術部(Eiden Co.,Ltd.)  
* soichi@eiden-gp.co.jp  
 
# License 
Copyright (c) 2023 Eiden Co.Ltd.   


