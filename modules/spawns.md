---
layout: page

category: "Modules"
title:  "Spawns"
nav_content:
  - path: "#overview"
    name: "Overview"
  - path: "#respawn"
    name: "Respawn Module"

---

### Overview {#overview}

The spawns module is required in a complete map XML because it specifies where players and observers can spawn. Default and observer spawns are defined with the `<default>` element and all other spawns in `<spawn>` elements. Only one default spawn element may be defined per map.

Multiple spawns from the same team can be grouped inside of a single `<regions>` element inside `<spawns team="team-id">`. Spawn positions are picked randomly inside of the defined regions. Since the plugin will not validate the spawn position by default, regions should be checked to make sure that they don't intersect with solid objects or are midair. Spawns can also be defined with the `safe="true"` attribute, PGM will then check that the player spawns on a solid object and not midair.

The regions element accepts more than one region or region area. If they are not inside a `<union>` element one region will be picked at random for each spawn event.

Respawn behavior such as delays, etc. can be customized with the [respawn](#respawn) module.

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
            <code>{{'<spawns> </spawns>' | escape_once}}</code>
          </span>
        </td>
        <td colspan='2'>A node containing the spawns for this map.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<spawn>' | escape_once}}</code>
          </span>
        </td>
        <td>An individual spawn where a team will spawn</td>
        <td>
          <code>{{'<regions>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<default>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          The spawn for observers and teams without a spawn.
          <br/>
          <i>Only one default spawn element is allowed per map.</i>
        </td>
        <td>
          <code>{{'<regions>' | escape_once}}</code>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Spawn & Default Element Attributes</h5>
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
          <code>team</code>
        </td>
        <td>The team this spawn applies to.</td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>safe</code>
        </td>
        <td>Validate that the player spawns in a safe location.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>sequential</code>
        </td>
        <td>
          Spawns players at the next region in a list if the one prior to it isn't safe.
          <br/>
          <i>Requires the <code>safe</code> attribute set to true.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>spread</code>
        </td>
        <td>
          Spawn players as far away as possible from enemy players.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>exclusive</code>
        </td>
        <td>
          Spawn regions are assigned exclusively to one player or team and only they will spawn there.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>persistent</code>
        </td>
        <td>
          Once a player has been assigned a spawn they will spawn there even if they leave and rejoin the game.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>kit</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          The kit to apply to players when they are spawned in this spawn.
        </td>
        <td>
          <a href='/modules/kits'>Kit ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter when this spawn is used.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Spawn & Default Element Sub-elements</h5>
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
            <code>{{'<regions>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The region or regions where players will spawn.
        </td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Regions Element Attributes</h5>
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
          <code>angle</code>
        </td>
        <td>
          The exact block coordinates that the player looks at when spawned.
          <br/>
          <i>This attribute will negate any angles set by the <code>yaw</code> and <code>pitch</code> attributes.</i>
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>yaw</code>
        </td>
        <td>
          The horizontal angle the player looks to when spawned.
          <br/>
          <i>South 0, East -90, North 180 and West 90.</i>
        </td>
        <td>
          <span class='label label-primary'>-180 to 180</span>
        </td>
        <td>
          0
        </td>
      </tr>
      <tr>
        <td>
          <code>pitch</code>
        </td>
        <td>
          The vertical angle the player looks to when spawned.
          <br/>
          <i>-90 is straight up 90 is straight down.</i>
        </td>
        <td>
          <span class='label label-primary'>-90 to 90</span>
        </td>
        <td>
          0
        </td>
      </tr>
    </tbody>
  </table>
</div>

`TIP:` Copy the yaw and pitch from the F3 screen in minecraft (the `Facing: Direction (Axis) (Yaw/Pitch)` line).

Example

    <spawns>
        <spawn team="red" kit="red">
            <regions yaw="90">
                <cuboid min="-2,13,71" max="-9,13,78"/>
            </regions>
        </spawn>
        <spawn team="blue" kit="blue">
            <regions yaw="-90">
                <cuboid min="2,13,-71" max="9,13,-78"/>
            </regions>
        </spawn>
        <default>
            <regions yaw="0">
                <cuboid min="-1,16,-1" max="2,20,2"/>
            </regions>
        </default>
    </spawns>
<p>
  <a class='btn btn-primary btn-xs btn-more collapsed' data-target='#collapse-spawn-example' data-toggle='collapse'>Examples</a>
</p>
<div class='collapse' id='collapse-spawn-example' markdown='1'>

    <!-- Example spawns from Assualt -->
    <spawns>
        <spawn team="blue" kit="blue">
            <regions yaw="-90">
                <region id="blue-spawn"/>
            </regions>
        </spawn>
        <spawn team="red" region="red-spawn" kit="red">
            <regions yaw="90">
                <region id="red-spawn"/>
            </regions>
        </spawn>
        <default kit="obs">
            <regions yaw="-135">
                <region id="obs-spawn"/>
            </regions>
        </default>
    </spawns>

    <spawns safe="true" sequential="true">
        <spawn team="blue" kit="blue" yaw="180">
            <regions>
                <cuboid min="-10,71,5" max="12,126,27"/> <!-- Players will spawn here first -->
                <cuboid min="-10,6,5" max="12,6,27"/> <!-- Secondary spawn if the first isn't available -->
                <point>1,8,0</point> <!-- Tertiary spawn if all other team spawns aren't safe -->
            </regions>
        </spawn>
        <spawn team="red" kit="red" yaw="0">
            <regions>
                <cuboid min="-10,71,-27" max="12,126,-5"/>
                <cuboid min="-10,6,-27" max="12,6,-5"/>
                <point>1,8,0</point>
            </regions>
        </spawn>
    </spawns>

</div>
<br/>

### Respawn Module {#respawn}
The respawn module allows the map creator to adjust the respawn time and if players are automatically respawned. The respawn time must be greater than 1 second (20 ticks), if the respawn time is less it will automatically default to one second, allowing the death to fully complete and the player to be reset properly.

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
            <code>{{'<respawns/>' | escape_once}}</code>
          </span>
        </td>
        <td>Node specifying multiple respawn settings for this map.</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<respawn/>' | escape_once}}</code>
          </span>
        </td>
        <td>Node specifying the respawn settings for this map.</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Respawn Attributes</h5>
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
          <code>delay</code>
        </td>
        <td>
          Delay a players respawn for this duration.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>2s</td>
      </tr>
      <tr>
        <td>
          <code>freeze</code>
        </td>
        <td>
          Freeze the player during the end of the spawn countdown for this duration.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>3s</td>
      </tr>
      <tr>
        <td>
          <code>auto</code>
        </td>
        <td>
          Auto respawn the player after the delay time has elapsed.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>blackout</code>
        </td>
        <td>
          Dead players get a blindness effect applied.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>spectate</code>
        </td>
        <td>
          Allow dead players to fly around.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>bed</code>
        </td>
        <td>
          <span class='label label-danger'>N/A</span>
          Allow players to respawn from beds.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter when this respawn setting is used.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>message</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Message to display on the respawn screen to respawning players.
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Respawn Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 125px;'>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<message>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Message to display on the respawn screen to respawning players.
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <!-- Default auto respawn of 2 seconds -->
    <respawn auto="true"/>

    <!-- Allow players to respawn after 3 seconds, blackout the player when they die -->
    <respawn delay="3s" blackout="true"/>

    <!-- Allow respawning after 5s, display translatable waiting on flag drop respawn message -->
    <respawn delay="5s" spectate="true">
        <message>{translate: "death.respawn.confirmed.waiting.flagDropped"}</message>
    </respawn>

    <!-- Allow respawning after different delays for red and blue team -->
    <respawns>
        <respawn delay="3s" filter="only-red"/>
        <respawn delay="5s" filter="only-blue"/>
    </respawns>
