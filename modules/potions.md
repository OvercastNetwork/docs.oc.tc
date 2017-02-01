---
layout: page

category: "Modules"
title:  "Potion Effects"

---

The potion `<effect>` element can be used in a kit to apply potion effects directly to a player,
or used to give a custom effect to a [potion bottle item](/modules/items#potions).

Duration specifies how long the potion will last, and amplifier determines what level / how strong the potion is.
The effect type is specified by its [Minecraft ID](http://minecraft.gamepedia.com/Data_values#Status_effects).
Effect ID's should be specified without their `minecraft:` prefix.
<h5>Effect Element</h5>
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
            <code>&lt;effect&gt; &lt;/effect&gt;</code>
          </span>
        </td>
        <td>
          A potion effect
        </td>
        <td>
          <a href='http://minecraft.gamepedia.com/Data_values#Status_effects'>Status Effect ID</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Effect Attributes</h5>
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
          <code>duration</code>
        </td>
        <td>
          Duration of the effect.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>
          oo
          (forever)
        </td>
      </tr>
      <tr>
        <td>
          <code>amplifier</code>
        </td>
        <td>
          Strength of the effect. The value matches what is displayed to the player in-game,
          so the first tier of potions have amplifier 1.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Example</h5>
    <effect duration="10" amplifier="4">resistance</effect>
    <effect duration="900" amplifier="1">jump_boost</effect>
