# Mojoplate

Boilerpalte for Perl Web application using Mojolicious and other modules.

## Features

* Mojo / Mojolicious based.
* Support Plack PSGI for production operation.
* Support Database by DBIx::Skinny.
* Practical directory structure.
* Inclue Log, UserAgent, and Cache role.
* YAML Configuration.
* Install with `cpanfile` .

## Getting Stared

1. `git clone` Mojoplate repository

```
$ git clone git://github.com/yusukebe/Mojoplate.git mojoplate
$ cd mojoplate
```

2. Install `Carton`

```
$ url -L cpanmin.us | perl - Carton
```

3. Install dependent modules with `Carton`

```
$ carton install
```

4. Start apps

```
$ ./develop
```

then development server will up on `http://localhost:5000/'

## With Docker

Launch web app service

```
$ docker-compose up
```

Do tests

```
$ docker-compose run --rm app prove
```

## Apply your app

```
$ find . -type f -print0 | xargs -0 sed -i '' "s/Mojoplate/MyApp/g"
```

## Directory structure and Files

```
.
├── cli
├── config
│   ├── development.yml
│   └── production.yml
├── cpanfile
├── cpanfile.snapshot
├── etc
│   └── mojoplate.sql
├── lib
│   ├── Mojoplate
│   │   ├── API.pm
│   │   ├── Cache.pm
│   │   ├── DB
│   │   │   ├── Row
│   │   │   │   └── Entry.pm
│   │   │   ├── Row.pm
│   │   │   └── Schema.pm
│   │   ├── DB.pm
│   │   ├── Role
│   │   │   ├── Cache.pm
│   │   │   ├── DB.pm
│   │   │   ├── Log.pm
│   │   │   └── UserAgent.pm
│   │   ├── Web
│   │   │   └── Controller
│   │   │       └── Root.pm
│   │   └── Web.pm
│   └── Mojoplate.pm
├── log
├── mojoplate.psgi
├── public
└── templates
    ├── layouts
    │   └── default.html.ep
    └── root
        └── index.html.ep
```


## See Also

* Mojolicious <https://www.mojolicious.org>
* DBIx::Skinny <https://metacpan.org/pod/DBIx::Skinny>
* Plack <https://github.com/plack/Plack>

## Author

Yusuke Wada <https://github.com/yusukebe>
