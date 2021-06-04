# iOS での配布用パッケージの作成

`flutter build ipa --release --build-number=<build number>` でアーカイブする

`/build/ios/archive/Runner.xcarchive` が作られるので、これをダブルクリックする。

xcode が立ち上がって、Archives 画面が出てくるので、今作った奴を選択し、 `Distribute App` を選択する。

Firebase で配布する場合は AdHoc を選ぶ。

`Ad Hoc distribution options` 画面では `Rebuild from Bitcode` のチェックを *外す* こと。

外さないと、Clashlytics のログが難読化されているらしい？

`App Thinning` はよくわからないけれど、`All compatible device variants` を選んでおく。

`Re-sign "Runner"` 画面では `Automatically manege signing` にしておくと、
Apple サーバーから必要なものを自動でダウンロードしてくれる模様。

その後、Export を選ぶと作成したものがエクスポートされるので、ipa ファイルを Firebase にアップロードすればよい。

ダウンロードする人を追加する場合は、利用者にデバイス登録してもらったのち、アーカイブをダブルクリックするところからもう１回やる。

# iOS のシミュレータでアプリ内購入をテストする方法

Android Studio や flutter コマンドからは実行できないらしく、xcode からアプリを起動する必要がある。

`open ios/Runner.xcworkspace` で xcode を起動する。

タイトルバーの位置にある `Runner > iPhone 12 pro Max` (後ろの機種名はシミュレーターや実機の名前)をクリックして、
`Manage schemas` を選ぶ。

`Runner` の schema を選び、左下の Edit を選ぶ。

`Run` の設定の Options タブで、`StoreKit Configuration` で作成済みの storekit ファイルを選択する。

`Close` ボタンで設定を完了し、`Product` メニューの `Run` でアプリを起動する。

日本設定にはならない？ようで、US 用のタイトルや説明しか表示できない模様？