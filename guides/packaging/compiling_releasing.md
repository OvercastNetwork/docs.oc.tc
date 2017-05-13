---
layout: page

category: "Guides"
category_lead:  "Packaging Maps for Release"
title:  "Compiling & Releasing"

---

Once your world is cleaned up and pruned, it is ready to be compiled. To start, add in your `map.xml` file. Then, add in your `map.png` file. Below is an image of what your folder should look like:

![](/img/folder_layout.png)

<br/>

#### The Map's XML File

The `map.xml` file is the XML you coded for your map. This file is essential when it comes to having your map loaded and tested. While you may submit maps without this file, it means someone else will have to code all the gameplay for your map. This makes your map less likely to be tested or used at all.

Also, take note of the following coding guidelines when creating your `map.xml` file:

* Verify there are **no tabs in the XML** -- 4 spaces only
* Verify the main map element and its main elements are not indented
* Follow [Semantic Versioning](http://semver.org) when deciding the map version
* Bump the map version if gameplay has changed
* [Validate](http://www.w3schools.com/xml/xml_validator.asp) the XML to make sure it does not have any syntax errors

<br/>

#### The Map Image

The `map.png` file displays the image of your map on the website. The standard resolution for these pictures is `290x246`. This image should contain a general overview of the map's playing area.

Image Examples

<div class="row">
    <div class="col-md-6">
        <img class="thumbnail center-block" src="/img/BlockRage_map.png"/>
    </div>
    <div class="col-md-6">
        <img class="thumbnail center-block" src="/img/Rage Quit_map.png"/>
    </div>
</div>

<br/>

#### Compressing the folder to a ZIP file

Before you upload the map, you must compress the folder to a `.zip` format. Do **not** compress to a `.rar` or any other format.

To compress a folder:

* `Windows:` Right Click > Send To > Compressed Zip
* `Mac`: Right Click > Compress

<br/>

#### Uploading the map
To upload the map, we recommend using [Google Drive](https://drive.google.com/) or [Dropbox](https://www.dropbox.com/).
Note: We do not allow submissions through Mediafire
