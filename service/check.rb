#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'digest'
require 'ffaker'

def check
  page = Nokogiri::HTML(open('http://localhost:3000/'))
  if page.title == 'YetAnotherBookCollection'
    puts '101'
  else
    puts '104'
  end
end

def register_user(email, password)
  uri = URI 'http://localhost:3000/signup'
  http = Net::HTTP.new uri.host, uri.port
  request = Net::HTTP::Get.new uri.path
  response = http.request request

  token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]

  cookie = response['set-cookie'].split(';')[0]

  form_data = {
    'authenticity_token': token,
    'user[name]':  FFaker::Name.name,
    'user[email]':  email,
    'user[password]':  password,
    'user[has_priveleges]':  true,
    'commit': 'Submit'
  }

  uri = URI 'http://localhost:3000/users'
  http = Net::HTTP.new uri.host, uri.port
  headers = {
    'Referer': 'http://localhost:3000/signup',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Host': 'localhost:3000',
    'Cookie': cookie
  }
  request = Net::HTTP::Post.new uri.path, headers
  request.set_form_data form_data
  response = http.request request

  p response.body
end

def login_user(email, password)
  uri = URI 'http://localhost:3000/login'
  http = Net::HTTP.new uri.host, uri.port
  http.add_field('User-Agent', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0')

  request = Net::HTTP::Get.new uri.path
  response = http.request request

  token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]

  cookie = response['set-cookie'].split(';')[0]
  form_data = {
    'utf8': '✓',
    'authenticity_token': token,
    'user[email]':  email,
    'user[password]':  password,
    'commit': 'Submit'
  }

  uri = URI 'http://localhost:3000/login'
  http = Net::HTTP.new uri.host, uri.port
  http.add_field('User-Agent', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0')
  headers = {
    'Referer': 'http://localhost:3000/login',
    # 'Content-Type': 'application/x-www-form-urlencoded',
    # 'Host': 'localhost:3000',
    'Connection': 'keep-alive',
    # 'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0',
    'Cookie': cookie
  }
  request = Net::HTTP::Post.new uri.path, headers
  request.set_form_data form_data
  response = http.request request
end

password  = Digest::SHA1.hexdigest(rand.to_s)
email     = FFaker::Internet.email
# register_user(email, password)
puts "#{email} :: #{password}"
login_user('estelle@bartell.us', '2e2a3ef8aa4ccfc9ff845030913e81ce5ec23a40')
