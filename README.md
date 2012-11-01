MopedTest
=========

It is a playground for us to test Moped, which is a MongoDB driver for Ruby.

History
-----------------
1. Initilize project structure for gem (`bundle gem moped_test`)
2. Install rspec gem ('gem install rspec') also update Gemfile
3. Initilize project with rspec support (`rspec --init`)
4. Add Guard, Growl and growlnotify into Gemfile
    
		    group :development, :test do
		      gem 'guard-rspec'
		    end

		    group :test do
		      gem 'rb-fsevent'
		      gem 'growl'
		    end

5. Initialize Guard to work with Rspec (`bundle exec guard init rspec`)
6. Modify Guardfile to ensure Guard doesn't run all the tests after a failing test passes
 
            guard 'rspec', :version => 2, :all_after_pass => false do

7. Add Spork into Gemfile to speed up tests

            group :development, :test do
              gem 'guard-spork'
              gem 'spork'
            end

8. Bootstrap the Spork configration (`bundle exec spork --bootstrap`)
9. Modify the Spork corresponding files: spec/spec_helper.rb, .rspec

   .rspec

            --color
            --drb

10. Make Guard works with Spork (`bundle exec guard init spork`)   

   Guardfile

            guard 'rspec', :version => 2, :all_after_pass => false, :cli => '--drb' do


Installation
-------------

Add this line to your application's Gemfile:

    gem 'moped_test'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moped_test

Usage
--------

TODO: Write usage instructions here

Contributing
--------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
