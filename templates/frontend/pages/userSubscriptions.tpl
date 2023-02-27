{**
 * templates/frontend/pages/userSubscriptions.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Page where users can view and manage their subscriptions.
 *
 * @uses $paymentsEnabled boolean
 * @uses $individualSubscriptionTypesExist boolean Have any individual
 *       subscription types been created?
 * @uses $userIndividualSubscription IndividualSubscription
 * @uses $institutionalSubscriptionTypesExist boolean Have any institutional
 *			subscription types been created?
 * @uses $userInstitutionalSubscriptions array
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.mySubscriptions"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.mySubscriptions"}
		<h1 class="uk-h2 uk-margin-remove-top">
			My Subscriptions
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			{if $individualSubscriptionTypesExist}
			<div class="my_subscription_individual uk-width-1-1">
				<h4 class="uk-h4 uk-heading-bullet">{translate key="user.subscriptions.individualSubscriptions"}</h4>
				<p>{translate key="subscriptions.individualDescription"}</p>
							{if $userIndividualSubscription}
								<div class="uk-overflow-auto">
									<table class="uk-table uk-table-hover uk-table-divider uk-table-justify uk-table-middle">
										<thead>
											<tr>
												<th>{translate key="user.subscriptions.form.typeId"}</th>
												<th>{translate key="subscriptions.status"}</th>
												{if $paymentsEnabled}
													<th></th>
												{/if}
											</tr>
										</thead>
										<tr>
											<td>{$userIndividualSubscription->getSubscriptionTypeName()|escape}</td>
											<td>
																			{assign var="subscriptionStatus" value=$userIndividualSubscription->getStatus()}
																			{assign var="isNonExpiring" value=$userIndividualSubscription->isNonExpiring()}
																			{if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
													<span class="subscription_disabled">
														{translate key="subscriptions.status.awaitingOnlinePayment"}
													</span>
																			{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
													<span class="subscription_disabled">
														{translate key="subscriptions.status.awaitingManualPayment"}
													</span>
																			{elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
													<span class="subscription_disabled">
														{translate key="subscriptions.inactive"}
													</span>
																			{else}
																					{if $isNonExpiring}
																							{translate key="subscriptionTypes.nonExpiring"}
																					{else}
																							{assign var="isExpired" value=$userIndividualSubscription->isExpired()}
																							{if $isExpired}
															<span class="subscription_disabled">
																{translate key="user.subscriptions.expired" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}
															</span>
																							{else}
															<span class="subscription_active">
																{translate key="user.subscriptions.expires" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}
															</span>
																							{/if}
																					{/if}
																			{/if}
											</td>
																	{if $paymentsEnabled}
												<td>

															{if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
																<a class="uk-button uk-button-default" href="{url op="completePurchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
																	{translate key="user.subscriptions.purchase"}
																</a>
															{elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
																{if !$isNonExpiring}
																	<a class="uk-button uk-button-default" href="{url op="payRenewSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
																		{translate key="user.subscriptions.renew"}
																	</a>
																{/if}
																<a class="uk-button uk-button-default" href="{url op="purchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">
																	{translate key="user.subscriptions.purchase"}
																</a>
															{/if}

												</td>
																	{/if}
										</tr>
									</table>
								</div>
							{elseif $paymentsEnabled}
					<div class="uk-margin">
						<a class="uk-button uk-button-default" href="{url op="purchaseSubscription" path="individual"}">
													{translate key="user.subscriptions.purchaseNewSubscription"}
						</a>
					</div>
							{else}
					<p>
						<a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">
													{translate key="user.subscriptions.viewSubscriptionTypes"}
						</a>
					</p>
							{/if}
			</div>
			{/if}

			{if $institutionalSubscriptionTypesExist}
			<div class="my_subscriptions_institutional uk-width-1-1">
				<h4 class="uk-h4 uk-heading-bullet">{translate key="user.subscriptions.institutionalSubscriptions"}</h4>
				<p>
									{translate key="subscriptions.institutionalDescription"}
									{if $paymentsEnabled}
											{translate key="subscriptions.institutionalOnlinePaymentDescription"}
									{/if}
				</p>
							{if $userInstitutionalSubscriptions}
								<div class="uk-overflow-auto">
									<table class="uk-table uk-table-hover uk-table-divider uk-table-justify uk-table-middle">
										<thead>
											<tr>
												<th>{translate key="user.subscriptions.form.typeId"}</th>
												<th>{translate key="user.subscriptions.form.institutionName"}</th>
												<th>{translate key="subscriptions.status"}</th>
												{if $paymentsEnabled}
													<th></th>
												{/if}
											</tr>
										</thead>
															{iterate from=userInstitutionalSubscriptions item=userInstitutionalSubscription}
											<tbody>
												<tr>
												<td>{$userInstitutionalSubscription->getSubscriptionTypeName()|escape}</td>
												<td>{$userInstitutionalSubscription->getInstitutionName()|escape}</td>
												<td>
																					{assign var="subscriptionStatus" value=$userInstitutionalSubscription->getStatus()}
																					{assign var="isNonExpiring" value=$userInstitutionalSubscription->isNonExpiring()}
																					{if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
														<span class="subscription_disabled">
															{translate key="subscriptions.status.awaitingOnlinePayment"}
														</span>
																					{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
														<span class="subscription_disabled">
															{translate key="subscriptions.status.awaitingManualPayment"}
														</span>
																					{elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_NEEDS_APPROVAL}
														<span class="subscription_disabled">
															{translate key="subscriptions.status.needsApproval"}
														</span>
																					{elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
														<span class="subscription_disabled">
															{translate key="subscriptions.inactive"}
														</span>
																					{else}
																							{if $isNonExpiring}
															<span class="subscription_active">
																{translate key="subscriptionTypes.nonExpiring"}
															</span>
																							{else}
																									{assign var="isExpired" value=$userInstitutionalSubscription->isExpired()}
																									{if $isExpired}
																<span class="subscription_disabled">
																	{translate key="user.subscriptions.expired" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}
																</span>
																									{else}
																<span class="subscription_enabled">
																	{translate key="user.subscriptions.expires" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}
																</span>
																									{/if}
																							{/if}
																					{/if}
												</td>
																			{if $paymentsEnabled}
													<td>
																{if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
																	<a class="uk-button uk-button-default" href="{url op="completePurchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
																		{translate key="user.subscriptions.purchase"}
																	</a>
																{elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
																	{if !$isNonExpiring}
																		<a class="uk-button uk-button-default" href="{url op="payRenewSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
																			{translate key="user.subscriptions.renew"}
																		</a>
																	{/if}
																	<a class="uk-button uk-button-default" href="{url op="purchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">
																		{translate key="user.subscriptions.purchase"}
																	</a>
																{/if}
													</td>
																			{/if}
											</tr>
											</tbody>
															{/iterate}
									</table>
								</div>
							{/if}
				<p class="field">
									{if $paymentsEnabled}
						<a class="uk-button uk-button-default" href="{url page="user" op="purchaseSubscription" path="institutional"}">
							<span class="icon">
								<i class="fa fa-shopping-cart"></i>
							</span>
							<span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
						</a>
									{else}
						<a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">
													{translate key="user.subscriptions.viewSubscriptionTypes"}
						</a>
									{/if}
				</p>
			</div>
			{/if}


			{if $paymentsEnabled}
					<div class="my_subscription_payments uk-width-1-1">
						<h4 class="uk-h4 uk-heading-bullet">{translate key="user.subscriptions.subscriptionStatus"}</h4>
						<p>{translate key="user.subscriptions.statusInformation"}</p>
						<div class="uk-overflow-auto">
							<table class="uk-table uk-table-divider uk-table-justify uk-table-middle">
							<tr>
								<th>{translate key="user.subscriptions.status"}</th>
								<th>{translate key="user.subscriptions.statusDescription"}</th>
							</tr>
							<tr>
								<td>{translate key="subscriptions.status.needsInformation"}</td>
								<td>{translate key="user.subscriptions.status.needsInformationDescription"}</td>
							</tr>
							<tr>
								<td>{translate key="subscriptions.status.needsApproval"}</td>
								<td>{translate key="user.subscriptions.status.needsApprovalDescription"}</td>
							</tr>
							<tr>
								<td>{translate key="subscriptions.status.awaitingManualPayment"}</td>
								<td>{translate key="user.subscriptions.status.awaitingManualPaymentDescription"}</td>
							</tr>
							<tr>
								<td>{translate key="subscriptions.status.awaitingOnlinePayment"}</td>
								<td>{translate key="user.subscriptions.status.awaitingOnlinePaymentDescription"}</td>
							</tr>
						</table>
						</div>
					</div>
			{/if}
		</div>

	{include file="frontend/components/subscriptionContact.tpl"}


	</div>
</section>

{include file="frontend/components/footer.tpl"}
