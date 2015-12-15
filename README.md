# passport-outlook

[Passport](https://github.com/jaredhanson/passport) strategy for authenticating
with [Outlook](http://www.outlook.com/) accounts (aka [Windows Live](http://www.live.com/))
using the OAuth 2.0 API.

This module lets you authenticate using Outlook REST API in your Node.js
applications. By plugging into Passport, Outlook REST API authentication
can be easily and unobtrusively integrated into any application or
framework that supports [Connect](http://www.senchalabs.org/connect/)-style
middleware, including [Express](http://expressjs.com/).

## Install

    $ npm install passport-outlook

## Usage

#### Configure Strategy

The Windows Live authentication strategy authenticates users using a Windows
Live account and OAuth 2.0 tokens.  The strategy requires a `verify` callback,
which accepts these credentials and calls `done` providing a user, as well as
`options` specifying a client ID, client secret, and callback URL.

    passport.use(new OutlookStrategy({
        clientID: OUTLOOK_CLIENT_ID,
        clientSecret: OUTLOOK_CLIENT_SECRET,
        callbackURL: "http://www.example.com/auth/outlook/callback"
      },
      function(accessToken, refreshToken, profile, done) {
        User.findOrCreate({ outlookId: profile.id }, function (err, user) {
          return done(err, user);
        });
      }
    ));

#### Authenticate Requests

Use `passport.authenticate()`, specifying the `'outlook'` strategy, to
authenticate requests.

For example, as route middleware in an [Express](http://expressjs.com/)
application:

    app.get('/auth/outlook',
      passport.authenticate('outlook', {
        scope: [
          'openid',
          'https://outlook.office.com/mail.read'
        ]
      })
    );

    app.get('/auth/outlook/callback', 
      passport.authenticate('outlook', { failureRedirect: '/login' }),
      function(req, res) {
        // Successful authentication, redirect home.
        res.redirect('/');
      });

## Examples

For a complete, working example, refer to the [login example](https://github.com/clocked0ne/passport-outlook/tree/master/examples/login).

## Tests

    $ npm install
    $ npm test

## Credits

  - [Nigel Horton](http://github.com/clocked0ne)

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2015-2016 Nigel Horton