# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

 [
    {:name => "HariBahadur", :email => "hari@bahadur.com", :password => "password"},
    {:name => "MadanBahadur", :email => "madan@bahadur.com", :password => "password"},
    {:name => Faker::Name.name, :email => Faker::Internet.email, :password => "password"},
    {:name => Faker::Name.name, :email => Faker::Internet.email, :password => "password"},
    {:name => Faker::Name.name, :email => Faker::Internet.email, :password => "password"},
    {:name => Faker::Name.name, :email => Faker::Internet.email, :password => "password"},
    {:name => Faker::Name.name, :email => Faker::Internet.email, :password => "password"}
    ].each do |attrs|
      Person.find_or_create_by_name_and_email(attrs)
    end

