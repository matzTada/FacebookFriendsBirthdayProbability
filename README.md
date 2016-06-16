#FacebookBirthdayProbability(Beta)
In English and 日本語  
Facebookに何人友達がいたら毎日誕生日通知が来るのか問題  
よく「同じ誕生日の人がいる確率」というのありますが，今回は「全ての誕生日が誰かしらの誕生日」である確率を考えます．  

結果だけ先に書くとこんな感じです  

式  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula1.png" alt=""></a>  
結果  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/facebookBirthday.png" alt=""></a>  

つまり1,000,000人友達を作れば9割(ぐらい)の確率で毎日誕生日通知が来るわけです．    

数学も英語も素人なので間違ってたら教えてください．

## Problem
だんだん数学の問題にしていきます．  

Facebookで何人友達がいたら，毎日誕生日通知が来るのか  
→N人友達がいるときに，365日すべてにおいて少なくとも1人の友人の誕生日がある確率は?  
→365種類(誕生日)の中から重複を許してN個(人)を選ぶ時，すべての種類(誕生日)を少なくとも1個(人)以上選ぶ確率   

実はFacebookは関係ありませんな．  


## Basic  
今回は「重複組み合わせ([Wikipedia](https://ja.wikipedia.org/wiki/%E9%87%8D%E8%A4%87%E7%B5%84%E5%90%88%E3%81%9B))」という概念を使うことにしました．  
日本だと大学受験でほぼ必修（のはずだ!）ですよね．  
名前の通り[高校数学の美しい物語](http://mathtrain.jp/tyohukuc)さんが分かりやすい解説してるので，大学入試が控えてる方はこちらもどうぞ．  
そもそもの組み合わせに関しては「組合せ(数学)[Wikipedia](https://ja.wikipedia.org/wiki/%E7%B5%84%E5%90%88%E3%81%9B_(%E6%95%B0%E5%AD%A6))]をどうぞ

以下では表記の関係上，最もポピュラー(ってWikipediaに書いてあった)な表現方法で書きます．それぞれ以下の通りです．    

「n個の中からk個選ぶ場合の数(組み合わせ)」  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula2.png" alt=""></a>  

「m種類の中から重複を許してr個を選ぶ場合の数(組み合わせ)」  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula3.png" alt=""></a>  

## Formula
実はProblemとBasicを組み合わせるだけで解けます．何なら習って1日目で解けますな．  

全ての場合の数Aは
「365種類(誕生日)の中から重複を許してN個(人)を選ぶ場合の数(組み合わせ)」  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula4.png" alt=""></a>  

毎日誰かしらの誕生日である場合の数Bは  
「先に365種類に対して1個ずつ割り当てておく(誰かしらが必ず誕生日)．そのあとで余った人を重複を許して割り振る」ので  
「365種類(誕生日)の中から重複を許してN-365個(人)を選ぶ場合の数(組み合わせ)」  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula5.png" alt=""></a>  

よって，求める「Facebookで何人友達がいたら，毎日誕生日通知が来るのか」もとい  
「365種類(誕生日)の中から重複を許してN個(人)を選ぶ時，すべての種類(誕生日)を少なくとも1個(人)以上選ぶ確率P」は  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/formula6.png" alt=""></a>  
と求まるわけです．

## Result
で？って言われると思うので，一応ExcelとProcessing(Javaベース)で数値的に計算を行いました．  
が，しかし，N=800を越したぐらいで，どちらも許容範囲を超えてしまったようです．Processingではちょっと頑張ってみたりしたんですが，それでも足りなかったです．  

ということで，伝家の宝刀Mathematicaを使いました．  
式は非常にシンプルです．さすが．便利．  
```
Plot[Binomial[n - 1, n - 365] / Binomial[365 + n - 1, n], {n, 365, 
  5000000}]
```  

グラフ  
<a><img src="https://raw.githubusercontent.com/matzTada/FacebookFriendsBirthdayProbability/master/image/facebookBirthday.png" alt=""></a>  

以上です．おしまいおしまい．  
グラフを見ると(ちゃんと計算しろ)だいたい1,000,000人を超えると，確率が0.9を超えるみたいです．  
筆者の現状の人数では2.23×10のマイナス101乗でした．ほぼゼロですね．  

Excelファイル，Processingプログラム，Mathematicaノートブック全てこのディレクトリにあります．  
うん，なんというか，数式をするのも含めて，いろいろ練習段階って感じですが，最後まで読んでいただいてありがとうございました．