---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "setup/dependencies"
section:
  name: "First mile"

title: "Install dependencies"
header_sub_title: ""
---

To get started with Steroids, you need to install the Steroids CLI package, which gives you access to the Steroids command-line tool. The command-line tool is used to create new applications, run a local server that pushes your changes to client devices, bootstrap your app with generators, deploy your app to the cloud and much more.

# Step 0: Create a free AppGyver account

If you haven't already, you need to create a [free AppGyver account](http://accounts.appgyver.com/users/sign_up).

# Step 1: Install the Required Tools

First, you need to make sure that you have some tools set up that are required by certain third party Node.js libraries that the Steroids CLI uses:

- [Git](http://git-scm.com/) (certain libraries download some of their assets from Git repositories)
  - __On Windows__, be sure to select the "Use Git from Windows Command Prompt" option in the install wizard.
- [Python v2.7 or higher](http://www.python.org/)
  -   __On Windows__, be sure to select the "Add python.exe to Path" feature in the install wizard.
  -   __On OS X__, Python should be preinstalled. You can check your version by running `$ python` in the Terminal.
- __OS X only:__ [Xcode 6](https://developer.apple.com/xcode/) with Command Line Tools (for code compilation)
  - Note that the Command Line Tools are not installed by default. To install the Command Line Tools, open Terminal and type:

      ```bash
      $ xcode-select --install
      ```
      A pop-up window will appear asking whether you want to install the Tools. Click Install.

To verify your installations were successful, reopen the terminal and run the following commands:

```bash
$ git --version
$ python --version
```

If both commands return a version number, you are ready for step 2.

# Step 2: Install NVM and Node.js

Next, you need to have [Node.js](http://nodejs.org) version 0.10.x and npm package management installed.

- __On Windows__, install Node.js with the [official Windows installer](http://nodejs.org/download/).

- __On OS X and Linux__, the best way to install Node.js is with Node Version Manager (NVM). Install NVM with the command:

```bash
$ curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
```
On some Linux distributions, the `sh` command might fail. See instructions on manually installing NVM at the [NVM GitHub page](https://github.com/creationix/nvm#manual-install).

After installing NVM, restart your Terminal to make sure that NVM is loaded properly. (The NVM install script adds the path definition by default to `.bash_profile`, so if you are running a different bash, you might need to copy the line manually to your bash's config file.)

To install Node.js version 0.10.x with NVM and set it as default:

```bash
$ nvm install 0.10
$ nvm use 0.10
$ nvm alias default 0.10
```

Alternatively, if you don't want to use NVM, you can install Node.js and npm package management from [nodejs.org](http://nodejs.org/), though Steroids officially supports only NVM-based installations. Note that for a non-NVM-based Node.js installation, you might need to prepend `sudo` to certain npm commands (e.g. global installs and updates).

Check that you have the correct version of Node.js installed by running:

```bash
$ node -v
```