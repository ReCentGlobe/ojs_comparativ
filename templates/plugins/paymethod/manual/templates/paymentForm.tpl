{**
 * plugins/paymethod/manual/templates/paymentForm.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Manual payment page
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.paymethod.manual"}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

  <div class="uk-container">
    {include file="frontend/components/breadcrumbs.tpl" currentTitle="Manual Fee Payment"}

    <h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
      {translate key="plugins.paymethod.manual"}
    </h1>
  </div>

</section>

<section class="uk-section-default uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">
  <div class="uk-container">

    <table class="uk-table uk-table-divider">
      <tr>
        <th>{translate key="plugins.paymethod.manual.purchase.title"}</th>
        <td>{$itemName|escape}</td>
      </tr>
      {if $itemAmount}
        <tr>
          <th>{translate key="plugins.paymethod.manual.purchase.fee"}</th>
          <td>{$itemAmount|string_format:"%.2f"}{if $itemCurrencyCode} ({$itemCurrencyCode|escape}){/if}</td>
        </tr>
      {/if}
    </table>

    <p>{$manualInstructions|nl2br}</p>

    <p>
      <a class="uk-button uk-button-danger" href="{url page="payment" op="plugin" path="ManualPayment"|to_array:"notify":$queuedPaymentId|escape}" class="action">
        Complete purchase
      </a>
    </p>
  </div>
</section>

{include file="frontend/components/footer.tpl"}
