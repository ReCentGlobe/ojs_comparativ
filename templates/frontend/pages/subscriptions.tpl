{**
 * templates/frontend/pages/subscriptions.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal Subscriptions.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="about.subscriptions"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.subscriptions"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Subscriptions
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
<div class="uk-container">
	<div uk-grid>

		<div class="uk-width-1-1">
    	{include file="frontend/components/subscriptionContact.tpl"}
		</div>

		<div class="uk-width-1-1">
			<h4 class="uk-h4 uk-heading-bullet">ENIUGH Membership Options</h4>
		</div>


    {if !$individualSubscriptionTypes->wasEmpty()}
			<div class="subscriptions_individual uk-width-1-1">
				<h4 class="uk-h4 uk-heading-bullet">{translate key="about.subscriptions.individual"}</h4>
				<p class="uk-text-danger">{translate key="subscriptions.individualDescription"}
					{if !$isUserLoggedIn}
						<a href="/v2/user/register" class="uk-button uk-button-small uk-button-default">Register</a>

						<a href="/v2/login" class="uk-button uk-button-small uk-button-default">Login</a>
					{/if}
				</p>

				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-hover uk-table-divider uk-table-justify uk-table-middle">
					<tr>
						<th>{translate key="about.subscriptionTypes.name"}</th>
						<th>{translate key="about.subscriptionTypes.format"}</th>
						<th>{translate key="about.subscriptionTypes.duration"}</th>
						<th>{translate key="about.subscriptionTypes.cost"}</th>
					</tr>
									{iterate from=individualSubscriptionTypes item=subscriptionType}
						<tr>
							<td>
								<div class="subscription_name">
																	{$subscriptionType->getLocalizedName()|escape}
								</div>
								<div class="subscription_description">
																	{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
								</div>
							</td>
							<td>{translate key=$subscriptionType->getFormatString()}</td>
							<td>{$subscriptionType->getDurationYearsMonths()|escape}</td>
							<td>{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
						</tr>
									{/iterate}
				</table>
				</div>
				{if $isUserLoggedIn}
					<div class="subscriptions_individual_purchase field uk-margin">
						<a class="uk-button uk-button-default" href="{url page="user" op="purchaseSubscription" path="individual"}">
						<span class="icon">
								<i class="fa fa-shopping-cart"></i>
						</span>
							<span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
						</a>
					</div>
				{/if}
			</div>
    {/if}
	

		{if !$institutionalSubscriptionTypes->wasEmpty()}
			<div class="subscriptions_institutional uk-width-1-1">
				<h4 class="uk-h4 uk-heading-bullet">{translate key="about.subscriptions.institutional"}</h4>
				<p>{translate key="subscriptions.institutionalDescription"}
					{if !$isUserLoggedIn}
						<a href="/v2/user/register" class="uk-button uk-button-small uk-button-default">Register</a>

						<a href="/v2/login" class="uk-button uk-button-small uk-button-default">Login</a>
					{/if}
				</p>
				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-hover uk-table-divider uk-table-justify uk-table-middle">
						<tr>
							<th>{translate key="about.subscriptionTypes.name"}</th>
							<th>{translate key="about.subscriptionTypes.format"}</th>
							<th>{translate key="about.subscriptionTypes.duration"}</th>
							<th>{translate key="about.subscriptionTypes.cost"}</th>
						</tr>
									{iterate from=institutionalSubscriptionTypes item=subscriptionType}
							<tr>
								<td>
									<div class="subscription_name">
																	{$subscriptionType->getLocalizedName()|escape}
									</div>
									<div class="subscription_description">
																	{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
									</div>
								</td>
								<td>{translate key=$subscriptionType->getFormatString()}</td>
								<td>{$subscriptionType->getDurationYearsMonths()|escape}</td>
								<td>{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
							</tr>
									{/iterate}
					</table>
				</div>
						{if $isUserLoggedIn}
					<div class="subscriptions_institutional_purchase field uk-margin">
						<a class="uk-button uk-button-default" href="{url page="user" op="purchaseSubscription" path="institutional"}">
							<span class="icon">
									<i class="fa fa-shopping-cart"></i>
							</span>
							<span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
						</a>
					</div>
						{/if}
			</div>
		{/if}
	</div>

</div>
</section>

{include file="frontend/components/footer.tpl"}
