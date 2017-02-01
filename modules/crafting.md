---
layout: page

category: "Modules"
title:  "Crafting Recipes"
nav_content:
  - path: "#shaped"
    name: "Shaped"
  - path: "#shapeless"
    name: "Shapeless"
  - path: "#smelt"
    name: "Smelt"

---

The crafting module allows custom shaped and shapeless crafting recipes and smelting products. Vanilla recipes for a specific material can also be disabled to prevent crafting of that material except with the new recipe.
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
            <code>&lt;crafting&gt; &lt;/crafting&gt;</code>
          </span>
        </td>
        <td>
          Node containing the custom crafting recipes.
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
            <code>&lt;shaped&gt;</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#shaped'><i class="fa fa-chevron-down"></i></a>
          A shaped crafting recipe node.
        </td>
        <td>
          <span class='label label-default'>Shaped Recipe Sub-elements</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;shapeless&gt;</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#shapeless'><i class="fa fa-chevron-down"></i></a>
          A custom shapeless recipe node.
        </td>
        <td>
          <span class='label label-default'>Shapeless Recipe Sub-elements</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;smelt&gt;</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#smelt'><i class="fa fa-chevron-down"></i></a>
          A custom smelting recipe.
        </td>
        <td>
          <span class='label label-default'>Smelt Recipe Sub-elements</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;disable&gt;</code>
          </span>
        </td>
        <td>Disable all vanilla recipes for this item.</td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Recipe Attributes</h5>
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
          <code>override</code>
        </td>
        <td>
          Disable all vanilla recipes for the same item. This is just a convenient alternative to the
          <code>&lt;disable&gt;</code>
          element.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>override-all</code>
        </td>
        <td>
          Override all vanilla recipes resulting in this material.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Recipe Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;result&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          The result of this recipe, only one result is allowed per recipe.
          <br>
          Accepts all attributes and sub-elements of a normal kit item.
        </td>
        <td>
          <a href='/modules/items'>Item</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

#### Shaped Recipes {#shaped}
Shaped recipes require that their items are arranged in a specific location on the crafting grid.

The crafting grid is represented inside `<shape>` using `<row>` elements.
A `<row>` element contains a string with up to 3 symbols specifying the ingredient at that spot in the grid.
An ingredients symbol is defined in the `<ingredient symbol="">` attribute.

A shaped recipe does not need to specify all 3 rows of a crafting grid, only one row is required.
All columns in a shaped recipe need to be the same width.
Blank ingredient spots are specifed with a dot `.`.
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
            <code>&lt;shaped&gt; &lt;/shaped&gt;</code>
          </span>
        </td>
        <td>
          A shaped crafting recipe node.
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
            <code>&lt;shape&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          An ingredient used in this recipe.
          <br>
          <i>Only one shape per recipe is allowed.</i>
        </td>
        <td>
          <span class='highlight'>
            <code>&lt;row&gt;</code>
          </span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;ingredient&gt;</code>
          </span>
          |
          <span class='highlight'>
            <code>&lt;i&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          An ingredient used in this recipe.
          <br>
          A shaped recipe requires at least one ingredient.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Shape Sub-elements</h5>
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
            <code>&lt;row&gt;</code>
          </span>
        </td>
        <td>
          A row in the recipe crafting shape.
        </td>
        <td>
          <span class='label label-default'>Row String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Shaped Ingredient Attributes</h5>
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
          <code>symbol</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The symbol used to specify this ingredients grid location in the recipe.
        </td>
        <td>
          <span class='label label-primary'>Single Character</span>
        </td>
        <td>A-Z 0-9</td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <crafting>
        <!-- Add custom shaped recipe and disable vanilla recipes for the same item. -->
        <shaped override="true">
            <result material="stone pickaxe">
                <enchantment level="2">durability</enchantment>
            </result>
            <shape>
                <row>FFF</row>
                <row>.S.</row>
                <row>.S.</row>
            </shape>
            <ingredient symbol="F">flint</ingredient >
            <ingredient symbol="S">stick</i>
        </shaped>

        <!-- 3x1 recipe, cheaper gold ingots -->
        <shaped override="true">
            <result material="gold ingot"/>
            <shape>
                <row>GGG</row>
            </shape>
            <ingredient symbol="G">gold nugget</ingredient >
        </shaped>
    </crafting>


<br/>

#### Shapeless Recipes {#shapeless}
Unlike a shaped recipe, shapeless recipes do not require that their items are arranged in any specific way in the crafting grid.
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
            <code>&lt;shapeless&gt; &lt;/shapeless&gt;</code>
          </span>
        </td>
        <td>
          A custom shapeless recipe node.
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
            <code>&lt;ingredient&gt;</code>
          </span>
          |
          <span class='highlight'>
            <code>&lt;i&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          An ingredient used in this recipe.
          <br>
          A shapeless recipe requires at least one ingredient.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Shapeless Ingredient Attributes</h5>
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
          <code>amount</code>
        </td>
        <td>
          Amount of items of this type required for this recipe.
          <br>
          <i>Items must be in separate slots, not stacked, for this recipe to work.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1-9</td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <crafting>
        <shapeless>
            <result material="redstone"/>
            <ingredient>sugar</ingredient>
            <ingredient amount="3">ink sack:1</ingredient>
        </shapeless>
    </crafting>

<br/>

#### Smelt Recipes {#smelt}
Smelt recipes specify what a material gets smelted into in a furnace.
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
            <code>&lt;smelt&gt; &lt;/smelt&gt;</code>
          </span>
        </td>
        <td>
          A custom smelting recipe.
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
            <code>&lt;ingredient&gt;</code>
          </span>
          |
          <span class='highlight'>
            <code>&lt;i&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          An ingredient used in this recipe.
          <br>
          A smelt recipe only accepts one ingredient.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <crafting>
        <smelt>
            <result amount="16" material="torch"/>
            <ingredient>stick</ingredient>
        </smelt>
    </crafting>
