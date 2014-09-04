hapi-rethinkdb-thinky
=====================

[Hapi](http://hapijs.com/) plugin that automatically loads your [Thinky](http://thinky.io) models for [RethinkDB](http://rethinkdb.com/).

## Install
`npm install hapi-rethinkdb-thinky`

## Usage
Load plugin into your Hapi server as normal.

The default options are.

```javascript
  defaults = {
    host: 'localhost',
    port: 28015,
    db: 'test',
    modelsDir: '/models'
  };
```

`host`, `port`, and `db` are for connecting to your RethinkDB instance.

`modelsDir` is the directory where you've placed your Thinky models.
This plugin will attempt to require every file in this directory so only
put Thinky models there. The directory should be relative to
`process.cwd()` e.g. the directory where you start your node process.
