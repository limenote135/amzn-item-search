NAME=symbols_$1

if [ "$1" = "" ]; then
  echo "ERROR: Specify build number at arg 1."
  exit 1
fi

rm ios/Podfile.lock
rm -rf ios/Pods
flutter clean
rm -rf "$NAME"
rm "$NAME".zip
arch -x86_64 pod repo update

flutter pub get

pushd ios
arch -x86_64 pod install
popd

flutter build ipa --release --build-number="$1" --dart-define=FLAVOR=prod
zip -r "$NAME".zip "$NAME"

mv build/ios/ipa/アマサーチ.ipa build/ios/ipa/amasearch.ipa
open build/ios/ipa
