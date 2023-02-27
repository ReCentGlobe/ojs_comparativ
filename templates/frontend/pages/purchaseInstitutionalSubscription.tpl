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

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseInstitutionalSubscription"}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			{translate key="user.subscriptions.purchaseInstitutionalSubscription"}
		</h1>

	</div>

</section>


<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1 uk-first-column uk-flex uk-flex-middle uk-flex-center">
				{assign var="formPath" value="institutional"}
				{if $subscriptionId}
					{assign var="formPath" value="institutional"|to_array:$subscriptionId}
				{/if}
			</div>
			<div class="uk-width-1-1 uk-first-column uk-flex uk-flex-middle uk-flex-center">
				<form class="purchase_subscription uk-form-stacked" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path=$formPath}">
					{csrf}

					{if $isError}
						<div class="uk-alert-warning" uk-alert>
							{include file="common/formErrors.tpl"}
						</div>
					{/if}


					<div class="fields">
						<div class="subscription_type uk-margin">
							<label class="uk-form-label">
								{translate key="user.subscriptions.form.typeId"}
								<span class="required">*</span>
							</label>

							<select name="typeId" id="typeId" class="uk-select" required>
								{foreach name=types from=$subscriptionTypes item=subscriptionType}
									<option value="{$subscriptionType->getId()}"{if $typeId == $subscriptionType->getId()} selected{/if}>{$subscriptionType->getLocalizedName()|escape}</option>
								{/foreach}
							</select>

						</div>
{*						<div class="subscription_membership uk-margin">
							<label class="uk-form-label">
								{translate key="user.subscriptions.form.membership"}
							</label>
							<input class="uk-input" type="text" name="membership" id="membership" value="{$membership|escape}" aria-describedby="subscriptionMembershipDescription">
							<p class="help" id="subscriptionMembershipDescription">{translate key="user.subscriptions.form.membershipInstructions"}</p>
						</div>*}
						<div class="subscription_institution uk-margin">
							<label class="uk-form-label">
								{translate key="user.subscriptions.form.institutionName"}
							</label>
							<input class="uk-input" type="text" name="institutionName" id="institutionName" value="{$institutionName|escape}">
						</div>
						<div class="subscription_address uk-margin">
							<label class="uk-form-label">
								{translate key="user.subscriptions.form.institutionMailingAddress"}
							</label>
							<textarea class="uk-textarea" name="institutionMailingAddress" id="institutionMailingAddress">{$institutionMailingAddress|escape}</textarea>
						</div>
						<div class="subscription_domain uk-margin">
							<label class="uk-form-label">
								{translate key="user.subscriptions.form.domain"}
							</label>
							<input class="uk-input" type="text" name="domain" id="domain" value="{$domain|escape}" aria-describedby="subscriptionDomainDescription">
							<p class="help" id="subscriptionDomainDescription">{translate key="user.subscriptions.form.domainInstructions"}</p>
						</div>
						<div class="subscription_ips uk-margin">
							<label class="uk-formlabel">
								{translate key="user.subscriptions.form.ipRange"}
							</label>
							<input class="uk-input" type="text" name="ipRanges" id="ipRanges" value="{$ipRanges|escape}" aria-describedby="subscriptionIPDescription">
							<p class="help" id="subscriptionIPDescription">{translate key="user.subscriptions.form.ipRangeInstructions"}</p>
						</div>
						<div class="uk-margin uk-flex uk-flex-center uk-text-center" uk-grid>
							<div class="uk-width-1-2">
								<button class="uk-button uk-button-primary submit" type="submit">
									{translate key="common.continue"}
								</button>
							</div>
							<div class="uk-width-1-2">
								<a class="uk-button uk-button-danger is-outlined" href="{url page="user" op="subscriptions"}">
									{translate key="common.cancel"}
								</a>
							</div>
						</div>
					</div>




				</form>

			</div>
		</div>


	</div>
</section>

{include file="frontend/components/footer.tpl"}
