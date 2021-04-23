# Life Is Brewtiful Ruby on Rails App

Flappy Bernie is a Rails web app for reviewing breweries in the United States.

## Preview
### Homepage
![Screen Shot 2021-04-23 at 11 58 00 AM](https://user-images.githubusercontent.com/73256077/115898728-e0620000-a42b-11eb-8b85-2560ec1dc351.png)
### Review Section
![Screen Shot 2021-04-23 at 12 03 42 PM](https://user-images.githubusercontent.com/73256077/115898803-f40d6680-a42b-11eb-8049-6cdd88c1dca0.png)

## Installation
 1. Clone the backend GitHub Repository in the same parent directory as the frontend.
 ```
 $ git clone git@github.com:kotomino/life-is-brewtiful-project.git
 ```
2. Run bundle install inside the project directory.
``` 
$ bundle install
```
3. Run db:create, db:migrate, db:seed with rails.
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## Usage
1. Run rails s in terminal inside the project folder.
```
$ rails s
```
2. Navigate to your browser and enter the rails localhost server (default: localhost:3000)
3. Signup and create an account.

### Functionalities
User when not logged in:
- Can see all reviews for Atlanta breweries by others
- Can create new account

User logged in:
- Can view their own past reviews
- Can view account info
  

### Nice-to-haves
- Sort by alphabetical order
- Sort by Rating
- Add breweries to favorites list
  - Account info section includes "favorite breweries" list

