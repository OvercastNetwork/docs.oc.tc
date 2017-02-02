---
layout: page

category: "Modules"
title:  "Filters"
nav_content:
  - path: "#list"
    name: "Filter Matchers"
  - path: "#filterModifiers"
    name: "Filter Modifiers"
  - path: "#killStreakFilter"
    name: "Kill-Streak Filter"
  - path: "#randomFilter"
    name: "Random Filter"
  - path: "#rank_score"
    name: "Rank &amp; Score Filters"
  - path: "#players"
    name: "Player Count Filter"
  - path: "#objectiveFilter"
    name: "Objective Filters"
  - path: "#flagFilter"
    name: "Flag Filters"
  - path: "#causeFilters"
    name: "Event Cause Filter"
  - path: "#relationFilters"
    name: "Player Relation Filter"
  - path: "#itemFilters"
    name: "Item Filters"
  - path: "#structuralLoadFilters"
    name: "Structural Load Filter"
  - path: "#voidFilter"
    name: "Void Filter"

---

Filters are true/false conditions about players, blocks, or the match in general.
Other modules use filters to decide *if* and *when* things should happen to those players, blocks, or the entire match.

Filters are built from **matchers** and **modifiers**.
Matchers are specific questions, like

* is it made of wood?
* is he/she on the Red Team?
* is it inside region X?
* has the match run past 5 minutes?

Modifiers can combine questions using logic, such as

* A and B
* A or B
* not A
* (A or B) and not (A and B)

Modifiers can also transform the meaning of questions, or answers, in various ways.

The documentation for other modules will explain where filters can be used, and how the filter affects the module's behavior.
Generally, other modules use filters in one of two ways:
<ul>
  <li>
    <em>Passively,</em>
    which means whenever the module wants to do its thing, it will check the filter to decide if it should be done or not.
  </li>
  <li>
    <em>Dynamically,</em>
    in which case the filter will notify the module when it's time to do something, and who or what it should be done to.
  </li>
</ul>
<p>
  Only filters labeled
  <span class='label label-primary'>Dynamic</span>
  are capable of the latter.
  Modules that require dynamic filters will say so in their documentation.
</p>

### Abstaining
Some filters don't make sense in certain contexts.
For example, you can't ask if a block is on the Red Team, or if a player is made of wood, or if the match is inside a region.

Some modules will generate an error if you try to use the wrong type of filter, but other modules may allow it.
When a filter doesn't apply to a particular decision, it will **abstain** from that decision, and things will behave as they would if the filter didn't exist.
Generally, you should avoid using filters in such a way that they can abstain, since it tends to be confusing.

However, the [event rules module](/modules/regions#applying) uses filter abstention to make very complex conditions easier to express:
It accepts a *chain* of filters, and uses the first filter in the chain that doesn't abstain.

Filters can be *forced* to abstain using the `<allow>` and `<deny>` modifiers.


### Defining Filters
Filters can be defined inside the top-level `<filters>` element,
and assigned an `id` used to reference them elsewhere.

    <filters>
        <any id="filter-name">
            <!-- Filter elements -->
        </any>

        <team id="viridescent-team-filter">viridescent-team</team>

        <!-- More filters-->
    </filters>

<br/>

### Matcher Elements {#list}
Filter matchers test for specific conditions or properties of things.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 300px;'>Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th colspan='3'>Generic filters (apply to anything)</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<filter id="filter1"/>' | escape_once}}</code>
          </span>
        </td>
        <td>Reference a filter by its ID.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<always/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Matches/allows everything.<br/>
          Can be referenced with the ID <code>always</code>
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<never/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Matches nothing/denies everything.<br/>
          Can be referenced with the ID <code>never</code>
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<match-started/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Filter if the match has started.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<match-running/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Filter if the match is running.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<match-finished/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Filter if the match is over.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<time>duration</time>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Filter if the specified
          <a href='/reference/time_periods'>time period</a>
          has elapsed since the match started.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<completed>objective_id</completed>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#objectiveFilter'><i class="fa fa-chevron-down"></i></a>
          Match if the objective is completed.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<captured>objective_id</captured>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#objectiveFilter'><i class="fa fa-chevron-down"></i></a>
          Match players or teams who currently control the objective.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<flag-carried>flag_id</flag-carried>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#flagFilter'><i class="fa fa-chevron-down"></i></a>
          Match if the flag is being carried by anyone.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<flag-dropped>flag_id</flag-dropped>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#flagFilter'><i class="fa fa-chevron-down"></i></a>
          Match if the flag is dropped on the ground.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<flag-returned>flag_id</flag-returned>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#flagFilter'><i class="fa fa-chevron-down"></i></a>
          Match if the flag is at the return-point.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<flag-captured>flag_id</flag-captured>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#flagFilter'><i class="fa fa-chevron-down"></i></a>
          Match if the flag has been captured.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <th colspan='3'>Spatial filters (apply to anything with a physical location)</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<void/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#voidFilter'><i class="fa fa-chevron-down"></i></a>
          Match if there is an air block at Y=0 in the vertical column of this location
        </td>
        <td></td>
      </tr>
      <tr>
        <td colspan='3'>
          <em>
            Any
            <a href='/modules/regions'>region</a>
            element
          </em>
        </td>
      </tr>
      <tr>
        <th colspan='3'>Block filters</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<material>block</material>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Matches blocks by their
          <a href='/reference/inventory#material_finder'>Material</a>
          name.
          <br/>
          Accepts a
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<structural-load>2</structural-load>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#structuralLoadFilters'><i class="fa fa-chevron-down"></i></a>
          Test the number of other gravity blocks that the queried block is supporting.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Entity filters</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<spawn>spawn reason</spawn>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Matches spawn event reasons, see
          <a href='/modules/mobs'>mob spawning</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<mob>mob name</mob>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Matches mobs by their name, see
          <a href='/modules/mobs'>mob spawning</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<entity>entity name</entity>' | escape_once}}</code>
          </span>
        </td>
        <td>Match entities, e.g. projectiles, boats, dropped items, etc.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Competitor filters (apply to teams, or FFA players)</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<rank> </rank>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#rank_score'><i class="fa fa-chevron-down"></i></a>
          Match if the player or team's rank is within the specified range.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<score> </score>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#rank_score'><i class="fa fa-chevron-down"></i></a>
          Match if the player or team's score is within the specified range.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<carrying-flag>flag_id</carrying-flag>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#flagFilter'><i class="fa fa-chevron-down"></i></a>
          Match the team/player carrying the specified flag.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <th colspan='3'>Player filters</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<participating/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is participating in the match.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<observing/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is observing the match.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<team>team</team>' | escape_once}}</code>
          </span>
        </td>
        <td>Matches a team by its ID.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight xml'>
            <code>{{'<class>class name</class>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match players with the specified class.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<kill-streak/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#killStreakFilter'><i class="fa fa-chevron-down"></i></a>
          Match players with a certain range or amount of kills.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<crouching/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is crouching.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<walking/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is walking.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<sprinting/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is sprinting.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<flying/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is flying.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<can-fly/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player can fly.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<gliding/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is gliding with an elytra.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<grounded/>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Match if the player is on the ground.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<carrying><item material=""/></carrying>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#itemFilters'><i class="fa fa-chevron-down"></i></a>
          Match if the player is carrying an item.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<holding><item material=""/></holding>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#itemFilters'><i class="fa fa-chevron-down"></i></a>
          Match if the player is holding an item.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<wearing><item material=""/></wearing>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#itemFilters'><i class="fa fa-chevron-down"></i></a>
          Match if the player is wearing an item.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Event filters (apply to transient events)</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<cause>cause</cause>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#causeFilters'><i class="fa fa-chevron-down"></i></a>
          Filter an event's cause.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<random>decimal or range</random>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#randomFilter'><i class="fa fa-chevron-down"></i></a>
          Random chance matcher.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Damage filters (apply to damage/combat events)</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<relation>relation</relation>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#relationFilters'><i class="fa fa-chevron-down"></i></a>
          Filter an event's relation to the player.
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

### Modifier Elements {#filterModifiers}

Filter modifiers are used to alter the meaning of other filters, and combine them into more complex conditions.
These elements must contain either a single filter, or a list of filters, as their child elements.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 85px;'>Name</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th colspan='3'>Logic - combine other filters</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<not>' | escape_once}}</code>
          </span>
        </td>
        <td>Invert the filters result; allow if the child filter denies, deny if it allows, abstain otherwise.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<one>' | escape_once}}</code>
          </span>
        </td>
        <td>Allow if <i>only one</i> of the child filters allows, deny if <i>one or more allow</i> or <i>none allow and at least one denies</i>, otherwise abstain.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<all>' | escape_once}}</code>
          </span>
        </td>
        <td>Allow if <i>all</i> of the child filters allow, deny if <i>one or more deny</i>, otherwise abstain.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<any>' | escape_once}}</code>
          </span>
        </td>
        <td>Allow if <i>one</i> of the child filters allows, deny if <i>none allow and at least one denies</i>, otherwise abstain.</td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <th colspan='3'>Abstention - force filters to abstain</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<allow>' | escape_once}}</code>
          </span>
        </td>
        <td>Allow if the child filter allows, otherwise abstain (transform deny to abstain).</td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<deny>' | escape_once}}</code>
          </span>
        </td>
        <td>Deny if the child filter allows, otherwise abstain.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Query modifiers - change the question</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<same-team>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Change a player question to a team question.<br/>
          For example, "do they have the flag?" becomes "does their team have the flag?".
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<victim>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Make a damage question specifically about the victim.<br/>
          For example, "do they have the flag?" becomes "does the victim have the flag?"
          <br/>
          Commonly used with the
          <a href='/modules/damage'>damage</a>
          module.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<attacker>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Make a damage question specifically about the attacker.<br/>
          For example, "do they have the flag?" becomes "does the attacker have the flag?"
          <br/>
          Commonly used in the
          <a href='/modules/damage'>damage</a>
          module.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='3'>Mechanisms - apply complex mechanics to other filters</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<players>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#players'><i class="fa fa-chevron-down"></i></a>
          Count the number of players that match the inner filter.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<countdown>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#countdown'><i class="fa fa-chevron-down"></i></a>
          Countdown from the moment that the inner filter matched.
        </td>
        <td>
          <span class='label label-primary'>Dynamic</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <filters>
        <not id="deny-yellow-explosions">
            <all>
                <team>yellow</team>
                <cause>explosion</cause>
            </all>
        </not>
    </filters>

````
<filters>
    <deny id="no-tnt"><material>TNT</material></deny>
</filters>
````

The player wants to place a TNT block, the filter gets asked; "Is this block place-able?". The filter checks the `<material>` matcher, it matches and returns `ALLOW`. The material matcher is contained in a `<deny>` modifier so the `ALLOW` gets turned into a `DENY`.

<br/>

#### Kill-Streak Filter {#killStreakFilter}

The kill-streak filter is a matcher that matches players who have a specified number of kills.
The kill counter can be set to count from the start of the match or from the last time the player died.
This filter is commonly used in [kill rewards](/modules/killreward) but can also be used to restrict access to certain locations, etc.


#####  Kill-Streak Filter Attributes
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
          <code>min</code>
        </td>
        <td>Match players with at-least this many kills.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>max</code>
        </td>
        <td>Match players with a maximum of this many kills.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>count</code>
        </td>
        <td>
          Match players with exactly this many kills.
          <br/>
          <i>Can not be mixed with the <code>min</code> & <code>max</code> attributes.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>repeat</code>
        </td>
        <td>Repeat the filter range</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>persistent</code>
        </td>
        <td>Do not reset a players kill count when they die.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <kill-streak min="3"/>      <!-- matches players with at least 3 kills -->
    <kill-streak max="5"/>      <!-- matches players with at most 5 kills -->
    <kill-streak count="4"/>    <!-- matches players with exactly 4 kills -->

    <kill-streak id="10th-kill-filter" repeat="true" count="10"/>    <!-- match for every 10th kill -->


<br/>

#### Random Filter {#randomFilter}

This filter will randomly `ALLOW` or `DENY` when evaluated in the context of an event.
Its value is a decimal fraction between 0 and 1, representing the probability of `ALLOW`.

The value can also be an interval, in the form `[0, 1)`.
When the filter is evaluated, a random number is chosen, and the filter passes if the number falls within the filter's interval.
Multiple filters applied to the same object at the same instant will use the same random number.
So, if their intervals do not overlap, the filters will never both pass at the same time.
Using intervals in this way, any number of filters can be made mutually exclusive, or their relationships can be controlled in more complex ways.

A random filter can only be applied to instantaneous events, and not to conditions that persist over some span of time.
Specifically, they can be used in the following contexts:

* Regional block change rules
* Block drop rules
* Damage rules
* Mob spawning rules

In other contexts, random filters will `ABSTAIN`.

Examples

    <!-- 50% chance that it will return either ALLOW or DENY -->
    <random>0.5</random>

    <!-- Also a 50% chance -->
    <!-- Any number from 0.25 to 0.75 including 0.25 but excluding 0.75 -->
    <random>[0.25, 0.75)</random>



<br/>

#### Rank & Score Filters {#rank_score}

The rank and score filters match if the team's or player's rank or score is a equal to a single value or within a range of values.<br/>
The value can be an exact amount or a interval specifying a range. Only whole numbers are valid.

Examples

    <!-- Match if the team (or player in ffa) rank is 3 -->
    <rank>3</rank>

    <!-- Match if team (or player in ffa) has a score from 5 to 10. -->
    <score>[5-10]</score>



<br/>

#### Player Count Filter {#players}

This filter counts the number of players matching a single child filter,
and matches if that count is within a specified range.

The child filter can be omitted, in which case all players in the match will be counted.


#####  Player Count Filter Attributes
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
          <code>min</code>
        </td>
        <td>Minimum player count</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <code>max</code>
        </td>
        <td>Maximum player count</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>oo (unlimited)</td>
      </tr>
      <tr>
        <td>
          <code>participants</code>
        </td>
        <td>Include participants (players actually playing) in the count.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>observers</code>
        </td>
        <td>Include observers in the count.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <!-- Match if there are at least 4 players participating -->
    <players min="4"/>

    <!-- Match if there are 1 to 3 players sneaking in region X -->
    <players min="1" max="3">
        <all>
            <sneaking/>
            <region id="X"/>
        </all>
    </players>

<br/>

#### Countdown Filter {#countdown}

This filter matches for up to the specified amount of time after the child filter starts matching.
It never matches when the child filter doesn't match.


#####  Countdown Filter Attributes
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
        <td>Length of time to match for</td>
        <td>
          <span class='label label-primary'>Time Period</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>message</code>
        </td>
        <td>
          Optional timer message to display while counting down.
          Only players who match the filter can see the timer.
          If the message contains a placeholder, it will be replaced with the remaining time.
        </td>
        <td>
          <span class='label label-primary'>Message Template</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <!-- Countdown 30s from the moment any player picks up the flag -->
    <!-- (you could then use the countdown filter to kill them, teleport them, etc) -->
    <countdown duration="30s" message="You have {0} to capture the flag">
        <carrying-flag>blue-flag</carrying-flag>
    </countdown>



<br/>

#### Objective Filters {#objectiveFilter}

There are two filter types that test the state of an objective: `<completed>` and `<captured>`.
Both types require the ID of an objective as the content of the tag.

The `<completed>` filter matches when the specified objective is completed or captured by anybody e.g.
when a [destroyable](/modules/gamemode_dtm) is destroyed, a [core](/modules/gamemode_dtc) is leaked, or a [hill](/modules/control_points) is captured by anyone.
This filter is not affected by the context in which it is applied, and never abstains.

The `<captured>` filter matches players or teams who currently control the specified objective.
This filter is useful for objectives that can change ownership, such as [hills](/modules/control_points) and [flags](/modules/gamemode_ctf).
For other objective types, it will match players/teams who are *allowed* to complete the objective, if the objective is completed, which is generally not useful.
This filter will abstain if used in a context that does not involve a specific player or team.

Alternately, `<captured>` can have a team specified with the `team` attribute.
Then it will always test that team's control of the objective, regardless of the filtering context, and will never abstain.



#####  Capture Filter Attributes
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>team</code>
        </td>
        <td>Match only if the objective is captured/completed by this team.</td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <!-- Match if red-core has been leaked -->
    <completed>red-core</completed>

    <!-- Match if south-hill is owned by anyone -->
    <completed>south-hill</completed>

    <!-- Match players/teams who own north-hill -->
    <captured>north-hill</captured>

    <!-- Match if blue-team owns central-hill -->
    <captured team="blue-team">central-hill</captured>



<br/>

#### Flag Filters {#flagFilter}

The flag filters allow filtering of a specific flags current state or for the player that is carrying the flag. One important use of these filters is to implement the standard rule that a team can only capture an enemy flag when their own flag is returned. This can be implemented easily using a `<flag-returned>` as the capture-filter of a flag. This can also be done with the nets return attribute. However, using the return attribute will return dropped flags, while using a filter will not.

The flag carried, dropped, captured and returned filters have an optional `post` attribute to only match if the flag was last returned to that post.

    <!-- The blue flag is currently being carried by a player -->
    <flag-carried>blue-flag</flag-carried>

    <!-- The blue flag has been carried away & dropped from the red-post -->
    <flag-dropped post="red-post">blue-flag</flag-dropped>

    <!-- The yellow flag is standing at one of its posts -->
    <flag-returned>yellow-flag</flag-returned>

    <!-- The yellow flag is standing at the green-post -->
    <flag-returned post="green-post">yellow-flag</flag-returned>

    <!-- The cyan flag has been captured but not yet returned -->
    <flag-captured>cyan-flag</flag-captured>

    <!-- The player currently carrying the purple flag -->
    <carrying-flag>purple-flag</carrying-flag>



<br/>

#### Item Filters {#itemFilters}

These filters can be used to filter for players with specific items in their inventory. They accept a single [item](/modules/items) element. Only the item's type, durability/damage and meta data are compared. A item's meta data includes the item's name, enchantments, etc.

    <!-- Player has a stick named 'Blue Door Key' in their inventory -->
    <carrying><item name="Blue Door Key" material="stick"/></carrying>

    <!-- Player is holding a clock -->
    <holding><item material="clock"/></holding>

    <!-- Player is wearing a chainmail chestplate -->
    <wearing><item material="chainmail chestplate"/></wearing>



<br/>

#### Event Cause Filters {#causeFilters}

Cause filters are used to filter an event or action according to its cause.
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
            <code>{{'<cause> </cause>' | escape_once}}</code>
          </span>
        </td>
        <td>Filter an event's cause.</td>
      </tr>
      <tr>
        <th colspan='2'>Cause: Actor Type</th>
      </tr>
      <tr>
        <td>
          <code>WORLD</code>
        </td>
        <td>World events such as ice melting, etc.</td>
      </tr>
      <tr>
        <td>
          <code>LIVING</code>
        </td>
        <td>Events caused by a living entity.</td>
      </tr>
      <tr>
        <td>
          <code>MOB</code>
        </td>
        <td>Events caused by a mob.</td>
      </tr>
      <tr>
        <td>
          <code>PLAYER</code>
        </td>
        <td>Events caused by a player.</td>
      </tr>
      <tr>
        <th colspan='2'>Cause: Block Action</th>
      </tr>
      <tr>
        <td>
          <code>PUNCH</code>
        </td>
        <td>Events where a block is punched.</td>
      </tr>
      <tr>
        <td>
          <code>TRAMPLE</code>
        </td>
        <td>Events where a block is trampled.</td>
      </tr>
      <tr>
        <td>
          <code>MINE</code>
        </td>
        <td>Events where a block is mined.</td>
      </tr>
      <tr>
        <th colspan='2'>Cause: Damage Type</th>
      </tr>
      <tr>
        <td>
          <code>MELEE</code>
        </td>
        <td>
          <code>PROJECTILE</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>POTION</code>
        </td>
        <td>
          <code>EXPLOSION</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>COMBUSTION</code>
        </td>
        <td>
          <code>FALL</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>GRAVITY</code>
          Fall and void damage.
        </td>
        <td>
          <code>VOID</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>SQUASH</code>
        </td>
        <td>
          <code>SUFFOCATION</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>DROWNING</code>
        </td>
        <td>
          <code>STARVATION</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>LIGHTNING</code>
        </td>
        <td>
          <code>CACTUS</code>
        </td>
      </tr>
      <tr>
        <td>
          <code>THORNS</code>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

#### Player Relation Filters {#relationFilters}

The relation filter is used when a player is damaged to check the relation between them and the damage cause.
This filter is only used in damage related contexts i.e., [damage filters](/modules/damage), and [kill rewards](/modules/killreward)
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
            <code>{{'<relation> </relation>' | escape_once}}</code>
          </span>
        </td>
        <td>The relation between the player and their damage cause.</td>
      </tr>
      <tr>
        <th colspan='2'>Values</th>
      </tr>
      <tr>
        <td>
          <code>NEUTRAL</code>
        </td>
        <td>Event has no attacker, e.g. world damage.</td>
      </tr>
      <tr>
        <td>
          <code>SELF</code>
        </td>
        <td>Events caused by the player. (Same player same team)</td>
      </tr>
      <tr>
        <td>
          <code>ALLY</code>
        </td>
        <td>Events caused by a player on the same team. (Different player same team)</td>
      </tr>
      <tr>
        <td>
          <code>ENEMY</code>
        </td>
        <td>Events caused by an enemy player. (Different team)</td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

#### Structural Load Filters {#structuralLoadFilters}
The structural load filter checks the number of gravity blocks that are attached to the queried block.
It returns `ALLOW` as long as the structural load is greater than or equal to the specified value and `DENY` otherwise.

<span class="label label-warning">Warning</span> This filter is very computationally expensive to apply, XML authors should ensure that it is only run when absolutely necessary, e.g. by placing other filters above it. They should also not apply it to events that modify large amounts of blocks, such as explosions.

This filter requires the falling blocks module to be loaded otherwise it will default to abstain.

Example

    <!--  Deny breaking structures longer than 3 blocks  -->
    <not>
        <all>
            <cause>player</cause>
            <filter name="structure-blocks"/>
            <structural-load>3</structural-load>
        </all>
    </not>



<br/>

#### Void Filter {#voidFilter}

If your map is especially complex shaped you may have to use the `<void/>` tag to shape your filtered region.
The `<void/>` tag checks the specified regions for blocks on the bottom layer of the world. It then creates an outline of those blocks and the specified filter is only active inside or outside that outline. Bridges are usually not detected because they are not at `y=0`. This can be fixed by creating a invisible silhouette of the bridge with block 36 at `y=0`.

Example

    <filters>
        <not id="no-void">
            <void/>
        </not>
    </filters>
    <regions>
        <apply block="no-void" message="You may not modify the void area!">
            <region>
                <rectangle id="main-area" min="65,860" max="290,980"/>
            </region>
        </apply>
    </regions>
