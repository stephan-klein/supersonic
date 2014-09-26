#!/bin/bash

# Push a version update commit with this message
VERSION=$(git rev-parse HEAD)

TMP_DIR=tmp
ARTEFACTS_DIR=tmp/artefacts
TARGET_DIR=tmp/target

HEAD_VERSION=$(git rev-parse HEAD)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
SOURCE_REPO=https://supersonic-backdoor:103944e9fd881b4de88536ab5529a30c387a93bd@github.com/AppGyver/supersonic.git#$HEAD_VERSION
TARGET_REPO=https://supersonic-backdoor:103944e9fd881b4de88536ab5529a30c387a93bd@github.com/AppGyver/supersonic-bower.git

# Install supersonic from current revision to temp dir
echo Installing $SOURCE_REPO to $ARTEFACTS_DIR
mkdir -p $ARTEFACTS_DIR
(cd $ARTEFACTS_DIR ; bower install $SOURCE_REPO)

# Clone target repo
echo Cloning $TARGET_REPO to $TARGET_DIR
rm -rf $TARGET_DIR
git clone $TARGET_REPO $TARGET_DIR
(cd $TARGET_DIR ; git config user.email "richard.anderson+supersonic@appgyver.com" ; git config user.name "Richard Anderson")

# Copy bower-installed supersonic artefacts to target bower repo
# Tag and push repo
echo Updating branch $CURRENT_BRANCH in target repository
(cd $TARGET_DIR && (git checkout -b $CURRENT_BRANCH || git checkout $CURRENT_BRANCH)) && \
(rm -rf $TARGET_DIR/* && cp -r $ARTEFACTS_DIR/bower_components/supersonic/* $TARGET_DIR) && \
(cd $TARGET_DIR && \
  git add -A && \
  git commit -m $VERSION && \
  git push origin -f $CURRENT_BRANCH)

# Clean up
echo Cleaning up
rm -rf $TMP_DIR/*
echo Done!
