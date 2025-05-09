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

{capture assign="breadcrumbsHtml"}
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.mySubscriptions"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="user.subscriptions.mySubscriptions"}}

<section class="bg-white py-12">
    <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid">

            {if $individualSubscriptionTypesExist}
                <div class="subscriptions_individual col-span-1 mb-8">
                    <h4 class="text-lg font-bold border-b border-gray-200 pb-2">{translate key="user.subscriptions.individualSubscriptions"}</h4>
                    <p class="text-red-600">{translate key="subscriptions.individualDescription"}</p>
                    {if $userIndividualSubscription}
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <tr class="bg-gray-100">
                                    <th class="px-4 py-2">{translate key="user.subscriptions.form.typeId"}</th>
                                    <th class="px-4 py-2">{translate key="subscriptions.status"}</th>
                                    {if $paymentsEnabled}
                                        <th class="px-4 py-2"></th>
                                    {/if}
                                </tr>
                                <tr>
                                    <td class="px-4 py-2">{$userIndividualSubscription->getSubscriptionTypeName()|escape}</td>
                                    <td class="px-4 py-2">
                                        {assign var="subscriptionStatus" value=$userIndividualSubscription->getStatus()}
                                        {assign var="isNonExpiring" value=$userIndividualSubscription->isNonExpiring()}
                                        {if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
                                            <span class="text-red-600">{translate key="subscriptions.status.awaitingOnlinePayment"}</span>
                                        {elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
                                            <span class="text-red-600">{translate key="subscriptions.status.awaitingManualPayment"}</span>
                                        {elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
                                            <span class="text-red-600">{translate key="subscriptions.inactive"}</span>
                                        {else}
                                            {if $isNonExpiring}
                                                {translate key="subscriptionTypes.nonExpiring"}
                                            {else}
                                                {assign var="isExpired" value=$userIndividualSubscription->isExpired()}
                                                {if $isExpired}
                                                    <span class="text-red-600">{translate key="user.subscriptions.expired" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}</span>
                                                {else}
                                                    <span class="text-green-600">{translate key="user.subscriptions.expires" date=$userIndividualSubscription->getDateEnd()|date_format:$dateFormatShort}</span>
                                                {/if}
                                            {/if}
                                        {/if}
                                    </td>
                                    {if $paymentsEnabled}
                                        <td class="px-4 py-2">
                                            {if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
                                                <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="completePurchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">{translate key="user.subscriptions.purchase"}</a>
                                            {elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
                                                {if !$isNonExpiring}
                                                    <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="payRenewSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">{translate key="user.subscriptions.renew"}</a>
                                                {/if}
                                                <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="purchaseSubscription" path="individual"|to_array:$userIndividualSubscription->getId()}">{translate key="user.subscriptions.purchase"}</a>
                                            {/if}
                                        </td>
                                    {/if}
                                </tr>
                            </table>
                        </div>
                    {elseif $paymentsEnabled}
                        <div class="mt-4">
                            <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="purchaseSubscription" path="individual"}">{translate key="user.subscriptions.purchaseNewSubscription"}</a>
                        </div>
                    {else}
                        <p>
                            <a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">{translate key="user.subscriptions.viewSubscriptionTypes"}</a>
                        </p>
                    {/if}
                </div>
            {/if}


            {if $institutionalSubscriptionTypesExist}
                <div class="subscriptions_institutional col-span-1 mb-8">
                    <h4 class="text-lg font-bold border-b border-gray-200 pb-2">{translate key="user.subscriptions.institutionalSubscriptions"}</h4>
                    <p>{translate key="subscriptions.institutionalDescription"}
                        {if $paymentsEnabled}
                            {translate key="subscriptions.institutionalOnlinePaymentDescription"}
                        {/if}
                    </p>
                    {if $userInstitutionalSubscriptions}
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <tr class="bg-gray-100">
                                    <th class="px-4 py-2">{translate key="user.subscriptions.form.typeId"}</th>
                                    <th class="px-4 py-2">{translate key="user.subscriptions.form.institutionName"}</th>
                                    <th class="px-4 py-2">{translate key="subscriptions.status"}</th>
                                    {if $paymentsEnabled}
                                        <th class="px-4 py-2"></th>
                                    {/if}
                                </tr>
                                {foreach from=$userInstitutionalSubscriptions item=userInstitutionalSubscription}
                                    <tr>
                                        <td class="px-4 py-2">{$userInstitutionalSubscription->getSubscriptionTypeName()|escape}</td>
                                        <td class="px-4 py-2">{$userInstitutionalSubscription->institutionName|escape}</td>
                                        <td class="px-4 py-2">
                                            {assign var="subscriptionStatus" value=$userInstitutionalSubscription->getStatus()}
                                            {assign var="isNonExpiring" value=$userInstitutionalSubscription->isNonExpiring()}
                                            {if $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
                                                <span class="text-red-600">{translate key="subscriptions.status.awaitingOnlinePayment"}</span>
                                            {elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_MANUAL_PAYMENT}
                                                <span class="text-red-600">{translate key="subscriptions.status.awaitingManualPayment"}</span>
                                            {elseif $paymentsEnabled && $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_NEEDS_APPROVAL}
                                                <span class="text-red-600">{translate key="subscriptions.status.needsApproval"}</span>
                                            {elseif $subscriptionStatus != $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
                                                <span class="text-red-600">{translate key="subscriptions.inactive"}</span>
                                            {else}
                                                {if $isNonExpiring}
                                                    <span class="text-green-600">{translate key="subscriptionTypes.nonExpiring"}</span>
                                                {else}
                                                    {assign var="isExpired" value=$userInstitutionalSubscription->isExpired()}
                                                    {if $isExpired}
                                                        <span class="text-red-600">{translate key="user.subscriptions.expired" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}</span>
                                                    {else}
                                                        <span class="text-green-600">{translate key="user.subscriptions.expires" date=$userInstitutionalSubscription->getDateEnd()|date_format:$dateFormatShort}</span>
                                                    {/if}
                                                {/if}
                                            {/if}
                                        </td>
                                        {if $paymentsEnabled}
                                            <td class="px-4 py-2">
                                                {if $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_AWAITING_ONLINE_PAYMENT}
                                                    <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="completePurchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">{translate key="user.subscriptions.purchase"}</a>
                                                {elseif $subscriptionStatus == $smarty.const.SUBSCRIPTION_STATUS_ACTIVE}
                                                    {if !$isNonExpiring}
                                                        <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="payRenewSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">{translate key="user.subscriptions.renew"}</a>
                                                    {/if}
                                                    <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url op="purchaseSubscription" path="institutional"|to_array:$userInstitutionalSubscription->getId()}">{translate key="user.subscriptions.purchase"}</a>
                                                {/if}
                                            </td>
                                        {/if}
                                    </tr>
                                {/foreach}
                            </table>
                        </div>
                    {/if}
                    <p class="field mt-4">
                        {if $paymentsEnabled}
                            <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url page="user" op="purchaseSubscription" path="institutional"}">
                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                <span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
                            </a>
                        {else}
                            <a href="{url page="about" op="subscriptions" anchor="subscriptionTypes"}">{translate key="user.subscriptions.viewSubscriptionTypes"}</a>
                        {/if}
                    </p>
                </div>
            {/if}


            {if $paymentsEnabled}
                <div class="my_subscription_payments col-span-1 mb-8">
                    <h4 class="text-lg font-bold border-b border-gray-200 pb-2">{translate key="user.subscriptions.subscriptionStatus"}</h4>
                    <p>{translate key="user.subscriptions.statusInformation"}</p>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <tr class="bg-gray-100">
                                <th class="px-4 py-2">{translate key="user.subscriptions.status"}</th>
                                <th class="px-4 py-2">{translate key="user.subscriptions.statusDescription"}</th>
                            </tr>
                            <tr>
                                <td class="px-4 py-2">{translate key="subscriptions.status.needsInformation"}</td>
                                <td class="px-4 py-2">{translate key="user.subscriptions.status.needsInformationDescription"}</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-2">{translate key="subscriptions.status.needsApproval"}</td>
                                <td class="px-4 py-2">{translate key="user.subscriptions.status.needsApprovalDescription"}</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-2">{translate key="subscriptions.status.awaitingManualPayment"}</td>
                                <td class="px-4 py-2">{translate key="user.subscriptions.status.awaitingManualPaymentDescription"}</td>
                            </tr>
                            <tr>
                                <td class="px-4 py-2">{translate key="subscriptions.status.awaitingOnlinePayment"}</td>
                                <td class="px-4 py-2">{translate key="user.subscriptions.status.awaitingOnlinePaymentDescription"}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            {/if}
        </div>

        <div class="col-span-1 mb-8">
            {include file="frontend/components/subscriptionContact.tpl"}
        </div>
    </div>
</section>

{include file="frontend/components/footer.tpl"}
