---
layout: page

category: "Modules"
title:  "Gamerules"

---

Minecraft's built in game rules can be set via the `<gamerules>` module. Not all gamerules are supported, the table below lists which are supported.

When stopping the daylight cycle, you should either use the `<doDaylightCycle>` gamerule, or the [timelock](/modules/other_settings#timelock) element.  One will overwrite the other, so be consistent.

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
            <code>{{'<gamerules> </gamerules>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing the defined game rules.</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Supported Gamerule Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Values</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<doFireTick>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether firespread occurs.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<doTileDrops>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether tile entities drop.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<doMobLoot>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether mobs drop loot on death.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<mobGriefing>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether mobs such as Creepers and Endermen cause enviromental damage.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<naturalRegeneration>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether or not players naturally regain heath.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<doDaylightCycle>' | escape_once}}</code>
          </span>
        </td>
        <td>Toggles whether or not the time tick occurs.</td>
        <td>
          <span class='label label-primary'>true / false</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <gamerules>
        <doDaylightCycle>false</doDaylightCycle>
        <naturalRegeneration>false</naturalRegeneration>
    </gamerules>


<br/>

#### Unsupported Gamerules

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Rule</th>
        <th>Reason</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>doMobSpawning</code>
        </td>
        <td>
          Not supported in favor of the
          <a href='/modules/mobs'>mobs</a>
          module.
        </td>
      </tr>
      <tr>
        <td>
          <code>keepInventory</code>
        </td>
        <td>Not supported since PGM already solves this with kits.</td>
      </tr>
      <tr>
        <td>
          <code>commandBlockOutput</code>
        </td>
        <td>Command blocks are disabled in PGM.</td>
      </tr>
      <tr>
        <td>
          <code>logAdminCommands</code>
        </td>
        <td>Not useful in custom maps.</td>
      </tr>
      <tr>
        <td>
          <code>randomTickSpeed</code>
        </td>
        <td>Not useful in custom maps.</td>
      </tr>
      <tr>
        <td>
          <code>reducedDebugInfo</code>
        </td>
        <td>Not useful in custom maps.</td>
      </tr>
      <tr>
        <td>
          <code>sendCommandFeedback</code>
        </td>
        <td>Not useful in custom maps.</td>
      </tr>
      <tr>
        <td>
          <code>showDeathMessages</code>
        </td>
        <td>Not useful in custom maps.</td>
      </tr>
    </tbody>
  </table>
</div>
