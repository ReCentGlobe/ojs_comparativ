{**
 * plugins/blocks/subscription/block.tpl
 *
 * Copyright (c) 2013-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the logged-in user's subscriptions
 *
 *}
{if $individualSubscription}
	{assign var=individualSubscriptionValid value=$individualSubscription->isValid()}
	{assign var=subscriptionStatus value=$individualSubscription->getStatus()}
{/if}
{if $institutionalSubscription}
<div class="pkp_block block_subscription">
	<div class="uk-container uk-container-small uk-text-center">
			<p>
				{translate key="plugins.block.subscription.providedBy" institutionName=$institutionalSubscription->getInstitutionName()|escape}
			</p>
	</div>
</div>
{/if}
