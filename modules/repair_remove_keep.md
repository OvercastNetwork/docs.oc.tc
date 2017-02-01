---
layout: page

category: "Modules"
title:  "Repair, Remove & Keep"
nav_content:
  - path: "#repair"
    name: "Tool Repair"
  - path: "#remove"
    name: "Item Remove"
  - path: "#item_keep"
    name: "Item Keep"
  - path: "#armor_keep"
    name: "Armor Keep"
---

### Tool Repair {#repair}
Defines tools that will be automatically repaired when dropped and picked up again. This will also merge items that are picked up, i.e., picking up an iron sword would result in it merging with your sword and repairing it. Repaired items will keep their enchantment, unlike vanilla minecraft where they will not.

This also works with non-tool items such as arrows. When people pick up item in the `<toolrepair>` module and they already have one of the same kind it gets merged into the existing item, if they don't have it they get it like normal. Repairing arrows instead of removing them has the advantage of the player being able to accidental drop one and not lose it.
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
            <code>&lt;toolrepair&gt; &lt;/toolrepair&gt;</code>
          </span>
        </td>
        <td>
          A node containing all the tools that will be repaired when picked up.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;tool&gt; &lt;/tool&gt;</code>
          </span>
        </td>
        <td>
          A single tool that will be repaired, can be anything with durability.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <toolrepair>
        <tool>iron sword</tool>
        <tool>bow</tool>
    </toolrepair>


<br/>

### Item Remove {#remove}
Defines items that will be deleted when dropped on the map. Also works when items are destroyed, such as seeds from tall grass, etc.
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
            <code>&lt;itemremove&gt; &lt;/itemremove&gt;</code>
          </span>
        </td>
        <td>
          A node containing all the items that will be removed when dropped.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;item&gt; &lt;/item&gt;</code>
          </span>
        </td>
        <td>The item that will be removed when dropped.</td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <itemremove>
        <item>arrow</item>
        <item>cooked fish</item>
        <item>diamond helmet</item>
        <item>iron chestplate</item>
    </itemremove>


<br/>

### Item Keep {#item_keep}
Defines items that will be kept on death. If there is a spawn kit, kept items will be given back *after* the kit is applied, except for equipped armor, which will replace any armor in the kit.
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
            <code>&lt;itemkeep&gt; &lt;/itemkeep&gt;</code>
          </span>
        </td>
        <td>
          A node containing all the items kept when respawning.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;item&gt; &lt;/item&gt;</code>
          </span>
        </td>
        <td>The item that will remain in a player's inventory when they die and respawn.</td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <itemkeep>
        <item>diamond sword</item>
        <item>tnt</item>
    </itemkeep>


<br/>

### Armor Keep {#armor_keep}
Similar to `<itemkeep>` except that the specified items are only kept if they are equipped in an armor slot.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 210px;'>Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;armorkeep&gt; &lt;/armorkeep&gt;</code>
          </span>
        </td>
        <td>
          A node containing all the
          <b>equipped</b>
          armor kept when respawning.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;item&gt; &lt;/item&gt;</code>
          </span>
        </td>
        <td>A equipped armor item that will remain in a player's inventory when they die and respawn.</td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <armorkeep>
        <item>iron helmet</item>
        <item>iron chestplate</item>
        <item>iron leggings</item>
        <item>iron boots</item>
    </armorkeep>
