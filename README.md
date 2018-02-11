# Phoenix 1.3 with Bulma 0.6.2 and Font Awesome 4.7

This is an example of using Elixir Phoenix with Bulma.  There's a basic Bulma starter template being used. The main changes to the default install is in /assets/package.json, /assets/brunch-config.js, and /assets/css/* (namely that app.css was renamed to app.scss and some custom css was imported).

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## To Reproduce:

1. Remove Bootstrap 
```
$ rm assets/css/phoenix.css
```
2. Install Bulma and Font Awesome
```
$ cd assets
$ npm install --save bulma font-awesome
```
3. Install Sass-Brunch & Copycat-Brunch
```
$ npm install --save-dev sass-brunch copycat-brunch
```
4. Add sass-brunch, font-awesome, and copycat config to brunch
```
// Configure your plugins
plugins: {
  babel: {
    // Do not use ES6 compiler in vendor code
    ignore: [/vendor/]
  },
  copycat: {
    "fonts": ["node_modules/font-awesome/fonts"]
  },
  sass: {
    options: {
      includePaths: ["node_modules/bulma", "node_modules/font-awesome/scss"]
    }
  }
},
```
And the scss folder to the watch pass.
```
paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "scss", "js", "vendor"],
    ...
  },
...
```
5. Rename app.css to app.scss
```
$ cd assets/css; mv app.css app.scss
```
6. Import Bulma in app.scss
```
@import "bulma"
```
7. Start over on your template. It's currently set up with Bootstrap classes.
