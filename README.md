Local Installation
==================
Requirements
------------
* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.3](https://rubyonrails.org/) - Rails Version

Clone
-----
```
$ git clone https://github.com/lpile/koroibos-api.git
$ cd koroibos-api
$ bundle install
```

Setup Database
--------------
```
$ rails db:{create,migrate}
$ rake import:data
```
**Note: The rake task will take awhile to load data into database**
