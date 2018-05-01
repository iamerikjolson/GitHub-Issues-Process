echo ''
echo 'This script will create the Array Digital process issues. A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

#create state labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"In Analysis","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
