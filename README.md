### PGM XML Documentation

Documentation for the XML format [PGM](https://github.com/OvercastNetwork/ProjectAres/) uses to define map specific features.
Pages are hosted using github pages.

#### Editing

1. Care should be taken when removing trailing whitespace since markdown uses two spaces to create a newline.


#### Pull Requests

Pull requests should have the following things:

1. The commits should have a descriptive message and which is not in the past tense.

   For example:  
   `Describe the XYZ module with more detail.` or `Add detailed description for XYZ.` is good, but: `Added XYZ.` isn't.

2. Content should be grammatically correct and the spelling should be US English, e.g. Color not Colour.


#### Previewing your changes

1. Install ruby ([Mac](https://gorails.com/setup/osx/10.11-el-capitan), Windows, [Ubuntu](https://gorails.com/setup/ubuntu/15.10)) (we don't need rails, so just install ruby)
2. Install the [bundler](http://bundler.io) gem.
2. Run `bundle install` from the source root.
3. Run `bundle exec jekyll serve` or `jekyll serve`
4. Load `localhost:4000` in your browser.
