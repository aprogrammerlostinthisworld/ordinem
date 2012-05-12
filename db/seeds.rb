# encoding: utf-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def setup

 
  #if Page.count == 0
    puts '*** Creating static pages ***'
    
    Page.delete_all # debug
    
    Page.create!(:name => 'about', :title => 'About', :locale => 'en', :published => true,
    :content => <<ABOUT_EN)   
*Ordinem* is a simplified project management system and created as bachelor diploma

h1. Thirth parties
*Ordinem* writen on "Ruby":http://ruby-lang.org with "Ruby on Rails":http://rubyonrails.org framework
 
See source's on github: https://github.com/deodatus/ordinem.git

As CSS-framework used "Twitter Bootstrap":http://twitter.github.com/bootstrap
ABOUT_EN

    
    Page.create!(:name => 'about', :title => 'Про Ordinem', :locale => 'uk', :published => true,
     :content => <<ABOUT_UK)   
*Ordinem* є моїм поглядом на просту систему керування проектами і створений в якості дипломного проекту бакалавра


h1. Треті сторони

*Ordinem* написаний на "(external) Ruby":http://ruby-lang.org з використанням фреймворуку "Ruby on Rails":http://rubyonrails.org.
 
Коди проекту Ви можете подивитись на github: "(external) https://github.com/deodatus/ordinem.git":https://github.com/deodatus/ordinem.git

Як CSS-framework використано "(external) Twitter Bootstrap":http://twitter.github.com/bootstrap
ABOUT_UK

    Page.create!(:name => 'terms', :title => 'Terms of use', :locale => 'en', :published => true,
    :content => <<TERMS_EN)   
# d

TERMS_EN

    
    Page.create!(:name => 'terms', :title => 'Умови використання', :locale => 'uk', :published => true,
     :content => <<TERMS_UK)   
Це є тестова версія, не стабільна... Використання її можливе тільки для ознайомлення.
В майбутньому можливий *вайп* задля поліпшення функціональності.


TERMS_UK

  #end

end

setup # don't delete this
