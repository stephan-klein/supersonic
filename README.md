SUPERSONIC
==========

<iframe width="420" height="315" src="//www.youtube.com/embed/kKO9h-gG4Qg" frameborder="0" allowfullscreen></iframe>

[![Build Status](http://img.shields.io/travis/AppGyver/supersonic/master.svg)](https://travis-ci.org/AppGyver/supersonic)
[![Dependency Status](http://img.shields.io/david/AppGyver/supersonic.svg)](https://david-dm.org/AppGyver/supersonic)
[![Coverage Status](https://img.shields.io/coveralls/AppGyver/supersonic.svg)](https://coveralls.io/r/AppGyver/supersonic)

Supersonic library. CSS forked from [Ionic](https://github.com/driftyco/ionic/), with love.

## Development

Getting started:

    npm install

Running tests:

    grunt test

For a test-and-watch-for-changes loop, use:

    grunt dev

## Publishing to bower

Compile source to a Browserified Javascript bundle and add changes to git:

    grunt build && git commit -am "update dist"

Update version tags in:

    package.json
    bower.json

Tag git version:

    git commit -m "x.y.z" && git tag "vx.y.z"

Publish:

    git push origin master --tags
