---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "setup/steroids"
section:
  name: "First mile"

title: "Install Steroids CLI"
header_sub_title: ""
---

To get started with Steroids, you need to install the Steroids CLI package, which gives you access to the Steroids command-line tool. The command-line tool is used to create new applications, run a local server that pushes your changes to client devices, bootstrap your app with generators, deploy your app to the cloud and much more.

>__Note: If you haven't already done so, make sure you have properly set up the dependencies for Steroids CLI. See the [Installing dependencies]() guide for instructions on how to do so.__

# Step 1: Install the Steroids CLI package

Install the Steroids CLI package globally (so it can be used in any folder) with the `-g` option:

```bash
$ npm install steroids -g
```

>__Note:
>npm might give you a few alerts about some third party libraries. This doesn't affect Steroids. If npm fails to install a third party library and gives an error, it can typically be fixed just by running the `$ npm install steroids -g` command again.__

(If you're on Windows, note that Node.js [doesn't support Cygwin](https://github.com/joyent/node/issues/5618) at the moment.)

# Step 2: Connect the Steroids CLI with your AppGyver account

To see that everything works correctly, open a Terminal window and type:

```bash
$ steroids login
```

Steroids opens up a browser window to handle the login process. If you haven't already, log in with your AppGyver account. Then, switch back to the Terminal window. Steroids should tell you that the login was successful.

# Step 3: Build your first Supersonic app in 5 minutes

Next, head on over to the [Hello World]() tutorial and get your first app up and running in under 5 minutes.

If you run into any trouble, drop us a line at the [forums](http://forums.appgyver.com/) – and happy hacking!