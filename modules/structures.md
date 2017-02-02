---
layout: page

category: "Modules"
title:  "Structures"

---


<p>
  Structures are sets of blocks that can be dynamically copied into the world in response to match events.
  The original structure is built into the map by the mapmaker, and defined in XML with regions.
  When the match loads, the original structures are cleared from the world and saved.
</p>
<p>
  Structures are brought to life by something called a
  <em>dynamic.</em>
  This is an XML construct that causes a structure to appear at a specified location in reaction to a given
  <a href='/modules/filters'>filter.</a>
  Whenever the filter is in a passing state (when it has a value of
  <code>ALLOW</code>
  or
  <code>ABSTAIN</code>
  ), the structure will appear.
  When the filter is not passing, (when its value is
  <code>DENY</code>
  ), the structure will disappear.
</p>
<p>
  Structures are a very powerful feature that can be used to implement an endless variety of custom game mechanics.
</p>
<div class='alert alert-warning alert-small'>
  <div class='clearfix'>
    <i class='fa fa-2x fa-exclamation-triangle'></i>
    <p class='alert-content'>
      Currently, only
      <a href='/modules/filters#objectiveFilter'>objective filters</a>
      , time filters, and
      <a href='/modules/filters#flagFilter'>flag filters</a>
      can be used with dynamic structures, as well as
      <a href='/modules/filters#filterModifiers'>filter modifiers.</a>
      <br/>
      Other filter types may be supported in the future.
    </p>
  </div>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<structures> </structures>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Element containing all structures and dynamics
        </td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<structure>' | escape_once}}</code>
          </span>
        </td>
        <td>Defines a block structure that is part of the map</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<dynamic>' | escape_once}}</code>
          </span>
        </td>
        <td>Causes a structure to be placed/removed at some location in reaction to a filter</td>
      </tr>
    </tbody>
  </table>
</div>
<h5 id='structureAttributes'>Structure Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th width='15%'>Value</th>
        <td width='25%'>Default</td>
      </tr>
    </thead>
    <tbody>
      <tr id='structureId'>
        <td>
          <code>id</code>
        </td>
        <td>Unique identifier used to reference the structure from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be an attribute or sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          A single region containing the structure.
        </td>
        <td>
          <a href='/modules/regions'>Cuboid Region</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>origin</code>
        </td>
        <td>
          A location used as the reference point when specifying destination points for the structure.
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td>
          Low corner of
          <code>region</code>
          bounding box.
        </td>
      </tr>
      <tr>
        <td>
          <code>air</code>
        </td>
        <td>
          Whether air blocks should be considered part of the structure.
          If true, empty blocks in the structure's region will be copied along with it, clearing any blocks at the destination.
          If false, air blocks are not copied and the structure is mixed in with blocks at the destination.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>clear</code>
        </td>
        <td>
          Whether to clear the original structure when the match loads.
          If true, the structure's region will be filled with air, and players will never see it.
          If false, the original structure is not modified.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>
<h5 id='dynamicAttributes'>Dynamic Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th width='15%'>Value</th>
        <td width='25%'>Default</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>id</code>
        </td>
        <td>Unique identifier used to reference the dynamic from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>structure</code>
        </td>
        <td>
          <code>id</code>
          of the structure to place.
        </td>
        <td>
          <a href='#structureId'>Structure ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Conditions under which the structure is placed.
          <br/>
          <em>
            Only
            <code>{{'<objective>' | escape_once}}</code>
            ,
            <code>{{'<time>' | escape_once}}</code>
            , and flag-related filters are currently supported.
          </em>
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>
          <code>{{'<always/>' | escape_once}}</code>
          <br/>
          (structure is permanently placed)
        </td>
      </tr>
      <tr>
        <td>
          <code>trigger</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Dynamic conditions under which the structure is placed.
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>location</code>
        </td>
        <td>
          Location to place the structure at. The structure's
          <code>origin</code>
          will be at this point.
          <br/>
          <em>
            This is an alternative to
            <code>offset</code>
          </em>
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>offset</code>
        </td>
        <td>
          Relative position to place the structure at.
          The structure will be translated by this amount from it's original location.
          <br/>
          <em>
            This is an alternative to
            <code>location</code>
          </em>
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td>
          0,0,0
          <br/>
          (structure placed at its original location)
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h2 id='examples'>Examples</h2>
    <structures>
        <!-- Define a 25x2x7 cuboid structure called blue-bridge -->
        <!-- The original structure is high in the sky around 0,0 -->
        <structure id="blue-bridge" air="false">
            <region>
                <cuboid min="0,192,0" size="25,2,7"/>
            </region>
        </structure>

        <!-- Define a cylindrical structure called tower, using a close fitting cuboid -->
        <!-- The original structure is built in an area outside the map, around 400,400 -->
        <structure id="tower" origin="400,64,400">
            <region>
                <cuboid min="397,64,397" size="6,12,6"/>
            </region>
        </structure>

        <!-- Make blue-bridge appear whenever Blue Team owns the control-point called "hill" -->
        <!-- The bridge will appear 128 blocks directly below it's original location -->
        <dynamic structure="blue-bridge" offset="0,-128,0">
            <filter>
                <objective team="blue-team">hill</objective>
            </filter>
        </dynamic>

        <!-- Start the match with a tower at 36,64,0 -->
        <!-- After 5 minutes, move the tower to -36,64,0 -->
        <!-- After 10 minutes, remove the tower -->
        <dynamic structure="tower" location="36,64,0">
            <filter>
                <not>
                    <time>5m</time>
                </not>
            </filter>
        </dynamic>

        <dynamic structure="tower" location="-36,64,0">
            <filter>
                <all>
                    <time>5m</time>
                    <not>
                        <time>10m</time>
                    </not>
                </all>
            </filter>
        </dynamic>
    </structures>
