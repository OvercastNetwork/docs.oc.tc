---
layout: page

category: "Modules"
title:  "Kits"
nav_content:
  - path: "#itemArmor"
    name: "Item &amp; Armor"
  - path: "#game-mode"
    name: "Game-mode"
  - path: "#healthHunger"
    name: "Health &amp; Hunger"
  - path: "#eliminate"
    name: "Eliminate"
  - path: "#teamSwitch"
    name: "Team Switch"
  - path: "#potionEffect"
    name: "Potion Effects"
  - path: "#attributes"
    name: "Attribute Modifiers"
  - path: "#walkSpeed"
    name: "Walk Speed"
  - path: "#knockback"
    name: "Knockback Reduction"
  - path: "#shield"
    name: "Shield"
  - path: "#jump"
    name: "Double Jump"
  - path: "#fly"
    name: "Fly"

---

Kits are groups of items and effects that can be given to players in various ways. There are many types of kits, and they can be
packaged together in any combination.

Kits can be given an `id` attribute, which is used to refer to them in other places.
Kits can contain other kits directly, and can also inherit items from other kits through the `parents=""` attribute.

Some types of kits are *removable*, meaning that the kit can be automatically taken from the player as well as given. When used in certain contexts,
these kits will be automatically removed from the player at an appropriate time. This will be noted in the documentation where applicable.

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
            <code>{{'<kit> </kit>' | escape_once}}</code>
          </span>
        </td>
        <td>A kit node, containing specific kit types and/or other kit nodes.</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Kit Attributes</h5>
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
        <td>Unique identifier used to reference this kit from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter when this kit is used.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>give</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Dynamic filter used to apply the kit.
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>take</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Dynamic filter used to remove the kit.
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>lend</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Kit is applied when the dynamic filter returns allow and removed when it is deny.
          <br/>
          <i>Cannot combine <code>lend</code> property with <code>give</code> or <code>take</code></i>
        </td>
        <td>
          <a href='/modules/filters'>Dynamic Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>parents</code>
        </td>
        <td>The kit's parent or a comma separated list of parent kits.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>force</code>
        </td>
        <td>Force apply the kit.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>potion-particles</code>
        </td>
        <td>
          Enable or disable potion particles.
          <br/>
          <i>Potion particles are disabled for all players by default.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>reset-ender-pearls</code>
        </td>
        <td>Reset any ender pearls the player might have thrown before the kit was applied.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>

The effect of the `force` attribute depends on the type of kit it is used with:
conflicting items or armor will be replaced instead of smartly merged & repaired,
health & hunger will be set instead of only increased,
and potion effects can be replaced with the same effect at a lower level or shorter duration.

    <kits>
        <kit id="spawn" force="true">
            <item slot="0" material="iron sword"/>
            <item slot="8" amount="32" material="bread"/>
            <effect duration="5" amplifier="1">instant_health</effect>
        </kit>
        <kit id="red" parents="spawn">
            <helmet color="cd0000" material="leather helmet"/>
        </kit>
        <kit id="blue" parents="spawn">
            <helmet color="0066cc" material="leather helmet"/>
        </kit>
    </kits>

In the example above players from blue team will get a blue helmet,
players from red team will get a red helmet; both teams will get the items from the spawn kit.
The spawn kit contains a 5 second healing potion to help prevent spawn killing.

<br/>

### Item & Armor Kits {#itemArmor}

Kits can place items in specific slots of a player's inventory, and equip them with armor. See [Items & Armor](/modules/items) for details.

Item kits will replace any items in the player's inventory in slots present in the kit, but they will not alter any other slots.
If you want to guarantee that a slot is empty, put an item called "air" in that slot. You can also clear the player's entire inventory
before applying the kit by using one of the elements below.


##### Inventory Clear Elements

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
            <code>{{'<clear/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Clear the all of the player's inventory including armor slots.
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<clear-items/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Clear only the player's item slots.
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="ender" reset-ender-pearls="true">
        <item slot="0" amount="1" material="ender pearl"/>
        <clear/>
    </kit>


<br/>

### Game-mode Kit {#game-mode}

A player's gamemode can be changed when they spawn or enter a region, etc. by using this kit.

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
            <code>{{'<game-mode> </game-mode>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The gamemode to change the player to.
          <br/>Accepts <code>creative</code>, <code>survival</code>, <code>spectator</code>& <code>adventure</code>.
        </td>
        <td>
          <span class='label label-default'>Game Mode String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="adventure-mode-kit">
        <game-mode>adventure</game-mode>
    </kit>


<br/>

### Health & Hunger Kits {#healthHunger}
A player's health and hunger can be modified with kits, this can be useful on maps with the `naturalRegeneration` [gamerule](/modules/gamerules) set to false.

By default health or hunger values are only increased, not decreased. For example, a player with 5 hearts (10 points) will not get a 5 health point kit applied, however a 20 point kit will be applied. This can be overwritten with a kits `force="true"` attribute.


##### Health & Hunger Elements

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
            <code>{{'<health> </health>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Health value in 1/2 heart increments.
        </td>
        <td>
          <span class='label label-primary'>1 - 20</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<saturation> </saturation>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Food saturation, always equal to or less than the player's food level.
        </td>
        <td>
          <span class='label label-primary'>Decimal</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<foodlevel> </foodlevel>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Food level in 1/2 drumstick increments.
        </td>
        <td>
          <span class='label label-primary'>0 - 20</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="health" force="true">
        <health>10</health>
    </kit>

    <kit id="hunger">
        <saturation>20</saturation>
        <foodlevel>20</foodlevel>
    </kit>

<br/>

### Eliminate Kit {#eliminate}
Eliminates the player from a blitz match when applied regardless the amount of lives the player has remaining. Only works when used with the [Blitz module](/modules/gamemode_blitz).

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
            <code>{{'<eliminate/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Eliminate the player from the current blitz match.
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="double-jump-kit">
        <eliminate/>
    </kit>

<br/>

### Team Switch Kit {#teamSwitch}
A player's team can be changed or switched to another when they enter a region or are dynamically applied a kit, for example. Once applied, players will be 'respawned' at their new team's spawn with a corresponding kit keeping no previous items.

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
            <code>{{'<team-switch/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Move the player to another team.
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Team Switch Attributes</h5>
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
        <td>
          The team which the player will be moved to
        </td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="shield-kit">
        <team-switch team="red-team"/>
    </kit>

<br/>

### Potion Effect Kits (removable) {#potionEffect}

Potion effects can be applied and removed with a kit. See [Potion Effects](/modules/potions) for details about the `<effect>` element.

    <kit id="reduce-knockback">
        <effect duration="10" amplifier="4">resistance</effect>
    </kit>


<br/>

### Attribute Modifier Kits (removable) {#attributes}

Attribute modifiers can be applied directly to players through a kit. Modifying attributes in this way,
instead of through an item, is a simple way to ensure that the player cannot avoid the effect of
the modifier.

The only way to remove an attribute modifier is by removing the kit that applied it. A kit cannot
affect a modifier applied by a different kit.

**Attribute Operations**

* `add` Add amount
* `base` Multiply amount by base value and add it
* `multiply` Multiply by amount


##### Attribute Kit Elements

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
            <code>{{'<attribute> </attribute>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a href='/reference/attributes'>Attribute name</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Attribute Kit Attributes</h5>
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
          <code>amount</code>
        </td>
        <td>Numeric parameter</td>
        <td>
          <span class='label label-primary'>Decimal</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>operation</code>
        </td>
        <td>Modifier operation</td>
        <td>
          <span class='label label-primary'>add / base / multiply</span>
        </td>
        <td>
          <code>add</code>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="eliminate-kit">
        <attribute operation="add" amount="0.5">generic.movementSpeed</attribute>
    </kit>

<br/>

### Walk Speed Kit (removable) {#walkSpeed}
Increase or decrease a player's walking speed. The value is a multiplier of the normal walking speed.

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
            <code>{{'<walk-speed> </walk-speed>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Increase or decrease a player's walking speed.
        </td>
        <td>
          <span class='label label-primary'>0 - 5.0</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="rabbit">
        <!-- 1.8 times faster than a normal player -->
        <walk-speed>1.8</walk-speed>
    </kit>

    <kit id="tortoise">
        <!-- half as fast as a normal player -->
        <walk-speed>0.5</walk-speed>
    </kit>


<br/>

### Knockback Reduction Kit (removable) {#knockback}
Reduce (or increase) the knockback players receive when they have this kit applied.
The normal input range is `0 - 1.0`. If the value is greater than one the knockback will be increased,
and anything lower than zero pushes the player to the attacker instead of away from them.

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
            <code>{{'<knockback-reduction> </knockback-reduction>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Knockback reduction amount
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="switch-to-red">
        <knockback-reduction>0.5</knockback-reduction>
    </kit>


<br/>

### Shield Kit (removable) {#shield}
The shield kit gives the player a shield consisting of absorption hearts that recharge after a set period of time.
Recharging of the shield is based on when damage was taken last, every time a player is damaged it resets the recharge timer.

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
            <code>{{'<shield/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Give the player a recharging shield of absorption hearts.
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Shield Kit Attributes</h5>
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
          <code>health</code>
        </td>
        <td>
          Amount of extra absorption hearts to give to the player.
        </td>
        <td>
          <span class='label label-primary'>Decimal</span>
        </td>
        <td>4</td>
      </tr>
      <tr>
        <td>
          <code>delay</code>
        </td>
        <td>
          Time to wait after a player is last damaged to recharge the shield.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>4s</td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="resistance-kit">
        <shield health="4" delay="8s"/>
    </kit>


<br/>

### Double Jump Kit (removable) {#jump}
Give players with this kit the ability to double-jump.
This element's enabled attribute can be used to disable double-jump inside regions, etc.

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
            <code>{{'<double-jump/>' | escape_once}}</code>
          </span>
        </td>
        <td>Give player the double-jump ability.</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Double-Jump Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>enabled</code>
        </td>
        <td>
          Enable or disable double-jump.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>power</code>
        </td>
        <td>
          Power of the double jump (a normal player jump is about 1)
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>3</td>
      </tr>
      <tr>
        <td>
          <code>recharge-time</code>
        </td>
        <td>
          Recharge time till the player can double jump again.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>2.5s</td>
      </tr>
      <tr>
        <td>
          <code>recharge-before-landing</code>
        </td>
        <td>
          Player starts recharging before they land from their previous jump.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="increase-speed">
        <double-jump recharge-before-landing="true"/>
    </kit>

<br/>

### Fly Kit (removable) {#fly}
The fly kit gives players which it is applied to the ability to fly.
It also allows modification of the speed at which they fly.
If no attributes are specified can-fly defaults to true.

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
            <code>{{'<fly/>' | escape_once}}</code>
          </span>
        </td>
        <td>Control the player's flying ability</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Fly Kit Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>can-fly</code>
        </td>
        <td>
          Set if the player can fly.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>flying</code>
        </td>
        <td>
          Set if the player is currently flying.
          <br/>
          <i>
            To enable flying
            <code>can-fly</code>
            can not be set to false.
          </i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>fly-speed</code>
        </td>
        <td>
          Set the fly speed multiplier.
        </td>
        <td>
          <span class='label label-primary'>0 - 10</span>
        </td>
        <td>1</td>
      </tr>
    </tbody>
  </table>
</div>
    <kit id="fly-kit">
        <fly/>                    <!-- Allow player to fly -->
        <fly can-fly="false"/>    <!-- Don't allow player to fly -->
        <fly flying="true"/>      <!-- Make the player fly right away -->
        <fly flying="false"/>     <!-- Make the player stop flying right away -->
    </kit>
