# Phoenix 1.3 with Bulma 0.6.2, Font Awesome 4.7, and Vue 2.5.13

This is an example of using Elixir Phoenix with Bulma and Vue. There is also a branch called bulma_without_vue if you don't want Vue. There's a basic Bulma starter template being used for the default Page template.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## To Install Bulma and Font Awesome:

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
4. Add sass-brunch, font-awesome, and copycat config to assets/brunch-config.js
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
And the scss folder to the watch path.
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

## To install Vue
1. Install Vue
```
cd assets
npm install vue
```
2. In /assets/brunch-config.js, add a Vue alias so it knows which JS file to use.
```
npm: {
    enabled: true,
    aliases: {
      vue: "vue/dist/vue.common.js"
    }
  }
```
3. Import Vue in /assets/js/app.js
```
import Vue from 'vue'
```
Note: If you want Vue code in a file other than app.js (for example, a file called main.js), you'll import main in app.js like this:
```
import "./main"
```

