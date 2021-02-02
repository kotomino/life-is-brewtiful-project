# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Life is Brewtiful- Brewery Reviews

## MVP 
- Models: User(reviwer), Rating, Brewery
- CRUD Ratings for breweries in Atlanta
- API from Open Brewery DB
- Validations for attributes
- Scope methods using Active Record
- User Authentication (signup/login/logout/passwords)
- Login with Facebook
- RESTful URLs
  - Nested '/new' route with form to parent resource
  - Nested index or show route
- Display validation errors
- DRY

### Routes

/breweries
/breweries/new (w/ nested rating form)
/breweries/:id/ratings
/breweries/:id/ratings/new 
/ratings
/ratings/new (select from existing breweries; link to '/breweries/new'; block creation of already existing brewery)


## Functionalities
User when not logged in:
- Can see all reviews for Atlanta breweries by others
- Can create new account

User logged in:
- Can view their own past reviews
- Can view account info
  

## Nice-to-haves
- Sort by alphabetical order
- Sort by Rating
- Add breweries to favorites list
  - Account info section includes "favorite breweries" list

