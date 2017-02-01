---
layout: page

category: "Modules"
title:  "Players"

---

The players module is the basis for all team-less gamemodes, such as FFA, UHC, or hunger games style matches.
This module is not limited to matches focused on combat,
it can also be used in combat-less game modes where players have to collect specific items, etc.
Win conditions are set by using the score and time limit modules.

`NOTE:` This gamemode is not compatible with the teams module!
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
            <code>&lt;players/&gt;</code>
          </span>
        </td>
        <td>The players node, containing player settings.</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Players Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 130px;'>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>min</code>
        </td>
        <td>
          Minimum amount of players required.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>max</code>
        </td>
        <td>
          Player limit -- normal players cannot join the match once it reaches this size.
          <br>
          <i>Premium players may join over this limit until <code>max-overfill</code> is reached.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>max-overfill</code>
        </td>
        <td>
          Player overfill -- premium players cannot join the match once it reaches this size.
          <br>
          <i>Must be greater than the defined <code>max</code>.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>show-name-tags</code>
        </td>
        <td>
          Specify who can see the name tags of players.
          <br>
          Accepts:
          <code>true</code>, <code>false</code>, <code>allies</code> or <code>enemies</code>
        </td>
        <td>
          <span class='label label-primary'>Enum</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>colors</code>
        </td>
        <td>
          Auto assign a unique color to each player, works for up to 10 players and then colors repeat.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <players max="16" max-overfill="20"/>
    <time>8m</time>

    <score>
       <kills>1</kills>
       <deaths>1</deaths>
    </score>
