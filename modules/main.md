---
layout: page

category: "Modules"
title:  "Main Map Element"
nav_content:
  - path: "#elements"
    name: "Main Elements"
  - path: "#authors_contributors"
    name: "Authors & contributors"
  - path: "#gamemode"
    name: "Map Gamemode"

---

### Main Elements {#elements}

Every map XML file must contain the base `<map>` module. It contains modules that specify the map name, version, objective, authors, contributors and all other map settings. The objective is the text that players see when they join the match, and so it's important for this to be very clear, concise, and informative.

The `proto=""` attribute specifies what PGM version the XML file was created for. If this value is higher than the version of PGM that is running, the map won't load. If it's lower, the map will load but the XML may be interpreted in an outdated way. Mapmakers should always use the latest supported XML version, and this may be required of new maps that are to be added to the Stratus Network rotations.

The maps version should follow the versioning schema `major.minor.patch`.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Map Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<map> </map>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The main map node containing all the modules used in this match.
        </td>
        <td>
          <span class='label label-default'>XML Modules</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Map Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
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
        <td>
          <code>proto</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The maps XML protocol version.
        </td>
        <td>
          <code>{{site.current_proto}}</code>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>game</code>
        </td>
        <td>A custom title for this match's gamemode.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>internal</code>
        </td>
        <td>Prevent compass teleports above Y 255</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Map Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<name>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The name of the map.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<slug>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The map's slug, usually auto generated from the maps name.
          This should only be used when a map is renamed to retain the map's ratings, etc.
          <br/>
          Valid slugs are lowercase and only contain the characters: <code>a-z 0-9 _ </code>
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td>
          <span class='label label-default'>Auto Generated</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<version>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The map's
          <a href='http://semver.org'>semantic version</a>
          string.
        </td>
        <td>
          <code>1.0.0</code>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<objective>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The map's objective, shown at the start of the match.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<authors>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The authors of the map, at least one author is required.
        </td>
        <td>
          <code>{{'<author>' | escape_once}}</code>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<contributors>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Contributors to the map.
        </td>
        <td>
          <code>{{'<contributor>' | escape_once}}</code>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<phase>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Phase of this map. Only maps with phase `production` show up on the website.
        </td>
        <td>
          <code>development</code>
          <code>production</code>
        </td>
        <td>
          <code>production</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<edition>' | escape_once}}</code>
          </span>
        </td>
        <td>Edition of this map, describes which servers it is run on. Only maps with edition `standard` and/or phase `production` show up on the website.</td>
        <td>
          <code>standard</code>
          <code>ranked</code>
          <code>tournament</code>
        </td>
        <td>
          <code>standard</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<gamemode>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#gamemode'><i class="fa fa-chevron-down"></i></a>
          The gamemode(s) of this map, if this is not specified the map will set the gamemode(s) to whatever modules are used.
        </td>
        <td>
          <span class='label label-primary'>Gamemode ID</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
    <?xml version="1.0"?>
    <map proto="{{site.current_proto}}">
    <name>Map Name</name>
    <version>1.0.0</version>
    <objective>Short description about the maps objective.</objective>

    <!-- Map authors & contributors. -->

    <!-- Map modules, i.e. objectives, regions, spawns. -->

    </map>



<br/>

#### Authors & Contributors {#authors_contributors}
The authors and contributors elements provide information about who created and helped create the map. There can be multiple authors and contributors to a map. The contribution attribute should be used to specify what their contribution to the map was.

A players name should **not** be used to credit them, instead their UUID should be used. A UUID is a unique user identifier that is used to keep track of players even if they change their name. You can check player UUID's at [mcuuid.net](http://mcuuid.net). If an author or contributor is defined without a UUID that player will not get any mapmaker perks on the map. The mapmaker perks include being able to join the map as if they had a premium rank, and a designated map maker star.
<h5>Author or Contributor Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<author>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A major author of the map, used in
          <code>{{'<authors>' | escape_once}}</code>
          <br/>
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<contributor>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A contributor to the map, used in
          <code>{{'<contributors>' | escape_once}}</code>
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Author & Contributor Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>contribution</code>
        </td>
        <td>The contribution this author or contributor made to the map.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>uuid</code>
        </td>
        <td>UUID used to identify a player.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <!-- Major map authors. -->
    <authors>
        <author>aPerson</author>
        <author uuid="ef4ea031-998f-4ec9-b7b6-1bdd428bcef8" contribution="Clarification of element usage, etc."/> <!-- Plastix -->
        <author uuid="260004f0-996b-4539-ba21-df4ee6336b63"/> <!-- Elliott_ -->
    </authors>

    <!-- People that contributed in some way to the map. -->
    <contributors>
        <!-- Credit a person that doesn't have a minecraft account -->
        <contributor contribution="A contribution">aHelper</contributor>
        <contributor uuid="3fbec7dd-0a5f-40bf-9d11-885a54507112" contribution="Some Help"/> <!-- Cubist -->
    </contributors>


<br/>

#### Map Gamemode {#gamemode}

The gamemode element is used to specify the gamemode(s) of the map.
This mainly affects how the map is categorized and displayed.
If no `<gamemode>` tags are specified the map will set the gamemode(s) to whatever modules are used.
This means that a map that uses destroyables and flags would be listed as a "DTM & CTF" unless specified otherwise.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<gamemode> </gamemode>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The gamemode(s) of this map.
        </td>
        <td>
          <span class='label label-primary'>Gamemode ID</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Gamemode ID's</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>ID</th>
        <th>Description</th>
        <th>ID</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>tdm</code>
        </td>
        <td>Team Deathmatch</td>
        <td>
          <code>ctw</code>
        </td>
        <td>Capture the Wool</td>
      </tr>
      <tr>
        <td>
          <code>ctf</code>
        </td>
        <td>Capture the Flag</td>
        <td>
          <code>dtc</code>
        </td>
        <td>Destroy the Core</td>
      </tr>
      <tr>
        <td>
          <code>dtm</code>
        </td>
        <td>Destroy the Monument</td>
        <td>
          <code>ad</code>
        </td>
        <td>Attack/Defend</td>
      </tr>
      <tr>
        <td>
          <code>koth</code>
        </td>
        <td>King of the Hill</td>
        <td>
          <code>blitz</code>
        </td>
        <td>Blitz</td>
      </tr>
      <tr>
        <td>
          <code>rage</code>
        </td>
        <td>Rage</td>
        <td>
          <code>scorebox</code>
        </td>
        <td>Scorebox</td>
      </tr>
      <tr>
        <td>
          <code>arcade</code>
        </td>
        <td>Arcade</td>
        <td>
          <code>gs</code>
        </td>
        <td>Ghost Squadron</td>
      </tr>
      <tr>
        <td>
          <code>ffa</code>
        </td>
        <td>Free-for-All</td>
        <td>
          <code>mixed</code>
        </td>
        <td>Mixed Gamemodes</td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <!-- A FFA map with scoreboxes -->
    <gamemode>ffa</gamemode>
    <gamemode>scorebox</gamemode>
