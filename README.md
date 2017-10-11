# What happened to The Dog Park?
I had the idea of creating a social network that purportedly catored to dogs but decided that it would serve me better in it's originally intended form, a facebook clone. I still maintain would be a good joke (@ me if you want to help me make a legit one) but I'll slowly transition into a fully fledged facebook clone. Any reference to dogs is for that reason.
-----
The world's first social network for dogs. The Dog Park is a facebook clone made for the Ruby on Rails final project at the Odin Project.

http://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project

Features include friendships, posts, comments, likes, and more. The app has a Rails back end, postgresql database, authentication system with devise, authentication through facebook using omniauth, and is hosted on Heroku. 

Making this project I learned about integrating third party systems into apps, namely devise and omniauth, as well as how to handle working on large, complex systems, and about the joys of test driven development.

https://the-dog-park.herokuapp.com/

To work the app requires a several environment variables including a database username and password, Facebook app ID and secret sendgrid username and password and database secrets. I'm using Figaro to store these secrets in an untracked application.yml file. I may eventually upgrade to a newer version of rails and use the new secrets feature.

JohnBrock.io
