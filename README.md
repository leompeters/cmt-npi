# CMT Solutions for NPI 

Web application that is able to retrieve a provider’s details based on their
National Provider Identifier (NPI).

![CI - MAIN](https://github.com/leompeters/cmt-npi/workflows/ci/badge.svg?branch=main)

There is a live version in this [link](https://cmt-npi.herokuapp.com).
It is mobile-friendly, you can try it on your phone!

## Quick Start

1.  Setup your project gems/libraries environment installing [RVM](http://rvm.io).

    ```bash
    $ rvm install 3.0.2
    $ rvm use 3.0.2@cmt-npi --create
    ```

2.  Install libraries.

    ```bash
    $ echo "gem: --no-document" > ~/.gemrc
    $ gem install bundler
    # Download MDM repo.
    $ bundle install
    $ rails db:create db:migrate
    ```

## Dependencies

+   Install **Postgres**.

    ```sh
    # https://medium.com/@manishyadavv/how-to-deploy-ruby-on-rails-apps-on-aws-ec2-7ce55bb955fa
    # $ sudo apt-get install postgresql postgresql-contrib
    # https://gleecus.com/blog/a-quick-guide-to-deploy-rails-5-2-application-on-aws-ec2/
    $ sudo apt-get install postgresql postgresql-contrib libpq-dev

    $ sudo -i -u postgres
    $ psql
    ```

    +   If getting errors on install **pg** gem, running:

        ```bash
        $ gem install pg -v '1.2.3' -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config
        ```

        > _Source: <https://stackoverflow.com/questions/19625487/impossible-to-install-pg-gem-on-my-mac-with-mavericks>._

+   **Nokogiri**: for issues see more in this [link](http://www.nokogiri.org/tutorials/installing_nokogiri.html#using_nonstandard_libxml2___libxslt_installations).

    ```bash
    $ brew update
    $ xcode-select --install
    $ brew install libiconv
    $ brew link libiconv
    $ gem install nokogiri -- --with-iconv-dir=/usr/local/Cellar/libiconv/1.14
    ```

    > _Source: <https://stackoverflow.com/a/6163052/2334082>_

    OR

    ```bash
    $ gem install nokogiri -- \
        --use-system-libraries \
        --with-xml2-config=/usr/bin/xml2-config \
        --with-xslt-config=/usr/bin/xslt-config
    ```

    > _Source: <https://stackoverflow.com/a/28593132/2334082>_

+   **Credentials/Secrets**

    You can use this example of **`./config/credentials.yml.enc`** running
    `rails credentials:show` if you have the secret code ;-P
    Be sure to get the `secret_key_base` running `$ rails secret`:
    
    > See more details in <https://github.com/rails/rails/pull/30067> and
    > **<https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336>**.

## Tests

Automated tests are based in [RSpec][] tool.

The desired scenarios are at `./spec` folder.

[RSpec]: https://rspec.info "RSpec"

[![Analytics](https://ga-beacon.appspot.com/UA-25165099-7/leompeters/cmt-npi/README.md?flat)](https://github.com/leompeters/cmt-npi "CMT Solutions for NPI")
