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

<section class="bg-primary py-8">
  <div class="container mx-auto animate-fadeIn">
    {include file="frontend/components/breadcrumbs.tpl" currentTitle="Manual Fee Payment"}
    <h1 class="text-2xl font-bold text-white mt-0" uk-scrollspy-class>
      {translate key="plugins.paymethod.manual"}
    </h1>
  </div>
</section>

<section class="bg-white py-12">
  <div class="container mx-auto">
    <table class="w-full mb-6">
      <tr>
        <th class="text-left font-semibold">{translate key="plugins.paymethod.manual.purchase.title"}</th>
        <td>{$itemName|escape}</td>
      </tr>
      {if $itemAmount}
        <tr>
          <th class="text-left font-semibold">{translate key="plugins.paymethod.manual.purchase.fee"}</th>
          <td>{$itemAmount|string_format:"%.2f"}{if $itemCurrencyCode} ({$itemCurrencyCode|escape}){/if}</td>
        </tr>
      {/if}
    </table>
    <p class="mb-4">{$manualInstructions|nl2br}</p>
    <p>
      <a class="inline-block px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700 transition" href="{url page="payment" op="plugin" path="ManualPayment"|to_array:"notify":$queuedPaymentId|escape}">
        Complete purchase
      </a>
    </p>
  </div>
</section>

{include file="frontend/components/footer.tpl"}
