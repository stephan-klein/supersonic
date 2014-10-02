---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "tech/promises"
section:
  name: "First mile"

title: "Supersonic promises"
header_sub_title: ""
---

#Supersonic promises

Supersonic wraps all Steroids and Cordova APIs inside promises, making working with asynchronous code very easy. If you are not at all familiar with the concept of promises, check out [this primer](http://davidwalsh.name/write-javascript-promises) on the subject. If you're not interested in technical details or are feeling like that's too much to handle, don't worry, you can still use Supersonic effectively.

##Moving away from callbacks

Normally in JavaScript, if you wanted to do something asynchronous, you would provide a callback function as a parameter to the asynchronous function. For a simple Steroids API like `steroids.device.ping`, the code would look like this:

```javascript
steroids.device.ping({
},{
  onSuccess: function(parameters) {
    alert(parameters.message)
  }
});

```

With Supersonic, the same operation is accomplished like this:

```javascript
supersonic.debug.ping()
.then(function(parameters){
    alert(parameters.message)
});
```

It doesn't look like much of a difference, but the real beauty is what happens when you have several asynchronous calls that need to operate in unison. You can chain together several asynchronous methods without compromising readability or having to utilise higher mathematics to keep track of the callback chain. The basic syntax looks somewhat like this:

```javascript
asyncCall()
  .then(return anotherAsyncCall())
  .then(return yetAnotherAsyncCall())
  .then(return oneMore())
  .catch(errorHandler(error))
```
