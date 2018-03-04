---
layout: page

category: "Modules"
title:  "Blitz"

---

The game will run for a specified amount of time, players will have to find and kill enemy players.
Each player has a limited amount of lives, and after they are used up the player is moved to the observer team.
The match ends after the specified amount of time, or when one team is eliminated.
If the match timer ends before a team is eliminated the team with the most players remaining wins.

The blitz module is used with the [Ghost Squadron](/modules/gamemode_other#gs) gamemode, and is also often combined with the [rage](/modules/gamemode_other#rage) module.

Blitz maps should include the [global blitz XML](https://github.com/OvercastNetwork/maps.oc.tc/blob/master/Include/blitz-global.xml) file.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Blitz Element</th>
        <th>Description</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<blitz> </blitz>' | escape_once}}</code>
          </span>
        </td>
        <td colspan='3'>A node containing the blitz gamemode settings.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
        <th>Default</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<lives>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The amount of lives each player has before they are out of the match.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<broadcastLives>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Broadcast to the player the amount of lives they have left.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>

Example:

    <blitz>
        <lives>1</lives>
        <broadcastLives>false</broadcastLives>
    </blitz>

    <!-- Time till the match ends in minutes -->
    <time>10m</time>

    <include src="blitz-global.xml"/>
    
Example using team filters, defining a custom amount of lives for each team:

    <blitz>
        <rule filter="only-red" lives="1"/>
        <rule filter="only-blue" lives="2"/>
    </blitz>

````
<blitz/>    <!-- Use the default blitz settings -->
````
