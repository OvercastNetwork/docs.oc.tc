---
layout: page

category: "Modules"
title:  "Monument Modes"

---

This module can be used to customize the modes that cores and destroyables cycle through, and at what duration they do so. When a monuments mode changes its material is usually changed from a hard to a soft block.

The `<modes>` tag can contain any number of `<mode>` tags with different durations. Each `<mode>` has configurable characteristics that define it.
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
            <code>&lt;modes&gt; &lt;/modes&gt;</code>
          </span>
        </td>
        <td>Node containing the monument modes for this match.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;mode/&gt;</code>
          </span>
        </td>
        <td>An individual monument mode.</td>
        <td>
          <span class='label label-default'>None</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Mode Attributes</h5>
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
          <code>after</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          Time from the start of the game till this mode takes effect.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>material</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          Material the core/destroyable changes to.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>Custom mode name, used for the mode change notice.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>show-before</code>
        </td>
        <td>
          The time before a mode is over to show it in the BossBar.<br/>
          If show-before is set to 0 the mode is not shown in the BossBar at all.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>
          60 sec
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <modes>
        <mode after="10m" material="gold block"/>
    </modes>

This specifies a mode that will change the material of affected objectives to gold block after 10 minutes of gameplay.

    <modes>
        <mode after="5m" material="coal block" name="`eEASY MODE"/>
    </modes>

This specifies a mode that will change the material of affected objectives to coal block after 10 minutes of gameplay, with the following chat message: `> > > EASY MODE < < <`

`NOTE:` In order for an objective to change modes, it must have `mode-changes="true"` in its element tag.

    <destroyables name="Monument" materials="obsidian" mode-changes="true">
        <!-- destroyables... -->
    </destroyable>
