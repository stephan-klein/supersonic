#!/bin/bash

grunt compile-docs
cd docs
jekyll build
