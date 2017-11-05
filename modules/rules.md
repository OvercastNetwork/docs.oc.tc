---
layout: page

category: "Modules"
title:  "Rules"

---

You can use the rules module to add custom rules to your map that are not already included in the standard Stratus Network rules. Regions and filters should be used to enforce access and block rules.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Rule Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<rules> </rules>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the defined custom rules.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<rule> </rule>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A custom map rule.
        </td>
        <td>
          <span class='label label-primary'>Text</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>

Example

    <rules>
        <rule>Do not intentionally prolong the match by hiding or exiting the playing area.</rule>
    </rules>
