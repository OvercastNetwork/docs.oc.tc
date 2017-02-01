---
layout: page

category: "Modules"
title:  "Mob Spawning"

---

By default PGM disables all mob spawning.
The mobs module allows this behavior to be customized to allow spawning of specific mobs.
This module makes use of the `<spawn>`, `<mob>` and `<entity>` [filters](/modules/filters) to only allow specific mobs to spawn.
Mob spawns can also be filtered against any other filter type including regions.
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
            <code>&lt;mobs&gt; &lt;/mobs&gt;</code>
          </span>
        </td>
        <td colspan='3'>Node containing the custom mob spawning filters.</td>
      </tr>
      <tr>
        <th colspan='2'>Attributes</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          Filter what mobs can spawn when and where.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;filter&gt; &lt;/filter&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          Filter what mobs can spawn when and where.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Mob Spawning Filter Matchers</h5>
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
            <code>&lt;spawn&gt; &lt;/spawn&gt;</code>
          </span>
        </td>
        <td>Filter the reason a mob is being spawned.</td>
        <td>
          <a href='/reference/spawn_reason'>Spawn Reason</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;mob&gt; &lt;/mob&gt;</code>
          </span>
        </td>
        <td>The mob to filter for.</td>
        <td>
          <a href='/reference/entity_types#creatures'>Creature Type</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;entity&gt; &lt;/entity&gt;</code>
          </span>
        </td>
        <td>The entity to filter for.</td>
        <td>
          <a href='/reference/entity_types'>Entity Type</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <!-- Only allow mobs to spawn from monster spawners. -->
    <mobs>
        <filter>
            <spawn>spawner</spawn>
        </filter>
    </mobs>

    <!-- Only allow cave spiders spawned with spawn eggs -->
    <mobs>
        <filter>
            <all>
                <mob>cave spider</mob>
                <spawn>spawner egg</spawn>
            </all>
        </filter>
    </mobs>
