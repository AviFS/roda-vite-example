# Roda Vite Example

## Setup

Clone this repository and run:

```
bundle install
```

To install `node_modules/`, run:

```
npm add -D vite@\^6.2.6 vite-plugin-ruby@\^5.1.1
```

Then run:

```
bundle exec puma
```

and

```
bundle exec vite dev
```

You may also run the Procfile with `foreman start` or another runner to start the web and Vite development servers.


## Try it

Change the css and save the file, to see it reflected in the browser immediately without refreshing the page.

```css
/* assets/css/app.css */

body {
  background-color: blue;
}
```

## Building

If you are running the vite and web server as different processes, open a third one and run:

```
bundle exec vite build
````

Go to 'View Page Source' and you should see:

```html
<head>
  ...
  <script type="module" src="/@vite/client"></script><link rel="stylesheet" href="/css/app.css" />
</head>
```

That is the site using Vite's Hot Module Replacement (HMR).

Now quit the Vite dev server and you should instantly see the HTML source update to:

```html
<head>
  ...
  <link rel="preload" href="/assets/app-eUfRv511.css" as="style" /><link rel="stylesheet" href="/assets/app-eUfRv511.css" />
</head>
```

Now the site is accessing the bundled assets from the `public/` directory. From now on, it will always revert to the bundled assets when the Vite dev server isn't on.

Start the Vite dev server again and you will see it pull the assets using Vite's HMR server again, without ever refreshing the webpage. Vite makes the transition between the development and production environments seamless.

## Note

If you have `roda-vite` globally installed, you can run `roda-vite dev` rather than running `bundle exec vite dev`, if you'd like.

Running `roda-vite` and `vite` do the same thing. However, `vite` may be shadowed by another executable in the global namespace.

You can confirm that they depend on the same version of Roda Vite by running `bundle exec vite version`. The first three lines should show Roda Vite and its version:

```
$ bundle exec vite version
bin/vite present?: false
vite_ruby: 3.9.2.3
roda-vite: 0.4.0
```

(This gem depends on Vite Ruby, which installs the `vite` executable.
Vite Ruby was created with the intention of being used for several different frameworks. It will detect that Roda is being used in the project, and will do the same thing as `roda-vite` when called.)
