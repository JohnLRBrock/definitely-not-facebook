# What happened to The Dog Park?
I had the idea of creating a social network that purportedly catored to dogs but decided that it would serve me better in it's originally intended form, a facebook clone. I still maintain would be a good joke (@ me if you want to help me make a legit one) but I'll slowly transition into a fully fledged facebook clone. Any reference to dogs is for that reason.
-----
The world's first social network for dogs. The Dog Park is a facebook clone made for the Ruby on Rails final project at the Odin Project.

http://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project

Features include friendships, posts, comments, likes, and more. The app has a Rails back end, postgresql database, authentication system with devise, authentication through facebook using omniauth, and is hosted on Heroku. 

Making this project I learned about integrating third party systems into apps, namely devise and omniauth, as well as how to handle working on large, complex systems, and about the joys of test driven development.

https://the-dog-park.herokuapp.com/

To work the app requires a several environment variables including a database username and password, Facebook app ID and secret sendgrid username and password and database secrets. I'm using Figaro to store these secrets in an untracked application.yml file. I may eventually upgrade to a newer version of rails and use the new secrets feature.

#### Where's the mobile page?
I don't have one and I don't want one. Facebook doesn't use media queries to make their website dynamic. Instead they have a website for desktop and a website for mobile. I do not like this. I think it's a design decision left over from when mobile sites were popular but it's a design decision that doesn't make sense from the advent of the tablet. Screens are not a binary anymore and we want to design a websites that look good on screens from the size of TVs to cell phones. For that reason I'll be taking some liberties while designing my clone, like not having three different shades of blue for the header depending on what page you are (not an exaggeration. There's a different blue on the desktop login screen, the desktop feed screen, and a noticeably different blue on the mobile screen)

JohnBrock.io
