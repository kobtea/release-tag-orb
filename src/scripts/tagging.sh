version=${INPUT_PREFIX}$({ $INPUT_ONLY_MAJOR_VERSION && (cut -d. -f1 VERSION) } || cat VERSION)${INPUT_SUFFIX}
message=${INPUT_MESSAGE//__VERSION__/$version}
git config user.name  || git config --local user.name  "$(git log -1 --pretty=format:'%an')"
git config user.email || git config --local user.email "$(git log -1 --pretty=format:'%ae')"
if $INPUT_FORCE; then
    git tag -af "$version" -m "$message" && git push -f origin "$version"
else
    git ls-remote --exit-code --tags origin "$version" > /dev/null 2>&1 || (git tag -a "$version" -m "$message" && git push origin "$version")
fi
