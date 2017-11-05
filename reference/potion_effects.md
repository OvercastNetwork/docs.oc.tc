---
layout: page

category: "Reference"
title:  "Potion Effects"

---

<div class='alert alert-danger'>
  <h4>Obsolete - Don't use these</h4>
  Use
  <a href='https://minecraft.gamepedia.com/Java_Edition_data_values#Status_effects'>Status Effect IDs</a>
  instead
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>1</code>
        </td>
        <td>
          <code>SPEED</code>
        </td>
        <td>Increases movement speed.</td>
      </tr>
      <tr>
        <td>
          <code>2</code>
        </td>
        <td>
          <code>SLOW</code>
        </td>
        <td>Decreases movement speed.</td>
      </tr>
      <tr>
        <td>
          <code>3</code>
        </td>
        <td>
          <code>FAST_DIGGING</code>
        </td>
        <td>Increases dig speed.</td>
      </tr>
      <tr>
        <td>
          <code>4</code>
        </td>
        <td>
          <code>SLOW_DIGGING</code>
        </td>
        <td>Decreases dig speed.</td>
      </tr>
      <tr>
        <td>
          <code>5</code>
        </td>
        <td>
          <code>INCREASE_DAMAGE</code>
        </td>
        <td>Increases damage dealt.</td>
      </tr>
      <tr>
        <td>
          <code>6</code>
        </td>
        <td>
          <code>HEAL</code>
        </td>
        <td>Heals an entity.</td>
      </tr>
      <tr>
        <td>
          <code>7</code>
        </td>
        <td>
          <code>HARM</code>
        </td>
        <td>Hurts an entity.</td>
      </tr>
      <tr>
        <td>
          <code>8</code>
        </td>
        <td>
          <code>JUMP</code>
        </td>
        <td>Increases jump height.</td>
      </tr>
      <tr>
        <td>
          <code>9</code>
        </td>
        <td>
          <code>CONFUSION</code>
        </td>
        <td>Warps vision on the client.</td>
      </tr>
      <tr>
        <td>
          <code>10</code>
        </td>
        <td>
          <code>REGENERATION</code>
        </td>
        <td>Regenerates health.</td>
      </tr>
      <tr>
        <td>
          <code>11</code>
        </td>
        <td>
          <code>DAMAGE_RESISTANCE</code>
        </td>
        <td>Decreases damage dealt to an entity.</td>
      </tr>
      <tr>
        <td>
          <code>12</code>
        </td>
        <td>
          <code>FIRE_RESISTANCE</code>
        </td>
        <td>Stops fire damage.</td>
      </tr>
      <tr>
        <td>
          <code>13</code>
        </td>
        <td>
          <code>WATER_BREATHING</code>
        </td>
        <td>Allows breathing underwater.</td>
      </tr>
      <tr>
        <td>
          <code>14</code>
        </td>
        <td>
          <code>INVISIBILITY</code>
        </td>
        <td>Grants invisibility.</td>
      </tr>
      <tr>
        <td>
          <code>15</code>
        </td>
        <td>
          <code>BLINDNESS</code>
        </td>
        <td>Blinds an entity.</td>
      </tr>
      <tr>
        <td>
          <code>16</code>
        </td>
        <td>
          <code>NIGHT_VISION</code>
        </td>
        <td>Allows an entity to see in the dark.</td>
      </tr>
      <tr>
        <td>
          <code>17</code>
        </td>
        <td>
          <code>HUNGER</code>
        </td>
        <td>Increases hunger.</td>
      </tr>
      <tr>
        <td>
          <code>18</code>
        </td>
        <td>
          <code>WEAKNESS</code>
        </td>
        <td>Decreases damage dealt by an entity.</td>
      </tr>
      <tr>
        <td>
          <code>19</code>
        </td>
        <td>
          <code>POISON</code>
        </td>
        <td>Deals damage to an entity over time.</td>
      </tr>
      <tr>
        <td>
          <code>20</code>
        </td>
        <td>
          <code>WITHER</code>
        </td>
        <td>
          Deals damage to an entity over time and gives the health to the shooter.
          <code>*</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>21</code>
        </td>
        <td>
          <code>HEALTH_BOOST</code>
        </td>
        <td>
          Give the entity additional hearts. Those hearts vanish as the effect ends.
        </td>
      </tr>
      <tr>
        <td>
          <code>22</code>
        </td>
        <td>
          <code>ABSORPTION</code>
        </td>
        <td>
          Give the entity additional hearts which can't be replenished. Those hearts vanish after the effect ends.
        </td>
      </tr>
      <tr>
        <td>
          <code>23</code>
        </td>
        <td>
          <code>SATURATION</code>
        </td>
        <td>
          Increases the food level of an entity each tick.
        </td>
      </tr>
    </tbody>
  </table>
</div>

`*` May not work as expected with PGM

Copied from: [bukkit docs - Potion Effect Types](https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/potion/PotionEffectType.html) <br/>
