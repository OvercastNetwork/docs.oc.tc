---
layout: page

category: "Reference"
title:  "Entity Spawn Reason"

---

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Reason</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>NATURAL</code>
        </td>
        <td>When something spawns from natural means.</td>
      </tr>
      <tr>
        <td>
          <code>JOCKEY</code>
        </td>
        <td>When an entity spawns as a jockey of another entity (mostly spider jockeys)</td>
      </tr>
      <tr>
        <td>
          <code>CHUNK_GEN</code>
        </td>
        <td>When a creature spawns due to chunk generation.</td>
      </tr>
      <tr>
        <td>
          <code>SPAWNER</code>
        </td>
        <td>When a creature spawns from a spawner.</td>
      </tr>
      <tr>
        <td>
          <code>EGG</code>
        </td>
        <td>When a creature spawns from an egg.</td>
      </tr>
      <tr>
        <td>
          <code>SPAWNER_EGG</code>
        </td>
        <td>When a creature spawns from a Spawner Egg.</td>
      </tr>
      <tr>
        <td>
          <code>LIGHTNING</code>
        </td>
        <td>When a creature spawns because of a lightning strike.</td>
      </tr>
      <!-- %tr -->
      <!-- %td -->
      <!-- %code BED -->
      <!-- %td -->
      <!-- When a creature is spawned by a player that is sleeping. -->
      <!-- %span.label.label-danger Deprecated -->
      <tr>
        <td>
          <code>BUILD_SNOWMAN</code>
        </td>
        <td>When a snowman is spawned by being built.</td>
      </tr>
      <tr>
        <td>
          <code>BUILD_IRONGOLEM</code>
        </td>
        <td>When an iron golem is spawned by being built.</td>
      </tr>
      <tr>
        <td>
          <code>BUILD_WITHER</code>
        </td>
        <td>When a wither boss is spawned by being built.</td>
      </tr>
      <tr>
        <td>
          <code>VILLAGE_DEFENSE</code>
        </td>
        <td>When an iron golem is spawned to defend a village.</td>
      </tr>
      <tr>
        <td>
          <code>VILLAGE_INVASION</code>
        </td>
        <td>When a zombie is spawned to invade a village.</td>
      </tr>
      <tr>
        <td>
          <code>BREEDING</code>
        </td>
        <td>When an animal breeds to create a child.</td>
      </tr>
      <tr>
        <td>
          <code>SLIME_SPLIT</code>
        </td>
        <td>When a slime splits.</td>
      </tr>
      <tr>
        <td>
          <code>REINFORCEMENTS</code>
        </td>
        <td>When an entity calls for reinforcements.</td>
      </tr>
      <tr>
        <td>
          <code>NETHER_PORTAL</code>
        </td>
        <td>When a creature is spawned by nether portal.</td>
      </tr>
      <tr>
        <td>
          <code>DISPENSE_EGG</code>
        </td>
        <td>When a creature is spawned by a dispenser dispensing an egg.</td>
      </tr>
      <tr>
        <td>
          <code>INFECTION</code>
        </td>
        <td>When a zombie infects a villager.</td>
      </tr>
      <tr>
        <td>
          <code>CURED</code>
        </td>
        <td>When a villager is cured from infection.</td>
      </tr>
      <tr>
        <td>
          <code>OCELOT_BABY</code>
        </td>
        <td>When an ocelot has a baby spawned along with them.</td>
      </tr>
      <tr>
        <td>
          <code>SILVERFISH_BLOCK</code>
        </td>
        <td>When a silverfish spawns from a block.</td>
      </tr>
      <tr>
        <td>
          <code>MOUNT</code>
        </td>
        <td>When an entity spawns as a mount of another entity (mostly chicken jockeys)</td>
      </tr>
      <tr>
        <td>
          <code>TRAP</code>
        </td>
        <td>When an entity spawns as a trap for approaching player(s).</td>
      </tr>
      <tr>
        <td>
          <code>CUSTOM</code>
        </td>
        <td>When a creature is spawned by plugins.</td>
      </tr>
      <tr>
        <td>
          <code>DEFAULT</code>
        </td>
        <td>When an entity is missing a SpawnReason.</td>
      </tr>
    </tbody>
  </table>
</div>
Copied from: [bukkit docs - Spawn Reason](https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/event/entity/CreatureSpawnEvent.SpawnReason.html)
