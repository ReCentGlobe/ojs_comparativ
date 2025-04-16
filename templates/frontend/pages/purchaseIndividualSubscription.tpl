{**
 * templates/frontend/pages/purchaseIndividualSubscription.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User purchase individual subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseIndividualSubscription"}

<section class="bg-primary py-8">
	<div class="container mx-auto">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitle="Purchase Individual Subscription"}

		<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
			{translate key="user.subscriptions.purchaseIndividualSubscription"}
		</h1>

	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="flex justify-center items-center">
			<form class="w-full max-w-lg bg-gray-50 rounded shadow p-8 purchase_subscription" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path="individual"|to_array:$subscriptionId}">
		{csrf}

			<div class="fields space-y-6">
				<div class="subscription_type">
					<label class="block font-semibold mb-1">
						{translate key="user.subscriptions.form.typeId"}
					</label>

					<select class="border rounded px-3 py-2 w-full" name="typeId" id="typeId" onchange="yesnoCheck(this);">
										{foreach name=types from=$subscriptionTypes key=thisTypeId item=subscriptionType}
							<option value="{$thisTypeId|escape}"{if $typeId == $thisTypeId} selected{/if}>{$subscriptionType|escape}</option>
										{/foreach}
					</select>

				</div>
				<div class="subscription_membership hidden" id="membership">
					<label class="block font-semibold mb-1">
						{translate key="user.subscriptions.form.membership"}
					</label>
					<input class="border rounded px-3 py-2 w-full" type="text" name="membership"  value="{$membership|escape}">

				</div>
				<div class="buttons field">
					<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" type="submit">
                        {translate key="common.save"}
					</button>
				</div>
			</div>

	</form>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
