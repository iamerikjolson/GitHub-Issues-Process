echo ''
echo 'This script will remove the GitHub default labels and create the 80|20 process labels for your repo. A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix

# Create state labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-analysis","color":"dd7404"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-ready","color":"ec9f04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-test-failing","color":"f5ba04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-in-development","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-code-review","color":"b3bb02"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-feature-testing","color":"59a901"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"state-integration-testing","color":"009800"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# Create priority labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority-high","color":"0AFF2F"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority-med","color":"85FF97"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority-low","color":"ADFFBA"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# Create type labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"type-bug","color":"b60205"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"type-documentation","color":"2740a1"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"type-enhancement","color":"5b2a68"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# Create flag labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-requirement","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-device-specific","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-duplicate","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-help-wanted","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-invalid","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-trash","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"flag-wontfix","color":"006b75"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
