# membersonly

**membersonly** is a simple blog/commenting platform, where only signed in users are able to view the authors of other posts and comments.

## Development

Make sure you have Ruby 3.1.1 and PostgreSQL installed, then run:

```
bundle install
bundle exec rails db:create db:migrate
bundle exec rails server
```

## Deployment

The application is ready to be deployed on Heroku. You can see a demo at https://stark-bastion-30084.herokuapp.com
