# Sample of Airtable-powered Jekyll

This is just a sample of how to jump start a Jekyll site using Airtable as the source of data. Every time the jekyll build is triggered, then it will send requests to Airtable
to get the data from tables in a certain base then store them as collections. The crux of this Jekyll is basically a custom Jekyll plugin that I made, which you can find [here](https://github.com/galliani/jekyll-airtable). Should you already have a Jekyll repository already set up, you can just use that plugin to have the same functionality like this repo.


![screenshot of Skinny Bones](https://github.com/galliani/airbase/images/ss-index.png)

---

## Notable Features

* Most likely incompatible with GitHub Pages because Github only allow whitelisted plugin to be working on Github Pages.
* Stylesheet built using Sass.
* Data files for easier customization of the site navigation/footer and for supporting multiple authors.
