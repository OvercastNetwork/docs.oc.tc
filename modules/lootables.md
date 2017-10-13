---
layout: page

category: "Modules"
title:  "Lootables"
nav_content:
  - path: "#overview"
    name: "Overview"
  - path: "#loot"
    name: "Loot"
  - path: "#fill"
    name: "Fill"
  - path: "#examples"
    name: "Examples"

---

### Overview {#overview}

Lootables are chests or other containers that generate their contents based on custom rules and probabilities.
They can optionally refill themselves on a schedule, or in response to dynamic filters.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Lootables Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<lootables> </lootables>' | escape_once}}</code>
          </span>
        </td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<loot>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#loot'><i class="fa fa-chevron-down"></i></a>
          A generated set of items
        </td>
        <td>
          <span class='label label-default'>Loot Sub-elements</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<fill>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#posts'><i class="fa fa-chevron-down"></i></a>
          Configuration for filling containers with loot
        </td>
        <td>
          <span class='label label-default'>Fill Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>

### Loot {#loot}

The `<loot>` element defines a generated set of items, using literal `<item>` elements,
and operations for choosing them.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Loot Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<loot>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A generated set of items
        </td>
        <td>
          <span class='label label-default'>Loot Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Loot Attributes</th>
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
        <td>
          Unique identifier used to reference this loot elsewhere
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Loot Sub-elements</th>
        <th>Description</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<item>' | escape_once}}</code>
          </span>
        </td>
        <td>
          An item to include in the loot.
          This can be any type of item element, and can have any item attributes.
        </td>
        <td>
          <a href='/modules/items'>Item</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<any>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#any'><i class="fa fa-chevron-down"></i></a>
          Random selection of children
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<maybe>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#maybe'><i class="fa fa-chevron-down"></i></a>
          Include child conditionally based on a filter
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

#### Random Selection

The `<any>` element makes a random selection from any number of child elements.
Its children can be `<option>` elements, or any other `<loot>` sub-element.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Any Attributes</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>count</code>
        </td>
        <td>Number of child elements to choose</td>
        <td>
          <span class='label label-primary'>Numeric Range</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>unique</code>
        </td>
        <td>
          <code>true</code> if each child can only be chosen once.<br/>
          <code>false</code> to allow a child to be chosen multiple times.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          true
        </td>
      </tr>
    </tbody>
  </table>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Any Sub-elements</th>
        <th>Description</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<option>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single option for the random selection
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Option Attributes</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>weight</code>
        </td>
        <td>Weight of this option relative to all others</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          Filter used to decide the eligibility of this option
        </td>
        <td>
          <span class='label label-primary'>Filter</span>
        </td>
        <td>
          <code>always</code>
        </td>
      </tr>
    </tbody>
  </table>
</div>

#### Conditional Inclusion

The `<maybe>` element includes its child elements only if the specified filter matches.
The filter is matched against the first player to access the loot.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Maybe Attributes</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>Filter used to decide inclusion of children</td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

### Fill {#fill}

The `<fill>` element fills containers with generated loot.
It will fill **anything** that has an inventory, and matches its `filter` property.
This can include chests, dispensers, storage minecarts, or any other container block or entity.
It will fill containers regardless of where they came from, so if you don't want player-placed
chests to be filled, then you will have to prevent that somehow.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Fill Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<fill>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Automatically fills containers with loot
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Fill Attributes</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>loot</code>
        </td>
        <td>
          Loot to fill containers with
        </td>
        <td>
          <span class='label label-primary'>Loot</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          Selects which blocks/entities to fill
        </td>
        <td>
          <span class='label label-primary'>Filter</span>
        </td>
        <td>
          <code>always</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>refill-trigger</code>
        </td>
        <td>
          Optional dynamic filter that causes containers to be refilled
        </td>
        <td>
          <span class='label label-primary'>Dynamic Filter</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>refill-interval</code>
        </td>
        <td>
          Time to refill containers after they are first accessed
        </td>
        <td>
          <span class='label label-primary'>Time Period</span>
        </td>
        <td>
          oo (never)
        </td>
      </tr>
      <tr>
        <td>
          <code>refill-clear</code>
        </td>
        <td>
          Whether to clear containers before refilling them
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          true
        </td>
      </tr>
    </tbody>
  </table>
</div>

### Examples {examples}

    <lootables>
        <!-- Define a procedural list of loot -->
        <!-- Can be different every time it is used -->
        <!-- All operators can be composed within each other -->
        <loot id="stuff">
            <!-- Always include these items -->
            <item material="stone sword"/>
            <item material="bow"/>

            <!-- Include if filter matches opener of the container -->
            <maybe filter="red-team">
                <item material="stained clay" damage="14" amount="64"/>
                <item material="leather helmet" color="#f00"/>
            </maybe>

            <!-- Choose one element at random -->
            <any>
                <item material="stone" damage="1"/>
                <item material="stone" damage="2"/>
                <item material="stone" damage="3"/>
            </any>

            <!-- Weighted choice -->
            <any>
                <option weight="5">
                    <item material="cookie"/>
                </option>
                <option weight="3">
                    <item material="bread"/>
                </option>
                <option weight="1">
                    <item material="golden apple"/>
                </option>
            </any>

            <!-- Choose any two unique elements (unique="false" to allow duplicates) -->
            <any count="2">
                ...
            </any>

            <!-- Choose between 3 and 5 unique elements -->
            <any count="3..5">
                ...
            </any>
        </loot>

        <!-- Define inventories to refill -->
        <!-- Filling always happens when a player opens the inventory -->
        <!-- Any block or entity that has an inventory (and matches the filter) will be filled -->
        <fill loot="stuff"          <!-- Loot to fill inventory with -->
              filter="chests"       <!-- Inventories to fill (blocks or entities) -->
              refill-interval="3s"  <!-- Minimum interval between refills (default +inf) -->
              refill-trigger="..."  <!-- Dynamic filter to trigger refill (default none) -->
              refill-clear="true"   <!-- Clear inventory before refilling (default true) -->
        />
    </lootables>
