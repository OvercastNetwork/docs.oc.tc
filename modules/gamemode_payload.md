---
layout: page

category: "Modules"
title:  "Payload"

---

Players have to push a Minecart (known as a "Payload") to the end of their track. There are two setups for this gamemode: Attackers vs. Defenders, and Team vs. Team. Both versions are supported with the following modules.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Payload Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<payloads> </payloads>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the defined payloads.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<payload> </payload>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single payload.
        </td>
        <td>
          <span class='label label-default'>Payload Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Payload Attributes</h5>
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
        <td>Unique identifier used to reference from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The Payload's name.
        </td>
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
          Specify if this Payload is required to win the match.
          <br/>
          Teams completing all of their required payloads will win regardless of score or blitz configuration.
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
          <code>spawn-location</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          Where the Payload initially is spawned on the map. A rail must be below it.
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>location</code>
        </td>
        <td>
          Where the Payload must be pushed to in order for the game to yield a win result.
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>owner</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The owner of the Payload.
        </td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>friendly-points</code>
        </td>
        <td>Gives the owning team points when the payload reaches the starting rail, useful for team vs. team.</td>
        <td>
          <span class='label label-primary'>0 - 100</span>
        </td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <code>initial-owner</code>
        </td>
        <td>Gives the team specified control of the payload on match start.</td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>radius</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The radius around the Payload that players must stand in for the Payload to automatically move towards the designated location.
        </td>
        <td>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>show-progress</code>
        </td>
        <td>
          Show the Payload's progression in the scoreboard.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>decay</code>
        </td>
        <td>
          Payload progress decay, rate at which progress reverts while nobody is next to the Payload. 
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>oo</td>
      </tr>
      <tr>
        <td>
          <code>yaw</code>
        </td>
        <td>
          Specifies which direction the Payload faces upon loading into the match.
        </td>
        <td>
          <span class='label label-primary'>yaw</span>
        </td>
        <td>0</td>
      </tr>
    </tbody>
  </table>
</div>
    <payloads time-multiplier="0.25" capture-time="4s" recovery="4" decay="7" empty-decay="1">
         <payload name="Payload" id="payload" spawn-location="0.5,22.0,0.5" location="59.5,22.0,33.5" radius="3" yaw="180.0" owner="blue-team" neutral-state="false" capture-rule="majority" enemy-speed="1.25" friendly-speed="1.25" required="false" friendly-points="1" points="1" checkpoint-material="activator rail" friendly-checkpoints="true"/>

    </payloads>
