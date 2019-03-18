#!/bin/sh

set -e

[ -z "${GITHUB_TOKEN}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.name calumabarnett
git config --global user.email calum.barnett@digital.justice.gov.uk

git clone -b gh-pages \
  https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m "Travis CI: updated book"
git push -q origin gh-pages
