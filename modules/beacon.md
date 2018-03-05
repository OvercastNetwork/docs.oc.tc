---
layout: page

category: "Modules"
title:  "Beacon"

---

Beacons are used to signify important locations, such as objectives. They can also be used in substitution for actual beacons when necessary.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Beacon Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<beacons> </beacons>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the defined beacons.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<beacon> </beacon>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single beacon.
        </td>
        <td>
          <span class='label label-default'>Beacon Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Beacon Attributes</h5>
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
          <code>location</code>
        </td>
        <span class='label label-danger'>Required</span>
        <td>A vector location that specifies where the beam spawns.</td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>color</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The dye color used to assign the beam's color.
        </td>
        <td>
          <span class='label label-primary'>Dye Color</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>particle-count</code>
        </td>
        <td>
          How many particles should spawn in place of the beacon.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          40
        </td>
      </tr>
      <tr>
        <td>
          <code>visibility-filter</code>
        </td>
        <td>
           Filters whether or not a player can see it.
        </td>
        <td>
          <span class='label label-primary'>Filter</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <beacons>
          <beacon location=�4.5,4.0,-21.5� color=�blue� particle-count=�200� visibility-filter=�iamafilter�/>
          <beacon location=�14.5,4.0,-21.5� color=�red�/>
    </beacons>
