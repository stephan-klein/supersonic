module.exports =
  dev:
    options:
      compilers: ['coffee:coffee-script/register']

    src: ['<%= files.test %>']
  travis:
    options:
      compilers: ['coffee:coffee-script/register']

    src: ['<%= files.test %>']
