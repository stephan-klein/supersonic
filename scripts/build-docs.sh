#!/bin/bash

gem install jekyll
grunt compile-docs
cd docs
jekyll build
