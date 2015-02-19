### PGM XML Documentation

Website source for docs.oc.tc. Uses the ruby on rails staticmatic gem to build a static documentation website.


#### Editing

1. Markdown should be used for content and haml for layout and data. [¹](http://chriseppstein.github.io/blog/2010/02/08/haml-sucks-for-content/)
2. Care should be taken when removing trailing whitespace since markdown uses two spaces to create a newline.


#### Pull Requests

Pull requests should have the following things:

1. The commits should have a descriptive message and which is not in the past tense.

   For example:  
   `Describe the XYZ module with more detail.` or `Add detailed description for XYZ.` is good, but: `Added XYZ.` isn't.

2. Content should be grammatically correct and the spelling should be US English, e.g. Color not Colour.


#### Previewing your changes

1. Install ruby, ruby on rails and bundler
2. Run `bundle install` from the source root.
3. Run `staticmatic preview` or `bundle exec staticmatic preview`
4. Load `localhost:4000` in your browser.
