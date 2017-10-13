---
layout: page

category: "Modules"
title:  "Damage & Disable Damage"
nav_content:
  - path: "#friendly_fire"
    name: "Friedly Fire"
  - path: "#difficulty"
    name: "Difficulty"
  - path: "#hunger"
    name: "Hunger"
  - path: "#filtering"
    name: "Damage Filtering"
  - path: "#disable"
    name: "Disable Damage"

---

### Friendly Fire
Allows teammates to kill each other. Arrows will be absorbed if they hit a teammate.

    <friendlyfire>on</friendlyfire> <!-- Defaults to off -->

Refunds arrows blocked by teammates from non-infinity bows.

    <friendlyfirerefund>off</friendlyfirerefund> <!-- Defaults to on -->

<br/>

### Difficulty
The difficulty level can be set to `peaceful`, `easy`, `normal`, or `hard`. The default is `hard`.

    <difficulty>easy</difficulty> <!-- Defaults to hard -->

<br/>

### Hunger
Specify if a player can starve to death, usually used with the difficulty setting.<br/>
This can also be accomplished with the `naturalRegeneration` [gamerule](/modules/gamerules).

    <hunger>
        <depletion>off</depletion>
    </hunger>

<br/>

### Damage Filtering {#filtering}

This module is used to filter when or if damage is applied to entities.
Its contents can be a filter or combination of filters.
It doesn't have to be `<allow>` and `<deny>` at the top level but that's usually what you want.
Regions can also be used since they are filters that filter for a location.

Examples

    <damage>
        <deny>
            <cause>explosion</cause>
        </deny>
    </damage>

    <!-- Deny damage events where the attacker is on the red team -->
    <damage>
        <deny>
            <attacker>
                <team>red</team>
            </attacker>
        </deny>
    </damage>

<br/>

### Disable Damage {#disable}
Use this module to disable damage from specific causes.

While almost every form of damage can be disabled safely it is recommended that you do **not** disable `VOID` damage.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Disable Damage Element</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<disabledamage> </disabledamage>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing the disabled damage types.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<damage> </damage>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The damage type that is disabled.
        </td>
        <td>
          <a href='#causes'>Damage Cause</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <disabledamage>
        <!-- Disable fall damage -->
        <damage>fall</damage>
    </disabledamage>


<br/>

### Block Explosion Attributes

The `BLOCK_EXPLOSION` damage cause has several extended attributes to customize who/what gets damaged. Only attributes with `false` as the value need to be explicitly defined since all attributes default to `true`.

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
          <code>ally</code>
        </td>
        <td>Damage to players on the same team as the person that caused the explosion.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>self</code>
        </td>
        <td>Damage to the person that caused the explosion.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>enemy</code>
        </td>
        <td>Damage to players not on the same team as the person that caused the explosion.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>other</code>
        </td>
        <td>Any other damage caused by the explosion.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <disabledamage>
        <!-- TNT damages enemies and self, but not teammates -->
        <damage ally="true" self="false" enemy="false" other="false">block explosion</damage>
    </disabledamage>


<br/>

### Damage Causes
The following damage causes can be used in the disable damage module.
These causes do not need to be capitalized or contain underscores, i.e., `FIRE_TICK` and `fire tick` will both work.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>CONTACT</code>
        </td>
        <td>
          Damage caused when an entity contacts a block such as a Cactus.
        </td>
      </tr>
      <tr>
        <td>
          <code>ENTITY_ATTACK</code>
        </td>
        <td>
          Damage caused when an entity attacks another entity.
        </td>
      </tr>
      <tr>
        <td>
          <code>PROJECTILE</code>
        </td>
        <td>
          Damage caused when attacked by a projectile.
        </td>
      </tr>
      <tr>
        <td>
          <code>SUFFOCATION</code>
        </td>
        <td>
          Damage caused by being put in a block.
        </td>
      </tr>
      <tr>
        <td>
          <code>FALL</code>
        </td>
        <td>
          Damage caused when an entity falls a distance greater than 3 blocks.
        </td>
      </tr>
      <tr>
        <td>
          <code>FIRE</code>
        </td>
        <td>
          Damage caused by direct exposure to fire.
        </td>
      </tr>
      <tr>
        <td>
          <code>FIRE_TICK</code>
        </td>
        <td>
          Damage caused due to burns caused by fire.
        </td>
      </tr>
      <tr>
        <td>
          <code>MELTING</code>
        </td>
        <td>
          Damage caused due to a snowman melting.
        </td>
      </tr>
      <tr>
        <td>
          <code>LAVA</code>
        </td>
        <td>
          Damage caused by direct exposure to lava.
        </td>
      </tr>
      <tr>
        <td>
          <code>DROWNING</code>
        </td>
        <td>
          Damage caused by running out of air while in water.
        </td>
      </tr>
      <tr>
        <td>
          <code>BLOCK_EXPLOSION</code>
        </td>
        <td>
          Damage caused by being in the area when a block explodes.
        </td>
      </tr>
      <tr>
        <td>
          <code>ENTITY_EXPLOSION</code>
        </td>
        <td>
          Damage caused by being in the area when an entity, such as a Creeper, explodes.
        </td>
      </tr>
      <tr>
        <td>
          <code>VOID</code>
        </td>
        <td>
          Damage caused by falling into the void.
        </td>
      </tr>
      <tr>
        <td>
          <code>LIGHTNING</code>
        </td>
        <td>
          Damage caused by being struck by lightning.
        </td>
      </tr>
      <tr>
        <td>
          <code>SUICIDE</code>
        </td>
        <td>
          Damage caused by committing suicide using the command "/kill".
        </td>
      </tr>
      <tr>
        <td>
          <code>STARVATION</code>
        </td>
        <td>
          Damage caused by starving due to having an empty hunger bar.
        </td>
      </tr>
      <tr>
        <td>
          <code>POISON</code>
        </td>
        <td>
          Damage caused due to an ongoing poison effect.
        </td>
      </tr>
      <tr>
        <td>
          <code>MAGIC</code>
        </td>
        <td>
          Damage caused by being hit by a damage potion or spell.
        </td>
      </tr>
      <tr>
        <td>
          <code>WITHER</code>
        </td>
        <td>
          Damage caused by Wither potion effect.
        </td>
      </tr>
      <tr>
        <td>
          <code>FALLING_BLOCK</code>
        </td>
        <td>
          Damage caused by being hit by a falling block which deals damage.
        </td>
      </tr>
      <tr>
        <td>
          <code>THORNS</code>
        </td>
        <td>
          Damage caused in retaliation to another attack by the Thorns enchantment.
        </td>
      </tr>
      <tr>
        <td>
          <code>CUSTOM</code>
        </td>
        <td>
          Custom damage.
        </td>
      </tr>
    </tbody>
  </table>
</div>

Copied from: [bukkit docs - Damage Cause](https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/event/entity/EntityDamageEvent.DamageCause.html)
