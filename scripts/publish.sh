#!/bin/bash

# Push a version update commit with this message
MESSAGE=$(git log --oneline -n1)

TARGET_DIR=$(mktemp -d)
DIST_DIR=dist
HEAD_VERSION=$(git rev-parse HEAD)
DEFAULT_CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CURRENT_BRANCH=${TRAVIS_BRANCH:-$DEFAULT_CURRENT_BRANCH}
TARGET_REPO=https://supersonic-backdoor:$SUPERSONIC_BOWER_SECRET_KEY@github.com/AppGyver/supersonic-bower.git

echo Publishing branch $CURRENT_BRANCH version $HEAD_VERSION with message $MESSAGE

# Build distributable
grunt build

# Clone target repo
echo Cloning supersonic-bower to $TARGET_DIR
git clone $TARGET_REPO $TARGET_DIR > /dev/null
(cd $TARGET_DIR ; git config user.email "richard.anderson+supersonic@appgyver.com" ; git config user.name "Richard Anderson")

echo Updating branch $CURRENT_BRANCH in target repository
(
  # Check out the announced branch
  cd $TARGET_DIR && \
  (
    git checkout -b $CURRENT_BRANCH || \
    git checkout $CURRENT_BRANCH
  )
) && \
(
  # Copy distribution artefacts to target bower repo
  rm -rf $TARGET_DIR/* && \
  cp -r $DIST_DIR/* $TARGET_DIR && \
  cp bower.json $TARGET_DIR && \
  cp README.bower.md $TARGET_DIR/README.md
) && \
(
  # Commit changes to build artefacts
  cd $TARGET_DIR && \
  git add -A && \
  git commit -m $MESSAGE && \
  (
    # If the announced branch name looks like a semver tag, tag and push only the tag
    [[ $CURRENT_BRANCH =~ ^v[0-9]\.[0-9]\.[0-9] ]] && \
      git tag $CURRENT_BRANCH && \
      git push origin --force --tags > /dev/null
  ) || \
  (
    # Otherwise push under the announced branch name
    git push origin --force $CURRENT_BRANCH > /dev/null
  )
)

# Clean up
echo Cleaning up
rm -rf $TARGET_DIR
echo Done!
