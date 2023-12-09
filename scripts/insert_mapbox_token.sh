token="$(cat ~/.mapbox 2>/dev/null)"
if [ "$token" ]; then
  plutil -replace MBXAccessToken -string $token "$TARGET_BUILD_DIR/$INFOPLIST_PATH"
else
  echo 'warning: Missing Mapbox access token'
  echo "warning: Get an access token from <https://account.mapbox.com/access-tokens/>, then create a new file at ~/.mapbox that contains the access token."
  exit 1
fi