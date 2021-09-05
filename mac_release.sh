NAME=symbols_$1

rm ios/Podfile.lock
rm -rf ios/Pods
flutter clean
rm -rf "$NAME"
rm $NAME.zip
flutter build ipa --release --build-number=$1 --obfuscate --split-debug-info=$NAME
zip -r $NAME.zip "$NAME"

open ./build/ios/archive/Runner.xcarchive