---
layout: page

category: "Guides"
category_lead:  "XML Pointers"
title:  "XML Conventions"

---

<!-- <div class="post-header">
  <div>
    <div>
      <span class="pull-left" style="margin: 4px 5px 0 0;">
      <img style="width: 32px;height: 32px;border-radius: 3px;vertical-align: bottom;" width="32" height="32" class="avatar" src="https://crafatar.com/avatars/260004f0996b4539ba21df4ee6336b63?size=32" alt="Elliott_" title="Elliott_">
      </span>
    </div>
    <div style="margin-left: 37px;">
      <span style="color: #2233aa; font-weight: bold; margin-right: 3px">Elliott_</span>
    </div>
    <div style="margin-left: 37px;">
      <span class="post-timestamp" data-container="body" data-placement="right" rel="tooltip" title="" data-original-title="May 13th, 2016 - 9:43 PM (Posted on December 18th, 2015 - 6:20 PM)">
        <small>May 13th, 2016</small>
      </span>
    </div>
  </div>
</div>
<hr>


_The following is an extract from the Map Developers Conventions - if there are any grammatical/spelling errors feel free to mention_

We decided this would also be useful to you guys to ensure you meet what we are looking for in XML's to keep our repository neat and professional.


<br/> -->

### 1: Indentation

##### 1.1 Map Indentation
Modules must all start on column one. This means that all children tags under the `<map>` tag must be aligned with said `<map>` tag.

    <?xml version="1.0"?>
    <map proto="1.4.2">
    <name>Blocks DTC</name>
    <version>1.3.4</version>
    <objective>Leak lava from the enemy's obsidian core.</objective>
    </map>

##### 1.2 Child Element Indentation
Modules that have sub elements such as the `author` tag must be indented with 4 spaces below the parent element.

    <?xml version="1.0"?>
    <map proto=”1.4.2">
    <authors>
        <author uuid="060baa18-2852-40d8-afcb-e61607c04be3"/> <!-- PepsiDog -->
    </authors>
    </map>

##### 1.3 Spaces Between Modules
There should be no white spaces between modules. That means the end of one module should have the start of another on the immediate next line.

    <!-- Correct -->
    <?xml version="1.0"?>
    <map proto="1.4.2">
    <name>Blocks DTC</name>
    <version>1.3.4</version>
    <objective>Leak lava from the enemy's obsidian core.</objective>
    </map>
^

    <!-- Incorrect! -->
    <?xml version="1.0"?>

    <map proto="1.4.2">

    <name>Blocks DTC</name>

    <version>1.3.4</version>

    <objective>Leak lava from the enemy's obsidian core.</objective>

    </map>

##### 1.4 Closing tags
The ending tag of one module should be on the line directly above the beginning tag of a following module.

##### 1.5 Line Ending
XML files must end with an empty line. For example, if the ending `</map>` tag is on line 52, the last line of the XML file would be line 53.



<br/>

### 2: Layout

##### 2.1 Main Map Definitions
There are 6 modules that make up the maps definition. They should all be placed at the top of the document; following the order below: `map`, `name`, `version`, `objective`, `authors` and `contributors`.

NOTE: Contributors are optional but are still to remain at the top.

    <?xml version="1.0"?>
    <map proto="1.4.2">
    <name>Blocks DTC</name>
    <version>1.3.4</version>
    <objective>Leak lava from the enemy's obsidian core.</objective>
    <authors>
        <author uuid="260004f0-996b-4539-ba21-df4ee6336b63"/> <!-- Elliott_ -->
    </authors>
    <contributors>
        <contributor contribution="A contribution">aHelper</contributor>
    </contributors>
    </map>

##### 2.2 The Protocol
All newly submitted maps must use the `1.4.0` protocol or above.

##### 2.3 Authors and Contributors
An author using a uuid definition should have an inline comment to denote the players IGN.

    <authors>
        <author uuid="260004f0-996b-4539-ba21-df4ee6336b63"/> <!-- Elliott_ -->
    </authors>

##### 2.4 Filters and Regions
The filter definition should be defined before the definition of regions.



<br/>

### 3: Naming Conventions

##### 3.1 Map Names Map
Names should not contain any special characters or symbols. This includes unicode and letters with accents.

##### 3.2 Versioning
Follow the Semantic Versioning Schema For example: `1.2.3`

A Major is classified by the addition of major gameplay changes - changes that could be called a new map.
A Minor is classified by the addition of changes that affect gameplay but not to the extent of a major.
A Patch is classified by a small change to fix a bug or unintentional feature.
NOTE: Bump this patch when you fix something on a map.

##### 3.3 Objectives
Objectives should be short and tell the player what they have to do to win the match.

    <objective>Win the match by killing the enemy team!</objective>

##### 3.4 Identification Naming
Modules that require an `id` to be defined should be named in all lowercase and use a `-` dash to signify a space.

    <team id="only-blue">blue</team>

##### 3.5 Enumeration naming
Names which are defined as enumeration in bukkit should be transferred into lower case and `_` underscores replaced with spaces. `PROTECTION_ENVIRONMENTAL` should become `protection environmental`

##### 3.6 Material Definition
In places where you define a material type use the bukkit name following the Enumeration Naming (3.5) instead of the ID. This makes it a lot easier to know what block is being defined during debugging processes.

##### 3.7 Filters

##### 3.7.1 Team Filters
Team filters should be named by following the Identification naming (3.4) and start with `only-` followed by the team name.

`only-blue` `only-elves`
