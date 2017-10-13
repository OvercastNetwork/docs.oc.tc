---
layout: page

category: "Modules"
title:  "Scoring"
nav_content:
  - path: "#overview"
    name: "Overview"
  - path: "#score_boxes"
    name: "Score Boxes"
  - path: "#redeemables"
    name: "Redeemables"
  - path: "#time_limit"
    name: "Time Limit"

---

### Overview {#overview}

The score module can be used to give matches a score limit and modify how many points are added to the score for each kill or death. It can also be used to create score boxes that give a player or team a certain amount of points when they enter it.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Score Element</th>
        <th>Description</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<score> </score>' | escape_once}}</code>
          </span>
        </td>
        <td colspan='3'>Node containing the score settings and score boxes.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
        <th>Default</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<limit>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Max score that can be reached before the match ends.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td>
          No limit
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<kills>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Points to <strong>give</strong> to a team for killing an enemy player
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          0
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<deaths>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Points to <strong>deduct</strong> from a team for the <strong>accidental</strong> death of a team member
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          0
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<box>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single score box.
        </td>
        <td>
          <a href='#score_box'>Score Box</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <score>
        <!-- First team to reach 100 points wins the match -->
        <limit>100</limit>

        <kills>3</kills> <!-- +3 points for every kill -->
        <deaths>2</deaths> <!-- -2 points for accidentally dying -->
    </score>


<br/>

#### Score Boxes {#score_boxes}
A score box will give points to a players team when they enter or bring a redeemable item to the score box region. [Portals](/modules/portals) should be setup to remove the player from the immediate vicinity of the score box to prevent multiple scores.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Score Box Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<box>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single score box.
        </td>
        <td>
          <span class='label label-default'>Score Box Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Score Box Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Type</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>points</code>
        </td>
        <td>Points awarded for entering the box.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>0</td>
      </tr>
      <tr>
        <td>
          <code>silent</code>
        </td>
        <td>Don't notify players when points are scored in this box.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          The location and size of the score box.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter who can score in this box.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>
          <span class='label label-default'>No Filter</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>trigger</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Dynamic conditions under which this score box is applied.
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filter</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Score Box Sub-elements</h5>
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
            <code>{{'<redeemables>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Items that can be redeemed at this score box for points.
        </td>
        <td>
          <code>{{'<item points="1">' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<region>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The region where this score box is located.
        </td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter who can score in this box.
        </td>
        <td>
          <a href='/modules/regions'>Filters</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<trigger>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Dynamic conditions under which this score box is applied.
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filters</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <score>
        <!-- Only allow red team to use this score box, and give them two points -->
        <box points="2" filter="only-red">
            <region><cylinder base="21,8,63" radius="1" height="2"/></region>
        </box>
    </score>

    <score>
        <box value="8" filter="cyan" region="cyan-scorebox"/>
    </score>

<br/>

#### Redeemables {#redeemables}
A score box can also award points in exchange for particular items carried by the player when they
enter the box. These items are defined inside a `<redeemables>` score box sub-element as `<item>` tags.
Each item contains a [material name](/reference/inventory#material_finder)
and an optional `points="..."` attribute specifying the number of points awarded for each item.

Example

    <score>
        <box filter="only-red" region="red-depot">
            <redeemables>
                <item points="5">diamond</item>
                <item points="3">emerald</item>
                <item points="1">gold nugget</item>
            </redeemables>
        </box>
    </score>


<br/>

#### Time Limit {#time_limit}
Give the match a time limit, the result attribute determines how the winning team or player is calculated when the time runs out.
Result can be the name of a team, or one of the special values; "tie" for no winner, or "objectives" for the team that has the most objectives completed. The time limit can be specified in minutes, etc., by formatting it as a [time period](/reference/time_periods).

`NOTE!` This tag is **not** placed inside the score module, instead it is located in the root `<map>` element.

    <time result="objectives">5m</time>


##### Time Attributes

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Type</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>result</code>
        </td>
        <td>
          Change how the winning team or player is calculated.
          <br/>
          Accepts <code>default</code>, <code>tie</code>, <code>objectives</code> or a Team ID.
        </td>
        <td>
          <span class='label label-primary'>Victory Condition</span>
          |
          <span class='label label-primary'>Team ID</span>
        </td>
        <td>default</td>
      </tr>
      <tr>
        <td>
          <code>show</code>
        </td>
        <td>Show the remaining time in the chat and boss bar.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>
