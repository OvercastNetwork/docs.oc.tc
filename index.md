---
layout: default
---

<div class="jumbotron head" style="text-align: center">
    <h1>XML Documentation</h1>
    <p class="lead">Documentation on XML files that are required for each map to be added to the servers</p>
</div>
<div class="col-sm-10 col-sm-offset-1">
<section>
    <div class="page-header">
        <h1 style="padding-left: 30px">Welcome</h1>
    </div>
    <div class="col-sm-12">

<div class="col-sm-6" markdown="1">
### What Do XML Files Do?
XML files configure how the PGM plug-in controls the map during a match. Any map released on Stratus requires an XML file to function. The XML defines aspects of the game such as spawn points, teams, kits and more. Each file is unique to its map, however the components and modules are generic and are used on many different maps.


### Writing XML Files
Almost every text editor can create and edit XML files, however editors designed for XML can automatically indent and syntax your code to help spot mistakes.

We recommend that you use [Atom](https://atom.io/) to create and edit XML files.

To keep your XML file clean & readable you should indent lines using 4 spaces and only specify elements or attributes you intend to use.

### Releasing Your Map
Before releasing your map for testing, you must package your map following [these guidelines](/guides/packaging/cleaning_files).
This will speed up the time it takes to get your map ready for testing.

</div>
<div class="col-sm-6" markdown="1">
### Using These Docs
This documentation is intended to list all currently available XML modules, their attributes & sub-elements; and describe how the modules work and interact with the player. It is designed to be used as a reference when coding the XML files accompanying a map to ensure that the XML is valid and works as intended.

All attributes or sub-elements for a element or module are listed in a table and required attributes or sub-elements are marked in red. In the following example the `color` attribute is required but `id` is not. The attribute or elements default value is also listed if there is one.

##### Table Example
<div class="table-responsive">
    <table class="table table-striped table-condensed">
        <thead>
            <tr>
                <th>Attribute</th>
                <th>Description</th>
                <th>Value</th>
                <th>Default</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><code>id</code></td>
                <td>Unique identifier used to reference this element.</td>
                <td><span class="label label-primary">String</span></td>
                <td></td>
            </tr>
            <tr>
                <td><code>color</code></td>
                <td><span class="label label-danger">Required</span> This example's color.</td>
                <td><a href="/reference/colors"> Dye Color Name</a></td>
                <td></td>
            </tr>
            <tr>
                <td><code>cow</code></td>
                <td>This example has a pet cow.</td>
                <td><span class="label label-primary">true/false</span></td>
                <td>false</td>
            </tr>
        </tbody>
    </table>
</div>

</div>
</div>
</section>
</div>
