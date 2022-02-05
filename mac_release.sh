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
flutter build ipa --release --build-number="$1" --dart-define=FLAVOR=dev
zip -r "$NAME".zip "$NAME"

open ./build/ios/archive/Runner.xcarchive