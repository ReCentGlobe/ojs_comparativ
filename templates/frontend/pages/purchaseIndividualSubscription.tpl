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

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitle="Purchase Individual Subscription"}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			{translate key="user.subscriptions.purchaseIndividualSubscription"}
		</h1>

	</div>

</section>

<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1 uk-first-column uk-flex uk-flex-middle uk-flex-center">
				<form class="uk-form-stacked purchase_subscription" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path="individual"|to_array:$subscriptionId}">
		{csrf}

			<div class="fields">
				<div class="subscription_type uk-margin">
					<label class="uk-form-label">
							{translate key="user.subscriptions.form.typeId"}
					</label>

					<select class="uk-select" name="typeId" id="typeId" onchange="yesnoCheck(this);">
													{foreach name=types from=$subscriptionTypes key=thisTypeId item=subscriptionType}
							<option value="{$thisTypeId|escape}"{if $typeId == $thisTypeId} selected{/if}>{$subscriptionType|escape}</option>
													{/foreach}
					</select>

				</div>
				<div class="subscription_membership uk-hidden" id="membership" uk-margin">
					<label class="uk-form-label">
							{translate key="user.subscriptions.form.membership"}
					</label>

					<input class="uk-input" type="text" name="membership"  value="{$membership|escape}">

				</div>
				<div class="buttons field uk-margin">
					<button class="uk-button uk-button-default" type="submit">
                        {translate key="common.save"}
					</button>
				</div>
			</div>

	</form>
			</div>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
