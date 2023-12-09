token="$(cat "$SRCROOT/scripts/.apikey" 2>/dev/null)"
if [ "$token" ]; then
  plutil -replace ZTMAPIKey -string $token "$TARGET_BUILD_DIR/$INFOPLIST_PATH"
else
  echo 'warning: Missing ZTM API key'
  echo "warning: Get an API key from <http://api.um.warszawa.pl>, then create a new file at scripts/.apikey that contains the API key."
  exit 1
fi