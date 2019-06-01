---
layout: page

category: "Modules"
title:  "Capture the Wool"

---

Players have to retrieve wool blocks from the enemy teams side of the map and then put them on their victory monument(s). The area a wool has to be placed in is protected by default to prevent it from being blocked with another block.

    <wools>
        <wool team="blue" color="lime">
            <monument><block>0.5,11,-92.5</block></monument>
            <!-- Blue team has to place a lime wool block at 0.5,11,-92.5 to win -->
        </wool>
        <wool team="green" color="light blue" craftable="false">
            <monument><block>0.5,11,93.5</block></monument>
            <!-- Light blue wool can not be crafted, it must be picked up -->
        </wool>
    </wools>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Wools Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<wools> </wools>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the wools for this map.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<wool> </wool>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A wool victory monument.
        </td>
        <td>
          <span class='label label-default'>Wool Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Wool Attributes</h5>
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
          <code>id</code>
        </td>
        <td>Unique identifier used to reference wool monuments from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>required</code>
        </td>
        <td>
          Specify if this objective is required to win the match.
          <br/>
          Teams completing all of their required objectives will win regardless of score or blitz configuration.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>team</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The team which has to place the wool.
        </td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>color</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The wools color.
        </td>
        <td>
          <a href='/reference/colors'>Dye Color Name</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>monument</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          The monument where the wool has to be placed.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>craftable</code>
        </td>
        <td>Specify if the wool can be crafted, e.g. with white wool and dye.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>show</code>
        </td>
        <td>
          Specify if the objective should be hidden from all visible locations to the player. These locations include chat, the boss bar, and the scoreboard.
          <br/>
          <i>If set to false, the objective will not be logged to the database and the player will not receive any raindrops upon completion.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>location</code>
        </td>
        <td>
          <span class='label label-danger' title='Required after proto 1.3.4'>Required</span>
          Location where the wool can be found at, used to determine proximity.
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>wool-proximity-metric</code>
        </td>
        <td>
          Metric used to determine proximity to the wool.
          <br/>
          Accepts <code>closest player</code>, <code>closest block</code> or <code>closest kill</code>
        </td>
        <td>
          <span class='label label-primary'>Proximity Metric</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>wool-proximity-horizontal</code>
        </td>
        <td>
          Only calculate horizontal distance for wool proximity.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>monument-proximity-metric</code>
        </td>
        <td>
          Metric used to determine proximity to the monument.
          <br/>
          Accepts <code>closest player</code>, <code>closest block</code> or <code>closest kill</code>
        </td>
        <td>
          <span class='label label-primary'>Proximity Metric</span>
        </td>
        <td>
          <code>closest block</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>monument-proximity-horizontal</code>
        </td>
        <td>
          Only calculate horizontal distance for monument proximity.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Wool Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<monument>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The monument where the wool has to be placed.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>

You can group multiple victory monuments from the same team inside a single `<wools team="team-id">` element; and then define that teams individual wool colors inside of a `<wool>` element.

    <wools team="red">
        <wool color="cyan" location="32.5,14,0.5">
            <monument><block>-60,26,-118</block></monument>
        </wool>
        <wool color="lime" location="0.5,10,21.5">
            <monument><block>-60,26,-121</block></monument>
        </wool>
    </wools>

    <wools team="blue">
        <wool color="magenta" location="-32.5,14,0.5" monument="magenta-monument"/>
        <wool color="lime" location="0.5,10,21.5" monument="lime-monument"/>
    </wools>
