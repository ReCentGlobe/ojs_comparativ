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
<div id="subscription-block" class="pkp_block block_subscription fixed bottom-0 right-0 w-full max-w-full sm:bottom-4 sm:right-4 sm:max-w-md md:w-96 z-50 bg-white/95 border-t border-gray-200 shadow-lg sm:rounded-lg p-3 sm:p-4 backdrop-blur-sm transition-all duration-300">
	<h2 class="title text-base font-semibold text-primary mb-2">{translate key="plugins.block.subscription.blockTitle"}</h2>
	<button id="hide-subscription-block" type="button" aria-label="Hide subscription info" class="absolute top-2 right-2 text-gray-400 hover:text-gray-700 text-2xl leading-none bg-transparent border-none p-0 m-0 cursor-pointer sm:text-xl" style="background: none;">
		&times;
	</button>
	<div class="content text-xs sm:text-sm text-gray-800">
		{if $institutionalSubscription}
			<p>
				{translate key="plugins.block.subscription.providedBy" institutionName=$institution->getLocalizedName()|escape}
			</p>
			<p>
				{translate key="plugins.block.subscription.comingFromIP" ip=$userIP|escape}
			</p>
		{elseif $individualSubscription}
			<p class="subscription_name">
				{$individualSubscription->getSubscriptionTypeName()|escape}
			</p>
			{if $individualSubscription->getMembership()}
				<p class="subscription_membership">({$individualSubscription->getMembership()|escape})</p>
			{/if}
			{if $paymentsEnabled && $acceptSubscriptionPayments && $subscriptionStatus == \APP\subscription\Subscription::SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
				<p class="subscription_disabled">{translate key="subscriptions.status.awaitingOnlinePayment"}</p>
			{elseif $paymentsEnabled && $acceptSubscriptionPayments && $subscriptionStatus == \APP\subscription\Subscription::SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
				<p class="subscription_disabled">{translate key="subscriptions.status.awaitingManualPayment"}</p>
			{elseif $individualSubscription->isNonExpiring()}
				<p class="subscription_active">{translate key="subscriptionTypes.nonExpiring"}</p>
			{elseif $individualSubscription->isExpired()}
				<p class="subscription_disabled">{translate key="user.subscriptions.expired" date=$individualSubscription->getDateEnd()|date_format:$dateFormatShort}</p>
			{else}
				<p class="subscription_active">{translate key="user.subscriptions.expires" date=$individualSubscription->getDateEnd()|date_format:$dateFormatShort}</p>
			{/if}
		{elseif !$userLoggedIn}
			<p>{translate key="plugins.block.subscription.loginToVerifySubscription"}</p>
		{/if}
		{if $userLoggedIn}
			<p>
				{if $institutionalSubscription || $individualSubscription}
					<a href="{url page="user" op="subscriptions"}">{translate key="user.subscriptions.mySubscriptions"}</a>
				{else}
					{translate key="plugins.block.subscription.subscriptionRequired"}
					<a href="{url page="about" op="subscriptions"}">{translate key="plugins.block.subscription.subscriptionRequired.learnMore"}</a>
				{/if}
			</p>
		{/if}
	</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
  var btn = document.getElementById('hide-subscription-block');
  var block = document.getElementById('subscription-block');
  if (btn && block) {
	btn.addEventListener('click', function() {
	  block.style.display = 'none';
	});
  }
});
</script>
</div>
