{**
 * templates/subscriptions/userInstitutionalSubscriptionForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User purchase institutional subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseInstitutionalSubscription"}

<section class="bg-primary py-8">

	<div class="container max-w-7xl mx-auto">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseInstitutionalSubscription"}

		<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
			{translate key="user.subscriptions.purchaseInstitutionalSubscription"}
		</h1>

	</div>

</section>


<section class="bg-white py-12">
	<div class="container max-w-7xl mx-auto">
		<div class="flex justify-center items-center">
			<form class="w-full max-w-lg bg-gray-50 rounded shadow p-8 purchase_subscription" method="post" id="subscriptionForm" action="{url op=\"payPurchaseSubscription\" path=$formPath}">
				{csrf}

				{if $isError}
					<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4 rounded">
						{include file="common/formErrors.tpl"}
					</div>
				{/if}

				<div class="fields space-y-6">
					<div class="subscription_type">
						<label class="block font-semibold mb-1">
							{translate key="user.subscriptions.form.typeId"}
							<span class="text-red-600">*</span>
						</label>

						<select name="typeId" id="typeId" class="border rounded px-3 py-2 w-full" required>
							{foreach name=types from=$subscriptionTypes item=subscriptionType}
								<option value="{$subscriptionType->getId()}"{if $typeId == $subscriptionType->getId()} selected{/if}>{$subscriptionType->getLocalizedName()|escape}</option>
							{/foreach}
						</select>

					</div>
					<div class="subscription_institution">
						<label class="block font-semibold mb-1">
							{translate key="user.subscriptions.form.institutionName"}
						</label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="institutionName" id="institutionName" value="{$institutionName|escape}">
					</div>
					<div class="subscription_address">
						<label class="block font-semibold mb-1">
							{translate key="user.subscriptions.form.institutionMailingAddress"}
						</label>
						<textarea class="border rounded px-3 py-2 w-full" name="institutionMailingAddress" id="institutionMailingAddress">{$institutionMailingAddress|escape}</textarea>
					</div>
					<div class="subscription_domain">
						<label class="block font-semibold mb-1">
							{translate key="user.subscriptions.form.domain"}
						</label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="domain" id="domain" value="{$domain|escape}" aria-describedby="subscriptionDomainDescription">
						<p class="text-xs text-gray-500 mt-1" id="subscriptionDomainDescription">{translate key="user.subscriptions.form.domainInstructions"}</p>
					</div>
					<div class="subscription_ips">
						<label class="block font-semibold mb-1">
							{translate key="user.subscriptions.form.ipRange"}
						</label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="ipRanges" id="ipRanges" value="{$ipRanges|escape}" aria-describedby="subscriptionIPDescription">
						<p class="text-xs text-gray-500 mt-1" id="subscriptionIPDescription">{translate key="user.subscriptions.form.ipRangeInstructions"}</p>
					</div>
					<div class="flex gap-4 mt-6">
						<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-1/2" type="submit">
							{translate key="common.continue"}
						</button>
						<a class="inline-block px-4 py-2 border border-red-500 text-red-600 rounded hover:bg-red-500 hover:text-white transition w-1/2 text-center" href="{url page=\"user\" op=\"subscriptions\"}">
							{translate key="common.cancel"}
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
