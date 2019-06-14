---
layout: page

category: "Modules"
title:  "World & Terrain"
nav_content:
  - path: "#terrain"
    name: "Terrain"
  - path: "#internal"
    name: "Internal Maps"

---

### Terrain {#terrain}
A world's terrain generator can be modified to use a specific seed, world and/or whether the vanilla chunk generator is used. By default a new random seed is generated for each match, unless one is specified in the seed attribute.

When using the vanilla generator the default minecraft terrain generator will be used instead of generating null chunks.
The specific world generation rules such as flat worlds, etc., can be changed by editing the world's `level.dat` file with a NBT editor. The `RandomSeed` value in the level data file is not used.

Any chunks not in the world's `region/` folder will be generated according to the minecraft chunk generation rules. This means that only the terrain that you have modified needs to be saved with the world.


The `world=""` attribute is used to specify the sub-folder that contains the map's `region/` and `level.dat` files.
This is used with [conditionals](/modules/includes_conditionals#conditionals) to automatically load the holiday versions of the map, etc.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<terrain/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A node defining properties for this world's generator.
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Terrain Attributes</h5>
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
          <code>world</code>
        </td>
        <td>
          The level data sub-folder to be used with this map.
        </td>
        <td>
          <span class='label label-primary'>Sub-folder Name</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>vanilla</code>
        </td>
        <td>
          Specify if this world is uses the vanilla or null chunk generator.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>seed</code>
        </td>
        <td>
          This worlds generation seed.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>pre-match-physics</code>
        </td>
        <td>
          Allow physics events, such as water flowing, before the match starts.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>remove-36</code>
        </td>
        <td>
          Removes <a href='/reference/inventory#material_finder'>block 36</a> prior to loading a map if set to true.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
    <terrain vanilla="true" seed="qwerty"/>

    <!-- Christmas world conditional -->
    <if christmas="true">
        <terrain world="christmas"/>
    </if>
    <if christmas="false">
        <terrain world="normal"/>
    </if>

<br/>

### Internal Maps {#internal}
Maps that are entirely indoors or underground can use the `internal` attribute on the [main map element](/modules/main)
to prevent observers from accidentally teleporting on top of the map with the compass tool.
In order for this to work, the exterior of the map must be completely filled in with solid blocks,
all the way up to the maximum build height.

See [Main Map Element](/modules/main)
