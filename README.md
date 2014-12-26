SUPERSONIC
==========

<iframe width="420" height="315" src="//www.youtube.com/embed/kKO9h-gG4Qg" frameborder="0" allowfullscreen></iframe>

[![Build Status](http://img.shields.io/travis/AppGyver/supersonic/master.svg)](https://travis-ci.org/AppGyver/supersonic)
[![Dependency Status](http://img.shields.io/david/AppGyver/supersonic.svg)](https://david-dm.org/AppGyver/supersonic)
[![Coverage Status](https://img.shields.io/coveralls/AppGyver/supersonic.svg)](https://coveralls.io/r/AppGyver/supersonic)

Supersonic HTML5 app development on [Steroids](http://www.appgyver.com/steroids). The CSS library is forked from [Ionic](https://github.com/driftyco/ionic/) with love.

## Supersonic - simplifying your HTML5 apps

AppGyver Steroids provides a wonderful layer for integrating your HTML5 application with native device capabilities. What we found from developing applications on Steroids is that you need more. Supersonic delivers the missing pieces: you'll be able to write HTML using default CSS components that are delightful to look at, use Web Components that map your HTML to fully native interfaces, and access native APIs with more ease than ever.

*Supersonic is framework agnostic.* It's a library consisting of CSS, Javascript and Web Components, which you can use with your framework of choice. However, Supersonic comes with a bundle that integrates with [Angular.js by Google](https://angularjs.org/) for even more awesomeness.

## Getting started

Supersonic ships with compiled Javascript, CSS and Web Component assets, along with a great icon pack. Supersonic is built to work with AppGyver's native wrapper, so most of the APIs will not function in a vanilla Cordova app or a mobile website.

To get going with Supersonic, please follow the [First Mile tutorial](http://docs.appgyver.com/supersonic/tutorial/first-mile/)!

### Difference between supersonic.js and supersonic.core.js

`supersonic.core.js` contains the Supersonic APIs, without the [Angular.js](http://docs.appgyver.com/supersonic/guides/technical-concepts/angular-js/) parts. If you are not using AngularJS in your project, you can use `supersonic.core.js` instead of `supersonic.js`.

## Development

### Getting started

Installing dependencies:

    npm install
    npm install grunt-cli -g
    bundle install

Running tests:

    grunt test

For a test-and-watch-for-changes loop, use:

    grunt dev

For a build-and-watch-for-changes loop, use:

    grunt build watch:build

### Running testApp and testSpecApp

Running testApp and testSpecApp requires [steroids](https://github.com/AppGyver/steroids)

* Clone [steroids](https://github.com/AppGyver/steroids) repo, install its dependencies (npm install) and run `npm link`.

Installing dependencies:

    bower install

### Generating documentation

Supersonic documentation is generated in a two-step process. A grunt task extracts metadata from source files. The docs are then presented along with the metadata by a jekyll server.

    bundle install
    grunt compile-docs
    cd docs
    jekyll serve
    open http://localhost:4000

For a build-and-watch-for-changes loop, use:

    grunt watch:docs

### Publishing to bower

This repository is set up with [Travis CI](https://magnum.travis-ci.com/AppGyver/supersonic). On each push to a branch that has passing unit tests, the continuous integration server will prepare a bower distributable version. That distributable will be deployed to [supersonic-bower](https://github.com/AppGyver/supersonic-bower) in an identically named branch, where it is installable via bower.

In other words, publishing is automatic. You don't need to do anything.

#### Tagging releases

What the publication process doesn't do yet, is handle semver updates and tagging. This is done manually for the source repo like this.

Update version tags in:

    package.json
    bower.json

Tag git version:

    git commit -m "x.y.z" && git tag "vx.y.z"

Publish:

    git push origin master --tags

Note that tags will not go through to the `supersonic-bower` repo yet – releases must be tagged manually in that repo.
