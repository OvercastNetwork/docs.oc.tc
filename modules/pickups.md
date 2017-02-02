---
layout: page

category: "Modules"
title:  "Pickups"

---

Pickups are used to create a pickup-able kit at a specific location.
While somewhat similar to a kit applied using a region, pickups are represented by a physical object and have a refresh time.

By default an ender crystal entity is used to show the pickup location.
When a player walks into the crystal it gives them a kit and then de-spawns.
The crystal will respawn again at a _random_ location inside the specified region after the set respawn time.
This means that the pickup's region must be randomize-able, e.g. a `<cuboid>`, `<cylinder>`, `<block>` or `<point>`.
A `<point>` region does not return a randomized position but can still be used to specify an exact location for a pickup.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Pickups Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<pickups> </pickups>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the pickups.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<pickup/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single pickup.
        </td>
        <td>
          <span class='label label-default'>Pickup Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Pickup Attributes</h5>
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
          <code>id</code>
        </td>
        <td>
          Unique identifier used to reference this pickup from other places in the XML.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>The display name of this pickup, shown above the pickup entity if present.</td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>appearance</code>
        </td>
        <td>
          Entity used to show this pickup's location.<br/>
          Currently only accepts <code>ENDER CRYSTAL</code>
        </td>
        <td>
          <a href='/reference/entity_types'>Entity Type</a>
        </td>
        <td>
          <span class='label label-default'>Ender Crystal</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>spawn-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter if this pickup is and can be spawned.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>
          <code>{{'<always/>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>pickup-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter who can pick up the pickup's kit.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>
          <code>{{'<always/>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          Region where the pickup entity is placed into.
        </td>
        <td>
          <a href='/modules/regions'>Randomize-able Region</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>kit</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          The kit to give to players who pick up this pickup.
        </td>
        <td>
          <a href='/modules/kits'>Kit ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>respawn-time</code>
        </td>
        <td>
          Time until the pickup entity is re-spawned after being picked up.
          <br/>
          If set to zero the entity will not despawn and will simply be refreshed.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>
          3 sec
        </td>
      </tr>
      <tr>
        <td>
          <code>pickup-time</code>
        </td>
        <td>
          Time until the pickup is refreshed and can be picked up again.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>
          3 sec
        </td>
      </tr>
      <tr>
        <td>
          <code>effects</code>
        </td>
        <td>
          Show the pickup's particle effects.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>sounds</code>
        </td>
        <td>
          Play the pickup's sound effects.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Pickup Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<spawn-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter if this pickup is and can be spawned.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
        <td>
          <code>{{'<always/>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<pickup-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter who can pick up the pickup's kit.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
        <td>
          <code>{{'<always/>' | escape_once}}</code>
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
          Region where this pickup is placed into.
        </td>
        <td>
          <a href='/modules/regions'>Randomize-able Regions</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<kit>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          The kit to give to players who pick up this pickup.
        </td>
        <td>
          <a href='/modules/kits'>Kits</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <pickups>
        <pickup id="archer-pickup" name="`3Archery" region="archery-tower" kit="archery-kit" refresh="5m"/>
        <pickup id="healing-pickup" name="`4Healing Station" region="heal-station" refresh="1m">
            <kit>
                <effect duration="10" amplifier="4">instant_health</effect>
            </kit>
        </pickup>
    </pickups>

    <pickups>
        <pickup id="speed-powerup" region="powerups" kit="speed-kit" refresh="10s"/>
        <!-- ... -->
        <pickup id="poison-powerdown" region="powerups" kit="poison-kit" refresh="10s"/>
    </pickups>
